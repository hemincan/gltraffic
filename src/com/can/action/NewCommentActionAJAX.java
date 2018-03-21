package com.can.action;

import java.util.Map;

import com.can.hibernate.Comment;
import com.can.hibernate.CommentDAO;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 发布新的评论用
 */
public class NewCommentActionAJAX extends ActionSupport {

	private String topicid;
	private String userid;
	private String commentContent;
	private String commentid;
	private String result;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String execute() throws Exception {
//		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
//		System.out.println(userid);
//		System.out.println(topicid);
//		System.out.println(commentContent);
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		//需要从session中获得userid，不可从客户端传来
		if ( userid == null ||userid.equals("") ) {
			System.out.println("login first");
			result = "{'code':1}";
			return "success";
		}else if(topicid.equals("") ||"".equals(commentContent)||commentContent==null){
			result = "{'code':2}";
			return "success";
		}
		else {
			
			UserDAO userdao=new UserDAO();
			TopicDAO topicdao=new TopicDAO();
			User user = (User) userdao.findByUserId(userid).get(0);
			Topic topic =topicdao.findById(Integer.parseInt(topicid));
			//有新评论，把帖子置顶，用最新的时间去更新updatetime
			topic.setTopicLastUpdatetime(null);
			CommentDAO commentdao=new CommentDAO();
			
			Comment comment=new Comment();
			comment.setUser(user);
			comment.setTopic(topic);
			comment.setCommentContent(commentContent);
			comment.setCommentState((short) 1);
			//System.out.println("回复的id"+commentid);
			if(commentid!=null&&!"".equals(commentid)){
				Comment recomment =commentdao.findById(Integer.parseInt(commentid));
				//System.out.println("回复的fsdg"+recomment);
				comment.setComment(recomment);
				
			}
			commentdao.save(comment);
			commentdao.getSession().beginTransaction().commit();
			result = "{'code':3}";
			userdao.getSession().close();
			topicdao.getSession().close();
			commentdao.getSession().close();
			return "success";
		}
	}

	public String getCommentid() {
		return commentid;
	}

	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}

}
