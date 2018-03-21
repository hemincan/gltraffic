package com.can.action;


import com.can.hibernate.Notice;
import com.can.hibernate.NoticeDAO;
import com.opensymphony.xwork2.ActionSupport;

public class DetailNoticeAction extends ActionSupport {
	private int id;
	private Notice notice;
	public String execute() throws Exception {

		NoticeDAO noticeDAO =new NoticeDAO();
		noticeDAO.getSession().beginTransaction().commit();
		notice= noticeDAO.findById(id);
		if(notice==null){
			System.out.println("找不到这个文章");
			return "fail";
		}
		notice.setNoticeReaded(notice.getNoticeReaded()+1);
		noticeDAO.getSession().update(notice);
		noticeDAO.getSession().beginTransaction().commit();
		noticeDAO.getSession().close();
		return "success";
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
