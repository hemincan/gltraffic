package com.can.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;

import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 注册新用户
 */
public class RegisterAction extends ActionSupport {
	private Integer id;
	private String userId;
	private String userName;
	private String userHeadimg;
	private String userPassword;
	private String userSex;
	
	private String result;
	
//	<property name="connection.url">
//	jdbc:mysql://www.mircan.top:3306/gltraffic
//</property>
//<property name="connection.username">hemincan</property>
//<property name="connection.password">Can.5464.</property>
	public String execute() throws Exception {
		UserDAO dao = new UserDAO();
		if (dao.findByUserId(userId).isEmpty()) {
			System.out.println(userId+userName);
			User user = new User();
			user.setUserId(userId);
			user.setUserName(userName);
			user.setUserPassword(userPassword);
			user.setUserIndentity("普通用户");
			user.setUserSex(userSex);
			user.setUserState((short) 0);
			dao.save(user);
			Transaction tx = dao.getSession().beginTransaction();
			tx.commit();
			dao.getSession().close();
			result="恭喜您，注册成功!";
			return "success";
		} else {
			result="此用户名已经存在!";
			return "fail";
		}

	}
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserHeadimg() {
		return userHeadimg;
	}

	public void setUserHeadimg(String userHeadimg) {
		this.userHeadimg = userHeadimg;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
}
