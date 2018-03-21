package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserListAction extends ActionSupport {
	List<User> userlist;
	private int onepagenum;//一页显示多少
	private int totalcount;//总条数
	private int totalpagecount;//总页数
	private int nowpage=1;
	
	private String words;//查询的关键字
	public String execute() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		System.out.println("用户身份"+indentity);
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		setOnepagenum(20);
		if(words==null){
			words="";
		}
		words=new String(words.getBytes("ISO-8859-1"),"UTF-8");
		String hql="from User as u where u.userId like '%"+words+"%' or u.userName like '%"+words+"%' or u.userIndentity like '%"+words+"%' order by u.id desc";
		Session se =HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery(hql);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		se.beginTransaction().commit();
		userlist=query.list();
		//查总数
		UserDAO dao=new UserDAO();
		totalcount=dao.findAll().size();
		totalpagecount=(int) Math.ceil((double)totalcount/getOnepagenum());
		
		return "success";
	}
	public int getOnepagenum() {
		return onepagenum;
	}
	public void setOnepagenum(int onepagenum) {
		this.onepagenum = onepagenum;
	}
	public List<User> getUserlist() {
		return userlist;
	}
	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getTotalpagecount() {
		return totalpagecount;
	}
	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	
}
