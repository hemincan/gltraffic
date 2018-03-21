package com.can.action;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Article;
import com.can.hibernate.ArticleDAO;
import com.can.hibernate.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleListAction extends ActionSupport {

	private List<Article> artlist;
	private String search;

	private int nowpage;
	private int totalcount;
	private int onepage;

	public String execute() throws Exception {
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		String hql = "from Article as t  order by t.id desc";
		if (getSearch() != null) {
			hql = "from Article as t where t.articleTiltle like '%" + search
					+ "%' order by t.id desc";
		}
		if(nowpage==0){
			nowpage=1;
		}
		Query query = se.createQuery(hql);
		setOnepage(10);
		query.setMaxResults(getOnepage());
		query.setFirstResult(((nowpage - 1) * onepage));
		ArticleDAO articleDAO = new ArticleDAO();
		totalcount= articleDAO.findAll().size();
		totalcount=(int) Math.ceil((double) totalcount / getOnepage());
		se.beginTransaction().commit();
		artlist = query.list();
		return "success";
	}

	public List<Article> getArtlist() {
		return artlist;
	}

	public void setArtlist(List<Article> artlist) {
		this.artlist = artlist;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getOnepage() {
		return onepage;
	}

	public void setOnepage(int onepage) {
		this.onepage = onepage;
	}
}
