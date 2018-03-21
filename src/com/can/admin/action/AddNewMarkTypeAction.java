package com.can.admin.action;

import java.io.File;
import java.util.Map;

import com.can.hibernate.Marktype;
import com.can.hibernate.MarktypeDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 
 * 增加新的交通标志类型
 */
public class AddNewMarkTypeAction extends ActionSupport {
	private Marktype type;

	// 文件
	private File images;

	// myFileContentType属性用来封装上传文件的类型
	private String imagesContentType;
	// myFileFileName属性用来封装上传文件的文件名
	private String imagesFileName;

	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		System.out.println(imagesFileName);
		MarktypeDAO mdao=new MarktypeDAO();
		mdao.save(type);
		mdao.getSession().beginTransaction().commit();
		return "success";
	}

	public Marktype getType() {
		return type;
	}

	public void setType(Marktype type) {
		this.type = type;
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

}
