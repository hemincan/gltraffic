package com.can.admin.action;

import java.util.Map;

import com.can.hibernate.Article;
import com.can.hibernate.ArticleDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewArticleAction extends ActionSupport {
	private Article article;
	public String execute() throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
		UserDAO userdao=new UserDAO();
		User user=(User) userdao.findByUserId(userid).get(0);
		article.setUser(user);
		article.setArticleReaded(0);
		article.setArticleState(0);
		ArticleDAO articleDAO=new ArticleDAO();
		articleDAO.save(article);
		articleDAO.getSession().beginTransaction().commit();
		articleDAO.getSession().close();
		return "success";
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
}
