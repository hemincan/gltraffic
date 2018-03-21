package com.can.action;

import java.util.List;
import java.util.Map;

import com.can.hibernate.Messageboard;
import com.can.hibernate.MessageboardDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewMessBoardActionAJAX extends ActionSupport {
	private String result;
	private Messageboard messboard;
	private String touserid;

	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		if (userid == null || "".equals(userid)) {
			System.out.println("�û�û�е�¼��");
			result = "{'code':1}";
			return SUCCESS;
		}
		// ˭Ҫ����
		System.out.println(touserid + userid + messboard.getMessbContent());
		UserDAO dao = new UserDAO();
		List<User> l = dao.findByUserId(touserid);
		if (l.isEmpty()) {
			result = "{'code':2}";//�����û�Ϊ��;
			return SUCCESS;
		}
		messboard.setUserByMessbToUserid(l.get(0));
		l = dao.findByUserId(userid);
		if (l.isEmpty()) {
			result = "{'code':1}";//
			return SUCCESS;
		}
		messboard.setUserByMessbFromUserid(l.get(0));
		messboard.setMessbStatus((short) 1);
		MessageboardDAO mebdao=new MessageboardDAO();
		mebdao.save(messboard);
		mebdao.getSession().beginTransaction().commit();
		mebdao.getSession().close();
		result = "{'code':3}";//
		System.out.println("���Գɹ���");
		return SUCCESS;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Messageboard getMessboard() {
		return messboard;
	}

	public void setMessboard(Messageboard messboard) {
		this.messboard = messboard;
	}

	public String getTouserid() {
		return touserid;
	}

	public void setTouserid(String touserid) {
		this.touserid = touserid;
	}

}
