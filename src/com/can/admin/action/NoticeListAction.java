package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Article;
import com.can.hibernate.ArticleDAO;
import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Notice;
import com.can.hibernate.NoticeDAO;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeListAction extends ActionSupport {
	List<Notice> noticeset;
	

	private int onepagenum;// 一页显示多少
	private int totalcount;// 总条数
	private int totalpagecount;// 总页数
	private int nowpage = 1;
	
	private int id;
	public String execute() throws Exception {
		System.out.println("admintopic system");
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		// 判断登录
		setOnepagenum(20);
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery("from Notice as t order by t.id desc");
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		se.beginTransaction().commit();
		noticeset = query.list();
		// 查总数
		NoticeDAO dao = new NoticeDAO();
		totalcount = dao.findAll().size();
		System.out.println("totalcount:"+totalcount);
		totalpagecount = (int) Math.ceil((double) totalcount / getOnepagenum());
		System.out.println(noticeset.size());
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
		NoticeDAO dao = new NoticeDAO();
		Notice notice=dao.findById(id);
		if(notice==null){
			return "fail";
		}
		dao.delete(notice);
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
	public List<Notice> getNoticeset() {
		return noticeset;
	}
	public void setNoticeset(List<Notice> noticeset) {
		this.noticeset = noticeset;
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
