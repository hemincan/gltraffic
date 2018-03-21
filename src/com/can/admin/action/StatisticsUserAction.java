package com.can.admin.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.HibernateSessionFactory;
import com.can.hibernate.UserDAO;
import com.can.myapi.UserRegister;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StatisticsUserAction extends ActionSupport {

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
	private List<UserRegister> l;
	private String totalregister;
	public String execute() throws Exception {
		//System.out.println("dfsdf");
		if (!havelogin()) {
			return "fail";
		}
		//System.out.println("sdfsdf");
		//查询总人数
		UserDAO userDAO=new UserDAO();
		totalregister=userDAO.findAll().size()+"";
		
		String hql = null;
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		Calendar calendar = Calendar.getInstance();// 日历对象
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		se.beginTransaction().commit();
		calendar.setTime(d);// 设置当前日期
		l=new ArrayList<UserRegister>();
		int ss=0;
		for (int i = 0; i <10; i++) {
			calendar.add(Calendar.MONTH, ss);// 天数，因为between不包含边界
			if(ss==0){
				ss=-1;
			}
			String time=df.format(calendar.getTime());
			hql = "select count(*) from User as u where u.userRegistertime like '%"+time+"%'";
			Query query = se.createQuery(hql);
			//System.out.println(time);
			UserRegister us=new UserRegister(time, query.list().get(0).toString());
			l.add(us);
		}
		se.close();
		return "success";
	}
	public List<UserRegister> getL() {
		return l;
	}
	public void setL(List<UserRegister> l) {
		this.l = l;
	}
	public String getTotalregister() {
		return totalregister;
	}
	public void setTotalregister(String totalregister) {
		this.totalregister = totalregister;
	}
}
