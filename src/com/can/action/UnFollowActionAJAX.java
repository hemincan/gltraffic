package com.can.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Myfollow;
import com.can.hibernate.MyfollowDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UnFollowActionAJAX extends ActionSupport {
	private String result;
	private String topicid;
	
	public String execute() throws Exception {
		String userid;
		//从session中获得登录的人信息
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		if(userid==null ||"".equals(userid)){
			setResult("{'code':1}");//没有登录的错误
			return SUCCESS;
		}
		Session se=HibernateSessionFactory.getSessionFactory().openSession();
		se.beginTransaction().commit();
		Query query=se.createQuery("from Myfollow as t where t.id.user.userId='"+userid+"' and t.id.topic.id="+Integer.parseInt(topicid)+"");
		List<Myfollow> myl=query.list();
		if(myl.isEmpty()){
			System.out.println("不存在这条关注！");
			setResult("{'code':2}");
			return SUCCESS;
		}
		MyfollowDAO myfollowDAO=new MyfollowDAO();
		myfollowDAO.delete(myl.get(0));
		Transaction tx=myfollowDAO.getSession().beginTransaction();
		tx.commit();
		myfollowDAO.getSession().close();
		setResult("{'code':3}");//成功
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
