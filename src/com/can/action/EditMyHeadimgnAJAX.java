package com.can.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import com.can.configure.UploadPath;
import com.can.myapi.ImageProcess;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * �༩ͷ���Action
 */
public class EditMyHeadimgnAJAX extends ActionSupport {
	
	private String result;
	private String image;
	private String userid;
	
	public String execute() throws Exception {
		//System.out.println(image);
		if(image==null){
			System.out.println("ͷ��Ϊ�գ�");
			result="{'code':1}";
			return SUCCESS;
		}
		String stmp[] =image.split(",");
		if(stmp.length!=2){
			System.out.println("ͷ��Base64��ȡʧ��");
			result="{'code':2}";
			return SUCCESS;
		}
		//������commons-codec-1.10
		byte[] b = Base64.decodeBase64(stmp[1]);
		// ��������
		for (int i = 0; i < b.length; ++i) {
			if (b[i] < 0) {
				b[i] += 256;
			}
		}
		//��session��ȡ���Ѿ���¼��userid��
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		if(userid==null || "".equals(userid)){
			System.out.println("�û�û��¼");
			result="{'code':3}";
			return SUCCESS;
		}
		
		String uploadPath;
		//uploadPath = ServletActionContext.getServletContext()
		//		.getRealPath("/upload/"+userid);
		uploadPath=UploadPath.getuploadpath()+"/"+userid;
		File file = new File(uploadPath);
		if (!file.exists() && !file.isDirectory()) {
			System.out.println("Ŀ¼�����ڣ���Ҫ����");
			file.mkdirs();
		}
		String headimagename="headimg.jpg";
		File tofile=new File(uploadPath,headimagename);
		OutputStream out = new FileOutputStream(tofile);
		
		//ѹ��ͷ��
		InputStream in=new ByteArrayInputStream(b);
		ImageProcess imageProcess = new ImageProcess(in,
				headimagename);
		byte[]  b2 = imageProcess.resizeByWidth(300);
		
		out.write(b2);
		out.flush();
		out.close();
		System.out.println("ͷ�񱣴�ɹ�");
		result="{'code':4}";
		return SUCCESS;
	}


	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
