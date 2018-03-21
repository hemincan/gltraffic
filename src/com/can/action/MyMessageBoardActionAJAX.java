package com.can.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Messageboard;
import com.can.hibernate.Myfollow;
import com.can.hibernate.Topic;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 我的主页留言板获取数据
 */
public class MyMessageBoardActionAJAX extends ActionSupport{
	private String userid;
	private String result;
	private int nowpage;
	private int toltalpages;
	private int onepagenum;
	private int myfollowcount;//因为不想每次都查询，则由前端传来
	
	public String execute() throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		userid=(String) session.get("userid");
		
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Messageboard as t where t.userByMessbToUserid.userId='"+userid+"' order by t.messbTime desc");
		this.setOnepagenum(5);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		toltalpages=(int) Math.ceil((double)myfollowcount/getOnepagenum());
		List<Messageboard> messboardlist=query.list();
		//将其变成json格式，用于传输
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < messboardlist.size(); i++) {
			Messageboard messboard=messboardlist.get(i);
			
			map.put("id", messboard.getId().toString());
			map.put("from_name", messboard.getUserByMessbFromUserid().getUserName()
					.toString());
			map.put("time", messboard.getMessbTime().toString());
			map.put("content", messboard.getMessbContent().toString());
			map.put("from_userid", messboard.getUserByMessbFromUserid().getUserId().toString());
			map.put("readed", messboard.getMessbStatus()+"");
			if(messboard.getMessbStatus()!=null&&messboard.getMessbStatus()==1){
				messboard.setMessbStatus((short) 0);
				se.update(messboard);
			}
			JSONObject json = JSONObject.fromObject(map);
			resultlist.add(json.toString());
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("jsondata", resultlist);
		map2.put("nowpage",nowpage+"");
		map2.put("toltalpages",toltalpages+"");
		//map2.put("toltalpages",toltalpages+"");
		result = JSONObject.fromObject(map2).toString();
		se.beginTransaction().commit();
		
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
