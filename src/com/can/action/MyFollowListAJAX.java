package com.can.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Myfollow;
import com.can.hibernate.Topic;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 我的主页上的我的关注列表
 */
public class MyFollowListAJAX extends ActionSupport {

	private String userid;
	private String result;
	private int nowpage;
	private int toltalpages;
	private int onepagenum;
	private int myfollowcount;//因为不想每次都查询，则由前端传来
	
	public String execute() throws Exception {
		//System.out.println("#########rfrrfrrr");
		//暂不用在session中取userid,因为这个是可以给别人看到的
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Myfollow as t where t.id.user.userId='"+userid+"' order by t.followTime desc");
		this.setOnepagenum(5);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		toltalpages=(int) Math.ceil((double)myfollowcount/getOnepagenum());
		List<Myfollow> followlist=query.list();
		//将其变成json格式，用于传输
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < followlist.size(); i++) {
			Topic topic=followlist.get(i).getId().getTopic();
			
			map.put("id", topic.getId().toString());
			map.put("username", topic.getUser().getUserName()
					.toString());
			map.put("userid", topic.getUser().getUserId().toString());
			map.put("tiltle", topic.getTopicTiltle().toString());
			map.put("content", topic.getTopicContent().toString());
			//System.out.println(topicset.get(i).getTopicImages());
			map.put("images", topic.getTopicImages().toString());
			map.put("egg", topic.getTopicEgg().toString());
			Timestamp date = topic.getTopicPublicTime();
			String time = new SimpleDateFormat("yyyy年MM月dd日,hh时mm分").format(date.getTime());
			map.put("time", time);
			map.put("type", topic.getTopicType().toString());
			map.put("comsize", topic.getComments().size() + "");
			map.put("readed", topic.getTopicReaded() + "");
			map.put("location", topic.getTopicLocation() + "");
			JSONObject json = JSONObject.fromObject(map);
			//System.out.println(json.toString());
			resultlist.add(json.toString());
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("jsondata", resultlist);
		map2.put("nowpage",nowpage+"");
		map2.put("toltalpages",toltalpages+"");
		//map2.put("toltalpages",toltalpages+"");
		result = JSONObject.fromObject(map2).toString();
		
		
		return SUCCESS;

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
