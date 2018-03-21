package com.can.admin.action;

import java.io.File;
import java.util.Map;

import com.can.hibernate.Marktype;
import com.can.hibernate.MarktypeDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 
 * �����µĽ�ͨ��־����
 */
public class AddNewMarkTypeAction extends ActionSupport {
	private Marktype type;

	// �ļ�
	private File images;

	// myFileContentType����������װ�ϴ��ļ�������
	private String imagesContentType;
	// myFileFileName����������װ�ϴ��ļ����ļ���
	private String imagesFileName;

	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("��ͨ�û�")){
			System.out.println("�û�û�е�¼��");
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
