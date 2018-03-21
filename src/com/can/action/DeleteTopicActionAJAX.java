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
 * �û��Լ�ɾ���Լ���topic
 */
public class DeleteTopicActionAJAX extends ActionSupport {
	
	private String result;
	private String topicid;
	
	public String execute() throws Exception {
		String userid;
		//��session�л�õ�¼������Ϣ
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		if(userid==null ||"".equals(userid)){
			result="{'code':1}";//û�е�¼�Ĵ���
			return SUCCESS;
		}
		TopicDAO topicDAO=new TopicDAO();
		topicDAO.getSession().beginTransaction().commit();
		Topic topic=topicDAO.findById(Integer.parseInt(topicid));
		//���topic�ǵ�ǰ��¼����������ģ��ſ���ɾ��
		if(topic==null){
			System.out.println("��������������");
			result="{'code':2}";
			return SUCCESS;
		}
		else if(!topic.getUser().getUserId().equals(userid)){
			System.out.println("�����عⲻ����������ģ��㲻��ɾ����");
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
