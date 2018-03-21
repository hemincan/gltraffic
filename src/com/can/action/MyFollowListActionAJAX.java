package com.can.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Myfollow;
import com.can.hibernate.MyfollowDAO;
import com.can.hibernate.MyfollowId;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 首页显示我的关注，获取其列表的action
 * bug1,没有区分用户查询！
 */
public class MyFollowListActionAJAX extends ActionSupport {
	private String result;
	private User user;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String execute() throws Exception{
		System.out.println("请求获得关注列表");
		UserDAO userdao=new UserDAO();
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		if(userid==null || "".equals(userid)){
			System.out.println("用户没有登录！");
			result="{'code':1}";//用户未登录无法获取关注列表
			return SUCCESS;
		}
		this.user =new User();
		this.user.setUserId(userid);
		List<User> list=userdao.findByExample(this.user);
		if(!list.isEmpty()){
			this.user=list.get(0);
			//System.out.println(this.user.getUserName());
//			MyfollowDAO myfollowdao=new MyfollowDAO();
//			MyfollowId id=new MyfollowId(this.user,null);
//			Myfollow myfollow=new Myfollow(id,null);
//			List<Myfollow> listfollow=myfollowdao.findByExample(myfollow);
			
			Session se = HibernateSessionFactory.getSessionFactory().openSession();
			Query query = se.createQuery("from Myfollow as t where t.id.user.userId='"+userid+"' order by t.followTime desc");
			query.setMaxResults(4);
			List<Myfollow> listfollow=query.list();
			//使用Map打包成Json
			List<String> resultlist=new ArrayList<String>();
			Map<String, String> map=new HashMap<String, String>();
			int size=listfollow.size();
			for(int i=0;i<size;i++){
				
				map.put("time", listfollow.get(i).getFollowTime().toString());
				map.put("topiccontent", listfollow.get(i).getId().getTopic().getTopicContent().toString());
				map.put("topicid",listfollow.get(i).getId().getTopic().getId().toString());
				map.put("username", listfollow.get(i).getId().getUser().getUserName().toString());
				map.put("commentsize", listfollow.get(i).getId().getTopic().getComments().size()+"");
				map.put("eggsize", listfollow.get(i).getId().getTopic().getTopicEgg()+"");
				JSONObject json = JSONObject.fromObject(map);
				resultlist.add(json.toString());
			}
			result=JSONArray.fromObject(resultlist).toString();
			//result=listfollow.get(0).toString();
		}else{
			System.out.println("用户没有登录！");
			result="{'code':1}";//用户未登录无法获取关注列表
		}
		return SUCCESS;
	}
}
