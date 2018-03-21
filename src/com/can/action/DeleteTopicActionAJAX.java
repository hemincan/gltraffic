package com.can.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.can.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 用户自己删除自己的topic
 */
public class DeleteTopicActionAJAX extends ActionSupport {
	
	private String result;
	private String topicid;
	
	public String execute() throws Exception {
		String userid;
		//从session中获得登录的人信息
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		if(userid==null ||"".equals(userid)){
			result="{'code':1}";//没有登录的错误
			return SUCCESS;
		}
		TopicDAO topicDAO=new TopicDAO();
		topicDAO.getSession().beginTransaction().commit();
		Topic topic=topicDAO.findById(Integer.parseInt(topicid));
		//这个topic是当前登录的人所发表的，才可以删除
		if(topic==null){
			System.out.println("不存在这条主题");
			result="{'code':2}";
			return SUCCESS;
		}
		else if(!topic.getUser().getUserId().equals(userid)){
			System.out.println("这条曝光不是你所发表的，你不能删除！");
			result="{'code':2}";
			return SUCCESS;
		}
		topicDAO.delete(topic);
		Transaction tx=topicDAO.getSession().beginTransaction();
		tx.commit();
		topicDAO.getSession().close();
		result="{'code':3}";
		return SUCCESS;
		
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
