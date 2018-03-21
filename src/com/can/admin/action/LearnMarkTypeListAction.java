package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Marktype;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 
 * ѧϰ����ѧϰ
 */
public class LearnMarkTypeListAction extends ActionSupport {
	List<Marktype> typelist;
	public List<Marktype> getTypelist() {
		return typelist;
	}
	public void setTypelist(List<Marktype> typelist) {
		this.typelist = typelist;
	}
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("��ͨ�û�")){
			System.out.println("�û�û�е�¼��");
			return "fail";
		}
		//�жϵ�¼
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Marktype as m ");
		typelist=query.list();
		se.close();
		return "success";
	}
}
