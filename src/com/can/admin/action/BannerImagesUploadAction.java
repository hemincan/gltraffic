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
 * �ϴ��µ���ҳ����Banner
 */
public class BannerImagesUploadAction extends ActionSupport {
	
	// �ļ�
		private File images;
		// myFileContentType����������װ�ϴ��ļ�������
		private String imagesContentType;
		// myFileFileName����������װ�ϴ��ļ����ļ���
		private String imagesFileName;
		private String describe;
		private String id;
	public String execute() throws Exception {
		System.out.println(imagesContentType);
		System.out.println(imagesFileName);
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("��ͨ�û�")){
			System.out.println("�û�û�е�¼��");
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
		//ֱ���滻�ļ����
		String filename=banner.getImage();
		
		InputStream in=new FileInputStream(images);
		String uploadPath = ServletActionContext.getServletContext().getRealPath("/indexbannerimages");
		File tofile=new File(uploadPath,filename);
		if (!tofile.exists() && !tofile.isDirectory()) {
			System.out.println("Ŀ¼�����ڣ���Ҫ����");
			tofile.mkdirs();
		}
		//System.out.println(uploadPath);
		OutputStream os=new FileOutputStream(tofile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = in.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		//System.out.println("����ɹ�");
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
