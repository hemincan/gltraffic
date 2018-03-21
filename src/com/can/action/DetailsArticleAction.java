package com.can.action;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Article;
import com.can.hibernate.ArticleDAO;
import com.can.hibernate.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class DetailsArticleAction extends ActionSupport {
	private int id;
	private Article article;
	
	public String execute() throws Exception {

		ArticleDAO articleDAO =new ArticleDAO();
		articleDAO.getSession().beginTransaction().commit();
		article= articleDAO.findById(id);
		if(article==null){
			System.out.println("找不到这个文章");
			return "fail";
		}
		article.setArticleReaded(article.getArticleReaded()+1);
		articleDAO.getSession().update(article);
		articleDAO.getSession().beginTransaction().commit();
		articleDAO.getSession().close();
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
}
