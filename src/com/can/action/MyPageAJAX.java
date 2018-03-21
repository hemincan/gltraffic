package com.can.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import net.sf.json.JSONObject;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Myfollow;
import com.can.hibernate.MyfollowDAO;
import com.can.hibernate.MyfollowId;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 点击我的主页上时，查询该用户的发贴，关注的基本信息
 */
public class MyPageAJAX extends ActionSupport {
	private int mytopiccount;
	private int myfollowcount;
	private int messageboardcount;
	private String result;
	private String userid;

	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		UserDAO userdao =new UserDAO();
		List<User> userlist = userdao.findByUserId(userid);
		if(userlist.isEmpty()){
			System.out.println("找不到用户，用户没有登录！");
			return SUCCESS;
		}
		
		User user=userlist.get(0);
		//根据用户查出用户有多少曝光
//		System.out.println(user.getUserName());
//		Topic topic =new Topic();
//		topic.setUser(user);
//		TopicDAO topicdao=new TopicDAO();
//		List<Topic> topiclist=topicdao.findByExample(topic);//findBExample的方式找不出来，找出的是全部的内容
		int id=user.getId();
		Session se =HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("select count(*) from Topic as t where t.user.id="+id+"");
		List<Object> ss=query.list();
		//System.out.println(ss.size()+ss.get(0).toString()+"");
		mytopiccount=Integer.parseInt(ss.get(0).toString());
		//System.out.println("mytopiccount"+mytopiccount);
		//找出有多少条关注
		query = se.createQuery("select count(*) from Myfollow as t where t.id.user.id="+id+"");
		ss=query.list();
		myfollowcount=Integer.parseInt(ss.get(0).toString());
		
		//找出有多少条留言
		query = se.createQuery("select count(*) from Messageboard as t where t.userByMessbToUserid="+id+"");
		ss=query.list();
		messageboardcount=Integer.parseInt(ss.get(0).toString());
		
		se.close();
		
		Map<String, String> map =new HashMap<String, String>();
		map.put("mytopiccount", mytopiccount+"");
		map.put("myfollowcount", myfollowcount+"");
		map.put("messageboardcount", messageboardcount+"");
		map.put("username", user.getUserName());
		map.put("userid", user.getUserId());
		map.put("sex", user.getUserSex());
		JSONObject json =JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;

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

	public int getMytopiccount() {
		return mytopiccount;
	}

	public void setMytopiccount(int mytopiccount) {
		this.mytopiccount = mytopiccount;
	}

	public int getMyfollowcount() {
		return myfollowcount;
	}

	public void setMyfollowcount(int myfollowcount) {
		this.myfollowcount = myfollowcount;
	}

	public int getMessageboardcount() {
		return messageboardcount;
	}

	public void setMessageboardcount(int messageboardcount) {
		this.messageboardcount = messageboardcount;
	}
}
