package com.can.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.can.hibernate.IndexBanner;
import com.can.hibernate.IndexBannerDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 
 * 上传新的首页宣传Banner
 */
public class BannerImagesUploadAction extends ActionSupport {
	
	// 文件
		private File images;
		// myFileContentType属性用来封装上传文件的类型
		private String imagesContentType;
		// myFileFileName属性用来封装上传文件的文件名
		private String imagesFileName;
		private String describe;
		private String id;
	public String execute() throws Exception {
		System.out.println(imagesContentType);
		System.out.println(imagesFileName);
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		
		if(images==null||id==null||"".equals(id)){
			return "fail";
		}
		IndexBannerDAO dao=new IndexBannerDAO();
		IndexBanner banner=dao.findById(Integer.parseInt(id));
		if(banner==null){
			return "fail";
		}
		//直接替换文件里的
		String filename=banner.getImage();
		
		InputStream in=new FileInputStream(images);
		String uploadPath = ServletActionContext.getServletContext().getRealPath("/indexbannerimages");
		File tofile=new File(uploadPath,filename);
		if (!tofile.exists() && !tofile.isDirectory()) {
			System.out.println("目录不存在，需要创建");
			tofile.mkdirs();
		}
		//System.out.println(uploadPath);
		OutputStream os=new FileOutputStream(tofile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = in.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		//System.out.println("保存成功");
		return "success";
	}

	public File getImages() {
		return images;
	}

	public void setImages(File images) {
		this.images = images;
	}

	public String getImagesContentType() {
		return imagesContentType;
	}

	public void setImagesContentType(String imagesContentType) {
		this.imagesContentType = imagesContentType;
	}

	public String getImagesFileName() {
		return imagesFileName;
	}

	public void setImagesFileName(String imagesFileName) {
		this.imagesFileName = imagesFileName;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
