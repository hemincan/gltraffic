package com.can.action;

import java.util.List;
import java.util.Map;



import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 登录用
 */
public class LoginAction extends ActionSupport {
	private String userid;
	private String password;
	private String result;
	public String execute( ) throws Exception{
		UserDAO dao =new UserDAO();
		User user =new User();
		user.setUserId(userid);
		user.setUserPassword(password);
		List userinfo=dao.findByExample(user);
		if (!userinfo.isEmpty()){
			
			Map<String, Object> session = ActionContext.getContext().getSession();
			user = (User) userinfo.get(0);
//			Set<Topic> to=user.getTopics();
//			Iterator<Topic> ito=to.iterator();
//			while(ito.hasNext()){
//				System.out.println(ito.next().getTopicTiltle());
//			}
			session.put("userid", userid);
			session.put("username", user.getUserName());
			session.put("indentity", user.getUserIndentity());
			
			dao.getSession().close();
			result="{'code':1}";
			return "success";
		}else{
			result="{'code':2}";
			dao.getSession().close();
			return "success";
		}
		
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getTest() {
		return "hello i am a test2";
	}
//	public void validate(){
//		if (userid.equals("") || password.equals("")){
//			this.addActionError("用户名密码不能为空");
//		}else{
//			//this.addActionMessage("成功");
//		}
//	}
}
