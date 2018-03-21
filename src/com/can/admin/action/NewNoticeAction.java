package com.can.admin.action;

import java.sql.Timestamp;
import java.util.Map;

import com.can.hibernate.Notice;
import com.can.hibernate.NoticeDAO;
import com.can.hibernate.User;
import com.can.hibernate.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewNoticeAction extends ActionSupport{
	private Notice notice;
	public String execute() throws Exception {
		//session中获得管理员帐号
		Map<String, Object> session = ActionContext.getContext().getSession();
		String userid=(String) session.get("userid");
		String indentity=(String) session.get("indentity");
		if(userid==null || "".equals(userid)||indentity.equals("普通用户")){
			System.out.println("用户没有登录！");
			return "fail";
		}
	  
		UserDAO userdao=new UserDAO();
		User user=(User) userdao.findByUserId(userid).get(0);
		notice.setUser(user);
		notice.setNoticeReaded(0);
		notice.setNoticeState((short) 0);
		if(notice.getNoticeTiltle()==null||"".equals(notice.getNoticeTiltle())){
			notice.setNoticeTiltle("");
		}

		NoticeDAO noticedao=new NoticeDAO();
		noticedao.save(notice);
		noticedao.getSession().beginTransaction().commit();
		noticedao.getSession().close();
		System.out.println("管理员的公告发布成功");
		return "success";
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	
}
