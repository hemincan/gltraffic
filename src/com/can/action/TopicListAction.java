package com.can.action;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.opensymphony.xwork2.ActionSupport;

public class TopicListAction extends ActionSupport {
	private List<Topic> topicset;
	
	public String execute() throws Exception{
//		TopicDAO topicdao = new TopicDAO();
//		topicset=topicdao.findAll();
		
		Session se =HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Topic as t order by t.id desc");
		query.setMaxResults(5);
		topicset=query.list();
		//se.close();
		
		for(int i=0;i<topicset.size();i++){
			
			System.out.println("topicset.get(i).getComments().size()"+topicset.get(i).getComments().size());
			System.out.println("topicset.get(i).Username"+topicset.get(i).getUser().getUserName());
		}
		
//		System.out.println("topicset.size()"+topicset.size()+"   "+topicset.get(0).getComments().size());
		//topicdao.getSession().close();
		se.close();
		return "success";
	}
	public List<Topic> getTopicset() {
		return topicset;
	}

	public void setTopicset(List<Topic> topicset) {
		this.topicset = topicset;
	}
	
}
