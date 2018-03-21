package com.can.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Comment;
import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.can.hibernate.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 巾子的详细页面，带分页
 * bug session没有关闭使得出现缓存的问题
 */
public class DetailsTopicAction extends ActionSupport {
	private String topicid;
	private Topic topic;
	private int commentsize;
	private List<Comment> commentlist;
	private int nowpage;
	private int toltalpages;
	private int onepagenum;
	// session关闭了，取不到User,用一个User保存发贴人信息
	private User user;

	public String execute() {

		if (nowpage == 0) {
			this.setNowpage(1);
		}
		// 一页显示多少条，
		this.setOnepagenum(10);
		// System.out.println("topicid"+topicid);
		TopicDAO topicdao = new TopicDAO();
		topicdao.getSession().beginTransaction().commit();
		// 事务刷新一下再找
		topic = topicdao.findById(Integer.parseInt(topicid));
		Session se = HibernateSessionFactory.getSessionFactory().openSession();

		if (topic != null) {
			user = topic.getUser();
			System.out.println(user.getUserName());
			this.setCommentsize(topic.getComments().size());
			toltalpages = (int) Math.ceil((double) this.getCommentsize()
					/ getOnepagenum());
			// se.clear();
			// se.flush();
			Query query = se.createQuery("from Comment as t where t.topic.id="
					+ Integer.parseInt(topicid) + " order by t.id desc");
			query.setMaxResults(onepagenum);
			query.setFirstResult(((nowpage - 1) * onepagenum));
			commentlist = query.list();
			Map<String, Object> session = ActionContext.getContext()
					.getSession();
			if (topic.getTopicState() == 1) {
				// 违规帖子
				session.put("illegal", "yes");
			}else{
				session.put("illegal", "no");
			}
		} else {

			System.out.println("查不到这个topic!!!!!!!!!!,提交事务");
		}
		topic.setTopicReaded(topic.getTopicReaded() + 1);
		topicdao.getSession().update(topic);
		topicdao.getSession().beginTransaction().commit();
		topicdao.getSession().close();
		return "success";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Comment> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<Comment> commentlist) {
		this.commentlist = commentlist;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public int getOnepagenum() {
		return onepagenum;
	}

	public void setOnepagenum(int onepagenum) {
		this.onepagenum = onepagenum;
	}

	public int getToltalpages() {
		return toltalpages;
	}

	public void setToltalpages(int toltalpages) {
		this.toltalpages = toltalpages;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getTopicid() {
		return topicid;
	}

	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}

	public int getCommentsize() {
		return commentsize;
	}

	public void setCommentsize(int commentsize) {
		this.commentsize = commentsize;
	}
}
