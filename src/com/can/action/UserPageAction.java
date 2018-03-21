package com.can.action;

import java.util.List;

import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UserPageAction extends ActionSupport {
	private String userid;
	private User user;
	private int topiccount;
	public String execute() throws Exception {
		UserDAO userdao=new UserDAO();
		userdao.getSession().beginTransaction().commit();
		List<User> l=userdao.findByUserId(userid);
		if(l.isEmpty()){
			return "fail";
		}
		setUser(l.get(0));
		setTopiccount(getUser().getTopics().size());
		userdao.getSession().close();
		return "success";
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getTopiccount() {
		return topiccount;
	}
	public void setTopiccount(int topiccount) {
		this.topiccount = topiccount;
	}
}
