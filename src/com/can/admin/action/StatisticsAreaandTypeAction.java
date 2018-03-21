package com.can.admin.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.myapi.Area;
import com.can.myapi.AreaAndType;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StatisticsAreaandTypeAction extends ActionSupport {

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

	private List<AreaAndType> l;
	private String type;
	private String beginday;
	private String endday;
	private String area;

	public String execute() throws Exception {
		if (!havelogin()) {
			return "fail";
		}
		String hql = null;
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if ("today".equals(type)) {

			Calendar calendar = Calendar.getInstance();// ��������
			calendar.setTime(d);// ���õ�ǰ����
			calendar.add(Calendar.DAY_OF_MONTH, 1);// ��������Ϊbetween�������߽�
			setEndday(df.format(calendar.getTime()));
			setBeginday(df.format(d));

		} else if ("total".equals(type)) {

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
		if(area==null){
			area="";
		}
		area=new String(area.getBytes("ISO-8859-1"),"UTF-8");
		hql = "SELECT new com.can.myapi.AreaAndType(COUNT(*),t.topicType,t.topicLocation) from Topic as t WHERE t.topicLocation='"
				+ area
				+ "' and t.topicPublicTime between '"
				+ beginday
				+ "' and '"
				+ endday
				+ "' GROUP BY t.topicType ORDER BY COUNT(*) ";
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery(hql);
		l = query.list();
		se.beginTransaction().commit();
		return "success";
	}

	public List<AreaAndType> getL() {
		return l;
	}

	public void setL(List<AreaAndType> l) {
		this.l = l;
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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

}
