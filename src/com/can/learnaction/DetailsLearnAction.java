package com.can.learnaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Trafficlearn;
import com.can.hibernate.TrafficlearnDAO;
import com.opensymphony.xwork2.ActionSupport;

public class DetailsLearnAction extends ActionSupport {
	private String result;
	private String typeid;
	private List<Trafficlearn> trafficlist;
	public String execute() throws Exception{
		if(typeid==null){
			return "fail";
		}
		int id=Integer.parseInt(typeid);
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Trafficlearn as t where t.marktype.id="+id+"");
		trafficlist=query.list();
//		List<String> resultlist = new ArrayList<String>();
//		Map<String, String> map=new HashMap<String, String>();
//		for (int i = 0; i < trafficlist.size(); i++) {
//			map.put("id", trafficlist.get(i).getId()+"");
//			map.put("typename", trafficlist.get(i).getName());
//			map.put("describe", trafficlist.get(i).getDescribe());
//			map.put("image", trafficlist.get(i).getImage());
//			JSONObject json = JSONObject.fromObject(map);
//			resultlist.add(json.toString());
//		}
//		setResult(JSONArray.fromObject(resultlist).toString());
		return "success";
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public List<Trafficlearn> getTrafficlist() {
		return trafficlist;
	}
	public void setTrafficlist(List<Trafficlearn> trafficlist) {
		this.trafficlist = trafficlist;
	}
}
