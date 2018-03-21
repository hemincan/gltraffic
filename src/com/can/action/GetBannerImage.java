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
import com.can.hibernate.IndexBanner;
import com.opensymphony.xwork2.ActionSupport;

public class GetBannerImage extends ActionSupport {
	private String result;
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String execute( ) throws Exception{
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from IndexBanner as i ");
		List<IndexBanner> list=query.list();
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < list.size(); i++) {
			map.put("image", list.get(i).getImage());
			JSONObject json = JSONObject.fromObject(map);
			resultlist.add(json.toString());
		}
		result=JSONArray.fromObject(resultlist).toString();
		return SUCCESS;
		
		
	}
}
