package com.can.admin.action;

import java.util.Map;

import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SetIrregularityTopicAction extends ActionSupport {
	private int id;
	private String result;
	private String mode;

	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		String indentity = (String) session.get("indentity");
		if (userid == null || "".equals(userid) || indentity.equals("普通用户")) {
			System.out.println("用户没有登录！");
			result = "{'code':1}";
			return SUCCESS;
		}
		TopicDAO topicdao = new TopicDAO();
		Topic topic = topicdao.findById(id);
		if (topic == null) {
			result = "{'code':2}";
			return SUCCESS;
		}
		if ( "un".equals(mode)) {
			topic.setTopicState(0);
		} else {
			topic.setTopicState(1);
		}
		topicdao.getSession().update(topic);
		topicdao.getSession().beginTransaction().commit();
		topicdao.getSession().close();
		result = "{'code':3}";
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}
}
