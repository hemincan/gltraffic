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
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 关于我的
 * 回复我的留言
 */
public class AboutMeActionAJAX extends ActionSupport {
	private String count;
	private String result;
	
	private int nowpage;
	private int toltalpages;
	private int onepagenum;
	private int myfollowcount;//因为不想每次都查询，则由前端传来
	
	public String execute() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=session.get("userid").toString();
		Session se=HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("select count(*) from Comment as c where c.commentState=1 and c.topic.id in(select t.id from Topic as t where t.user.userId='"+userid+"')");
		List<Object> l=query.list();
		count=l.get(0).toString();
		query = se.createQuery("select count(*) from Messageboard as m where m.userByMessbToUserid.userId='"+userid+"' and m.messbStatus=1 order by m.id desc");
		l=query.list();
		String mess_bcount=l.get(0).toString();
		se.close(); 
		result="{'comment':'"+count+"','messbcount':'"+mess_bcount+"'}";
		return SUCCESS;
	}
	public String list() throws Exception{
		System.out.println("list");
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=session.get("userid").toString();
		Session se=HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Comment as c where  c.topic.id in(select t.id from Topic as t where t.user.userId='"+userid+"') order by c.commentState desc , c.id desc ");
		
		Query querycount = se.createQuery("select count(*) from Comment as c where c.commentState=1 and c.topic.id in(select t.id from Topic as t where t.user.userId='"+userid+"')");
		List<Object> lcount=querycount.list();
		System.out.println(lcount.get(0));
		myfollowcount=Integer.parseInt(lcount.get(0).toString());
		
		this.setOnepagenum(5);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		toltalpages=(int) Math.ceil((double)myfollowcount/getOnepagenum());
		
		List<Comment> l= query.list();
		List<String> resultlist = new ArrayList<String>();
		
		for (int i = 0; i < l.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("who", l.get(i).getUser().getUserName());
			map.put("content", l.get(i).getCommentContent());
			map.put("time", l.get(i).getCommentTime().toString());
			map.put("topiccontent", l.get(i).getTopic().getTopicContent());
			map.put("readed", l.get(i).getCommentState()+"");
			if(l.get(i).getComment()!=null){
				map.put("quotecontent", l.get(i).getComment().getCommentContent());
			}
			//设置为已读
			l.get(i).setCommentState((short) 0);
			se.update(l.get(i));
			
			
			
			JSONObject json = JSONObject.fromObject(map);
			resultlist.add(json.toString());
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("jsondata", resultlist);
		map2.put("myfollowcount",myfollowcount+"");
		result = JSONObject.fromObject(map2).toString();
		se.beginTransaction().commit();
		se.close();
		return SUCCESS;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getToltalpages() {
		return toltalpages;
	}
	public void setToltalpages(int toltalpages) {
		this.toltalpages = toltalpages;
	}
	public int getOnepagenum() {
		return onepagenum;
	}
	public void setOnepagenum(int onepagenum) {
		this.onepagenum = onepagenum;
	}
	public int getMyfollowcount() {
		return myfollowcount;
	}
	public void setMyfollowcount(int myfollowcount) {
		this.myfollowcount = myfollowcount;
	}
	
}
