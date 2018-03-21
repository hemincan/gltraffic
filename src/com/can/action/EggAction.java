package com.can.action;

import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 扔鸡蛋用的action，不记名没有登录也可以扔
 */
public class EggAction extends ActionSupport {
	private String result;
	private String topicid;

	public String execute() throws Exception {
		TopicDAO topicdao = new TopicDAO();
		Topic topic = topicdao.findById(Integer.parseInt(topicid));
		if (topic != null) {
			System.out.println("topic.getTopicContent()"
					+ topic.getTopicContent());
			topic.setTopicEgg(topic.getTopicEgg()+1);
			topicdao.getSession().update(topic);
			topicdao.getSession().beginTransaction().commit();
			topicdao.getSession().close();
			result = "{'egg':1}";
		}
		return "success";

	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTopicid() {
		return topicid;
	}

	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}
}
