package com.can.admin.action;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Topic;
import com.can.hibernate.TopicDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserTopicsListAction extends ActionSupport {
	List<Topic> topicset;
	private int onepagenum;//һҳ��ʾ����
	private int totalcount;//������
	private int totalpagecount;//��ҳ��
	private int nowpage=1;
	
	private String words;//��ѯ�Ĺؼ���
	public String execute() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		System.out.println("�û����"+indentity);
		if(userid==null || "".equals(userid)||indentity.equals("��ͨ�û�")){
			System.out.println("�û�û�е�¼��");
			return "fail";
		}
		System.out.println("admin system");
		//�жϵ�¼
		setOnepagenum(20);
		String hql="from Topic as t order by t.id desc";
		if(getWords()!=null){
			words=new String(words.getBytes("ISO-8859-1"),"UTF-8");
			System.out.println(words);
			hql="from Topic as t where t.user.userId like '%"+words+"%' or t.user.userName like '%"+words+"%' or t.topicContent like '%"+words+"%'  or t.topicType like '%"+words+"%'  order by t.id desc";
		}
		Session se =HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery(hql);
		query.setMaxResults(onepagenum);
		query.setFirstResult(((nowpage-1)*onepagenum));
		se.beginTransaction().commit();
		topicset=query.list();
		//������
		TopicDAO dao=new TopicDAO();
		totalcount=dao.findAll().size();
		totalpagecount=(int) Math.ceil((double)totalcount/getOnepagenum());
		System.out.println(topicset.size());
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
	public List<Topic> getTopicset() {
		return topicset;
	}
	public void setTopicset(List<Topic> topicset) {
		this.topicset = topicset;
	}
	public int getTotalpagecount() {
		return totalpagecount;
	}
	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
}
