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
 * 首页关注贴子的Action
 * bug,关注帖子不合法，拿着指定的id找不到相应的topic所以说不合法
 */
public class FollowTopicAJAX extends ActionSupport {
	private String topicid;
	private String userid;
	private String result;
	public String execute( ) throws Exception{
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		//System.out.println("这里不合法"+topicid);
		if(userid==null ||"".equals(userid)){
			result="{'code':1}";//没有登录的错误
			return SUCCESS;
		}else if(topicid==null || "".equals(topicid)){
			System.out.println("这里不合法"+topicid);
			result="{'code':2}";//所关注的主题id不合法
			return SUCCESS;
		}
		User user=new User();
		user.setUserId(userid);
		UserDAO userdao=new UserDAO();
		//有可能不存在些userid
		List<User> userlist=userdao.findByExample(user);
		if(userlist.isEmpty()){
			result="{'code':1}";//没有登录的错误
			return SUCCESS;
		}
		user=(User) userlist.get(0);
		TopicDAO topicdao=new TopicDAO();
		//刷新一下事务
		topicdao.getSession().beginTransaction().commit();
		Topic topic=topicdao.findById(Integer.parseInt(topicid));
		//topic有可能为空
		if(topic==null){
			result="{'code':2}";//虽然Id不为空但是找不到此topic所以，id不合法
			return SUCCESS;
		}
		MyfollowDAO dao=new MyfollowDAO();
		MyfollowId fid=new MyfollowId(user,topic);
		System.out.println("关注！"+topicid);
		if(dao.findById(fid)!=null){
			
			result="{'code':4}";//已经存在
			return SUCCESS;
		}
		Myfollow follow=new Myfollow();
		follow.setId(fid);
		//有两个相同的follow存在session缓存，报错
		dao.merge(follow);
		//dao.save(follow);
		Transaction tx=dao.getSession().beginTransaction();
		tx.commit();
		dao.getSession().close();
		result="{'code':3}";//关注成功
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
