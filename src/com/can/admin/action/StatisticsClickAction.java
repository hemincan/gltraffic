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
 * 统计用action
 */
public class StatisticsClickAction extends ActionSupport {

	public boolean havelogin() {

		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid = (String) session.get("userid");
		String indentity = (String) session.get("indentity");
		if (userid == null || "".equals(userid) || indentity.equals("普通用户")) {
			System.out.println("用户没有登录！");
			return false;
		}
		return true;
	}

	/*
	 * 总点击排行
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

			Calendar calendar = Calendar.getInstance();// 日历对象
			calendar.setTime(d);// 设置当前日期
			calendar.add(Calendar.DAY_OF_MONTH, 1);// 天数，因为between不包含边界
			setEndday(df.format(calendar.getTime()));
			setBeginday(df.format(d));
		} else if ("total".equals(type)) {
			//总
			
		} else if ("week".equals(type)) {// 一周

			setEndday(df
					.format(new Date(d.getTime() + 1 * 24 * 60 * 60 * 1000)));
			setBeginday(df.format(new Date(d.getTime() - 7 * 24 * 60 * 60
					* 1000)));

		} else if ("month".equals(type)) {// 一个月

			Calendar calendar = Calendar.getInstance();// 日历对象
			calendar.setTime(d);// 设置当前日期
			calendar.add(Calendar.MONTH, -1);// 月份减一
			setBeginday(df.format(calendar.getTime()));

			calendar.setTime(d);// 设置当前日期
			calendar.add(Calendar.DAY_OF_MONTH, 1);//
			setEndday(df.format(calendar.getTime()));

		} else if ("year".equals(type)) {// 一年

			Calendar calendar = Calendar.getInstance();// 日历对象
			calendar.setTime(d);// 设置当前日期
			calendar.add(Calendar.YEAR, -1);// 年减一
			setBeginday(df.format(calendar.getTime()));

			calendar.setTime(d);// 设置当前日期
			calendar.add(Calendar.DAY_OF_MONTH, 1);//
			setEndday(df.format(calendar.getTime()));

		} else if ("select".equals(type)) {// 指定时间段
			
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
