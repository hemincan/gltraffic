package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Article;
import com.can.hibernate.ArticleDAO;
import com.can.hibernate.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ManageArticleAction extends ActionSupport {

	List<Article> topicset;

	private int onepagenum;// 一页显示多少
	private int totalcount;// 总条数
	private int totalpagecount;// 总页数
	private int nowpage = 1;
	
	private int id;
	public String execute() throws Exception {
		System.out.println("admintopic system");
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		String indentity = (String) session.get("indentity");
		if (userid == null || "".equals(userid) || indentity.equals("普通用户")) {
			System.out.println("用户没有登录！");
			return "fail";
		}
		// 判断登录
		setOnepagenum(20);
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Article as t order by t.id desc");
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage - 1) * onepagenum));
		se.beginTransaction().commit();
		topicset = query.list();
		// 查总数
		ArticleDAO dao = new ArticleDAO();
		totalcount = dao.findAll().size();
		System.out.println("totalcount:" + totalcount);
		totalpagecount = (int) Math.ceil((double) totalcount / getOnepagenum());
		System.out.println(topicset.size());
		return "success";
	}
	public String delete() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		ArticleDAO dao = new ArticleDAO();
		Article article=dao.findById(id);
		if(article==null){
			return "fail";
		}
		dao.delete(article);
		dao.getSession().beginTransaction().commit();
		dao.getSession().close();
		return "success";
	}
	public int getOnepagenum() {
		return onepagenum;
	}

	public void setOnepagenum(int onepagenum) {
		this.onepagenum = onepagenum;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public List<Article> getTopicset() {
		return topicset;
	}

	public void setTopicset(List<Article> topicset) {
		this.topicset = topicset;
	}

	public int getTotalpagecount() {
		return totalpagecount;
	}

	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
