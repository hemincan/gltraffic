package com.can.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

import com.can.configure.UploadPath;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.can.myapi.ImageProcess;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 发表新贴子
 */
public class NewTopicAction extends ActionSupport {
	private String userid;
	private String topicTiltle;
	private String topicContent;
	private Timestamp topicPublicTime;
	private String topicType;
	private String topicLocation;
	// 文件
	private List<File> images;
	// myFileContentType属性用来封装上传文件的类型
	private List<String> imagesContentType;
	// myFileFileName属性用来封装上传文件的文件名
	private List<String> imagesFileName;

	public String execute() throws Exception {
		// System.out.println("this.getImagesFileName()"
		// + this.getImagesFileName().get(0));
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		if (userid == null || "".equals(userid)) {
			System.out.println("用户没有登录！");
			return "success";
		}
		UserDAO userdao = new UserDAO();
		User user = new User();
		user.setUserId(userid);
		List userlist = userdao.findByExample(user);
		if (!userlist.isEmpty()) {
			String imgString = "";
			String uploadPath;
			String imagename;
			if (images != null) {
				for (int i = 0; i < images.size(); i++) {
					// 获取文件的后缀名
					String prefix = imagesFileName.get(i).substring(
							imagesFileName.get(i).lastIndexOf("."));
					System.out.println("prefix：  " + prefix);
					// System.out.println("imagesContentType.get(i): "+imagesContentType.get(i));
					InputStream in = new FileInputStream(images.get(i));
					// uploadPath =
					// ServletActionContext.getServletContext().getRealPath("/upload/"+userid);
					uploadPath = UploadPath.getuploadpath() + "/" + userid;

					// 想要存在别的地方只能存在文件服务器，不然，链接无法访问到资源
					// System.out.println("uploadPath" + uploadPath);
					File file = new File(uploadPath);
					if (!file.exists() && !file.isDirectory()) {
						System.out.println("目录不存在，需要创建");
						file.mkdirs();
					}
					imagename = UUID.randomUUID().toString() + prefix;
					File toFile = new File(uploadPath, imagename);
					OutputStream os = new FileOutputStream(toFile);

					// 如果图片够大才压缩

					if ((prefix.equals(".jpg") || prefix.equals(".png"))) {
						// 使用这个类进行图片压缩
						ImageProcess imageProcess = new ImageProcess(in,
								imagename);
						byte[] b = imageProcess.resizeByWidth(1000);
						os.write(b);
					} else {// 不是上面那两种格式的图片就不用压缩

						byte[] buffer = new byte[1024];
						int length = 0;
						// 读取myFile文件输出到toFile文件中
						while ((length = in.read(buffer)) > 0) {
							os.write(buffer, 0, length);
						}
					}
					os.flush();
					os.close();
					in.close();
					System.out.println("文件保存成功" + imagesContentType);
					imgString = imgString + imagename + "|";
				}
			}
			user = (User) userlist.get(0);
			TopicDAO topicdao = new TopicDAO();
			if (topicTiltle == null) {
				topicTiltle = "";
			}
			if (topicContent == null) {
				topicContent = "";
			}
			if (topicType == null) {
				topicType = "其他";
			}
			if (topicLocation == null) {
				topicLocation = "其他";
			}
			Topic topic = new Topic();
			topic.setUser(user);
			topic.setTopicTiltle(topicTiltle);

			//String reg = "(http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&*=]*))";
			topicContent = topicContent.replaceAll("(http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+[:]?([\\w-./?%&*=]*))","<a href='$1' target= \"_blank\">$1</a>");
           

			topic.setTopicContent(topicContent);
			topic.setTopicImages(imgString);
			topic.setTopicType(topicType);
			topic.setTopicEgg(0);
			topic.setTopicReaded(0);
			topic.setTopicState(0);
			topic.setTopicLocation(topicLocation);
			topicdao.save(topic);
			Transaction tx = topicdao.getSession().beginTransaction();
			tx.commit();
			System.out.println("帖子发布成功！");
			topicdao.getSession().close();
		}

		// System.out.println("userid:" + session.get("userid"));
		// System.out.println("topicTiltle:" + topicTiltle);
		// System.out.println("topicContent:" + topicContent);
		// System.out.println("topicContent:" + topicType);
		return "success";
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTopicTiltle() {
		return topicTiltle;
	}

	public void setTopicTiltle(String topicTiltle) {
		this.topicTiltle = topicTiltle;
	}

	public String getTopicContent() {
		return topicContent;
	}

	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}

	public Timestamp getTopicPublicTime() {
		return topicPublicTime;
	}

	public void setTopicPublicTime(Timestamp topicPublicTime) {
		this.topicPublicTime = topicPublicTime;
	}

	public String getTopicType() {
		return topicType;
	}

	public void setTopicType(String topicType) {
		this.topicType = topicType;
	}

	public List<File> getImages() {
		return images;
	}

	public void setImages(List<File> images) {
		this.images = images;
	}

	public List<String> getImagesContentType() {
		return imagesContentType;
	}

	public void setImagesContentType(List<String> imagesContentType) {
		this.imagesContentType = imagesContentType;
	}

	public List<String> getImagesFileName() {
		return imagesFileName;
	}

	public void setImagesFileName(List<String> imagesFileName) {
		this.imagesFileName = imagesFileName;
	}

	public String getTopicLocation() {
		return topicLocation;
	}

	public void setTopicLocation(String topicLocation) {
		this.topicLocation = topicLocation;
	}

}
