package com.can.admin.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.Topic;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 
 * ͳ����action
 */
public class StatisticsClickAction extends ActionSupport {

	public boolean havelogin() {

		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		String indentity = (String) session.get("indentity");
		if (userid == null || "".equals(userid) || indentity.equals("��ͨ�û�")) {
			System.out.println("�û�û�е�¼��");
			return false;
		}
		return true;
	}

	/*
	 * �ܵ������
	 */
	private List<Topic> topicset;
	private String type;
	private String beginday;
	private String endday;

	public String execute() throws Exception {
		if (!havelogin()) {
			return "fail";
		}
		String hql =null;
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if ("today".equals(type)) {

			Calendar calendar = Calendar.getInstance();// ��������
			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.DAY_OF_MONTH, 1);// ��������Ϊbetween�������߽�
			setEndday(df.format(calendar.getTime()));
			setBeginday(df.format(d));
		} else if ("total".equals(type)) {
			//��
			
		} else if ("week".equals(type)) {// һ��

			setEndday(df
					.format(new Date(d.getTime() + 1 * 24 * 60 * 60 * 1000)));
			setBeginday(df.format(new Date(d.getTime() - 7 * 24 * 60 * 60
					* 1000)));

		} else if ("month".equals(type)) {// һ����

			Calendar calendar = Calendar.getInstance();// ��������
			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.MONTH, -1);// �·ݼ�һ
			setBeginday(df.format(calendar.getTime()));

			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.DAY_OF_MONTH, 1);//
			setEndday(df.format(calendar.getTime()));

		} else if ("year".equals(type)) {// һ��

			Calendar calendar = Calendar.getInstance();// ��������
			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.YEAR, -1);// ���һ
			setBeginday(df.format(calendar.getTime()));

			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.DAY_OF_MONTH, 1);//
			setEndday(df.format(calendar.getTime()));

		} else if ("select".equals(type)) {// ָ��ʱ���
			
		}
		hql = "from Topic as t where t.topicPublicTime between '" + beginday
				+ "' and '" + endday + "' order by t.topicReaded desc";
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery(hql);
		query.setMaxResults(10);
		se.beginTransaction().commit();
		setTopicset(query.list());
		return "success";
	}

	public List<Topic> getTopicset() {
		return topicset;
	}

	public void setTopicset(List<Topic> topicset) {
		this.topicset = topicset;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBeginday() {
		return beginday;
	}

	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}
}
