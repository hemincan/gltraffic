package com.can.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

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
 * ��ҳ��ע���ӵ�Action
 * bug,��ע���Ӳ��Ϸ�������ָ����id�Ҳ�����Ӧ��topic����˵���Ϸ�
 */
public class FollowTopicAJAX extends ActionSupport {
	private String topicid;
	private String userid;
	private String result;
	public String execute( ) throws Exception{
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		//System.out.println("���ﲻ�Ϸ�"+topicid);
		if(userid==null ||"".equals(userid)){
			result="{'code':1}";//û�е�¼�Ĵ���
			return SUCCESS;
		}else if(topicid==null || "".equals(topicid)){
			System.out.println("���ﲻ�Ϸ�"+topicid);
			result="{'code':2}";//����ע������id���Ϸ�
			return SUCCESS;
		}
		User user=new User();
		user.setUserId(userid);
		UserDAO userdao=new UserDAO();
		//�п��ܲ�����Щuserid
		List<User> userlist=userdao.findByExample(user);
		if(userlist.isEmpty()){
			result="{'code':1}";//û�е�¼�Ĵ���
			return SUCCESS;
		}
		user=(User) userlist.get(0);
		TopicDAO topicdao=new TopicDAO();
		//ˢ��һ������
		topicdao.getSession().beginTransaction().commit();
		Topic topic=topicdao.findById(Integer.parseInt(topicid));
		//topic�п���Ϊ��
		if(topic==null){
			result="{'code':2}";//��ȻId��Ϊ�յ����Ҳ�����topic���ԣ�id���Ϸ�
			return SUCCESS;
		}
		MyfollowDAO dao=new MyfollowDAO();
		MyfollowId fid=new MyfollowId(user,topic);
		System.out.println("��ע��"+topicid);
		if(dao.findById(fid)!=null){
			
			result="{'code':4}";//�Ѿ�����
			return SUCCESS;
		}
		Myfollow follow=new Myfollow();
		follow.setId(fid);
		//��������ͬ��follow����session���棬����
		dao.merge(follow);
		//dao.save(follow);
		Transaction tx=dao.getSession().beginTransaction();
		tx.commit();
		dao.getSession().close();
		result="{'code':3}";//��ע�ɹ�
		return SUCCESS;
		
	}
	public String getTopicid() {
		return topicid;
	}
	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
