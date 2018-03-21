package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Trafficlearn;
import com.can.hibernate.TrafficlearnDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ManageMarkTypeAction extends ActionSupport {
	private List<Trafficlearn> list;
	private int id;
	public String execute() throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Trafficlearn as t where t.marktype.id="+id);
		list=query.list();
		System.out.println(list.size());
		se.beginTransaction().commit();
		se.close();
		
		return "success";
	}
	public List<Trafficlearn> getList() {
		return list;
	}

	public void setList(List<Trafficlearn> list) {
		this.list = list;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
