package com.can.action;

import java.awt.image.TileObserver;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Notice;
import com.can.hibernate.Topic;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeTopicListActionAJAX extends ActionSupport {
	private String result;
	private String tiltle;
	private List<Notice> noticeset;

	// index_recommend.jsp用，有最大限
	public String execute() throws Exception {
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se
				.createQuery("from Notice as t order by t.id desc");
		query.setMaxResults(8);
		noticeset = query.list();
		System.out.println("公告：" + noticeset.size());
		se.beginTransaction().commit();// 查询也要提交事务
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < noticeset.size(); i++) {
			String tiltle = noticeset.get(i).getNoticeTiltle().toString();
			if (tiltle.length() > 11) {
				tiltle = tiltle.substring(0, 11);
				tiltle += "...";
			}
			map.put("tiltle", tiltle);

			Timestamp date = noticeset.get(i).getNoticePublicTime();
			String time = new SimpleDateFormat("MM月dd日").format(date.getTime());
			// String time=date.getMonth()+"月"+date.getDay()+"日";
			map.put("time", time);
			map.put("id", noticeset.get(i).getId().toString());
			resultlist.add(JSONObject.fromObject(map).toString());
		}
		setResult(JSONArray.fromObject(resultlist).toString());
		return SUCCESS;
	}

	// 给recommend.jsp用，带分页
	private int nowpage;
	private Long totalcount;
	private int onepage;

	public String gettopiclist() {
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		String hql;
		if (tiltle == null) {
			hql = "from Notice as t  order by t.id desc";
		} else {
			hql = "from Notice as t where t.noticeTiltle like '%"
					+ tiltle + "%' order by t.id desc";
		}
		Query query = se.createQuery(hql);
		setOnepage(10);//一页显示10条
		query.setMaxResults(onepage);
		query.setFirstResult(((nowpage - 1) * onepage));
		noticeset = query.list();
		query=se.createQuery("select count(*) from Notice as t");
		totalcount=(Long) query.list().get(0);//查一共有多少条
		se.beginTransaction().commit();// 查询也要提交事务
		
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < noticeset.size(); i++) {
			String tiltle = noticeset.get(i).getNoticeTiltle().toString();
			if (tiltle.length() > 35) {
				tiltle = tiltle.substring(0, 35);
				tiltle += "...";
			}
			map.put("tiltle", tiltle);

			Timestamp date = noticeset.get(i).getNoticePublicTime();
			String time = new SimpleDateFormat("MM月dd日").format(date.getTime());
			// String time=date.getMonth()+"月"+date.getDay()+"日";
			map.put("time", time);
			map.put("id", noticeset.get(i).getId().toString());
			resultlist.add(JSONObject.fromObject(map).toString());
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("totalcount", totalcount+"");
		map2.put("data", resultlist);
		setResult(JSONObject.fromObject(map2).toString());
		return SUCCESS;

	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTiltle() {
		return tiltle;
	}

	public void setTiltle(String tiltle) {
		this.tiltle = tiltle;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public Long getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(Long totalcount) {
		this.totalcount = totalcount;
	}

	public int getOnepage() {
		return onepage;
	}

	public void setOnepage(int onepage) {
		this.onepage = onepage;
	}
}
