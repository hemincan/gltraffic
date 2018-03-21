package com.can.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Comment;
import com.can.hibernate.CommentDAO;
import com.can.hibernate.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 获取评论的列表，不带分布，只显示5条
 */
public class CommentActionAJAX extends ActionSupport {

	private String result;
	private String topicid;
	
	private List<Comment> commentlist;
	public String execute() throws Exception{
		Session se =HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Comment as t where t.topic.id="+Integer.parseInt(topicid)+" order by t.id desc");
		query.setMaxResults(5);
		commentlist=query.list();
		List<String> resultlist =new ArrayList<String>();
		int size=commentlist.size();
		for(int i=0;i<size;i++){
			Map<String, String> map=new HashMap<String, String>();
			map.put("time", commentlist.get(i).getCommentTime().toString());
			map.put("content", commentlist.get(i).getCommentContent());
			map.put("username", commentlist.get(i).getUser().getUserName());
			map.put("headimg", commentlist.get(i).getUser().getUserHeadimg());
			map.put("userid", commentlist.get(i).getUser().getUserId());
			JSONObject json =JSONObject.fromObject(map);
			resultlist.add(json.toString());
		}
		result=JSONArray.fromObject(resultlist).toString();
		//System.out.println(result);
		se.close();
		return "success";
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
