package com.can.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Topic;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 显示登录用户的贴子列表
 */
public class MyTopicListAJAX extends ActionSupport {
	private String userid;
	private String result;
	private int nowpage;
	private int toltalpages;
	private int onepagenum;
	private int topiccount;//因为不想每次都查询，则由前端传来
	
	public String execute() throws Exception {
		
		//暂不用在session中取userid,因为这个是可以给别人看到的
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Topic as t where t.user.userId='"+userid+"' order by t.id desc");
		this.setOnepagenum(5);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		toltalpages=(int) Math.ceil((double)topiccount/getOnepagenum());
		List<Topic> topicset=query.list();
		//将其变成json格式，用于传输
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < topicset.size(); i++) {

			
			map.put("id", topicset.get(i).getId().toString());
			map.put("username", topicset.get(i).getUser().getUserName()
					.toString());
			map.put("userid", topicset.get(i).getUser().getUserId().toString());
			map.put("tiltle", topicset.get(i).getTopicTiltle().toString());
			map.put("content", topicset.get(i).getTopicContent().toString().replaceAll("<br>", ""));
			//System.out.println(topicset.get(i).getTopicImages());
			map.put("images", topicset.get(i).getTopicImages().toString());
			map.put("egg", topicset.get(i).getTopicEgg().toString());
			Timestamp date = topicset.get(i).getTopicPublicTime();
			String time = new SimpleDateFormat("yyyy年MM月dd日,hh时mm分").format(date.getTime());
			map.put("time", time);
			map.put("type", topicset.get(i).getTopicType().toString());
			map.put("comsize", topicset.get(i).getComments().size() + "");
			map.put("readed", topicset.get(i).getTopicReaded() + "");
			map.put("location", topicset.get(i).getTopicLocation() + "");
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
	public int getTopiccount() {
		return topiccount;
	}
	public void setTopiccount(int topiccount) {
		this.topiccount = topiccount;
	}
}
