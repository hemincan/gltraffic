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
import com.opensymphony.xwork2.ActionSupport;

public class TopicListActionAJAX extends ActionSupport {
	private String result;
	private List<Topic> topicset;
	private String start;

	private String gettype;
	public String execute() throws Exception {
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		//topicLastUpdatetime
		String hql="from Topic as t where t.topicType <> '公告' and t.topicState=0 order by t.topicLastUpdatetime desc";
		if(gettype==null){//默认的
			
		}else if (gettype.equals("new")){//获得最新的
			hql="from Topic as t where t.topicType <> '公告' and t.topicState=0 order by t.id desc";
			
		}else{
			
		}
		Query query = se.createQuery(hql);
		System.out.println("start "+start);
		query.setFirstResult(Integer.parseInt(start));
		query.setMaxResults(5);
		topicset = query.list();
		se.beginTransaction().commit();//查询也要提交事务
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < topicset.size(); i++) {

			
			map.put("id", topicset.get(i).getId().toString());
			map.put("username", topicset.get(i).getUser().getUserName()
					.toString());
			map.put("userid", topicset.get(i).getUser().getUserId().toString());
			map.put("tiltle", topicset.get(i).getTopicTiltle().toString());
			map.put("content", topicset.get(i).getTopicContent().toString().replaceAll("<br>", ""));
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
		result = JSONArray.fromObject(resultlist).toString();
		//System.out.println(result);
		se.close();
		return "success";
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getGettype() {
		return gettype;
	}

	public void setGettype(String gettype) {
		this.gettype = gettype;
	}
}
