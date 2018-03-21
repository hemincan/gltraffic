package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.IndexBanner;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BannerImagesListAction extends ActionSupport {
	private List<IndexBanner> list;
	
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se
				.createQuery("from IndexBanner as i ");
		list = query.list();
		
		return "success";
	}

	public List<IndexBanner> getList() {
		return list;
	}

	public void setList(List<IndexBanner> list) {
		this.list = list;
	}
}
