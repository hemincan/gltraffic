package com.can.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Query;
import org.hibernate.Session;

import com.can.hibernate.Article;
import com.can.hibernate.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleListActionAJAX extends ActionSupport {

	private String result;
	private List<Article> artlist;
	public void get(String hql,int size){
		Session se = HibernateSessionFactory.getSessionFactory().openSession();
		Query query = se.createQuery(hql);
		query.setMaxResults(size);
		artlist = query.list();
		se.beginTransaction().commit();// 查询也要提交事务
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < artlist.size(); i++) {
			String tiltle = artlist.get(i).getArticleTiltle().toString();

			String headimage = null;
			// 提取正文部分的第一张图片做为封面
			String IMGURL_REG = "<img[^>]*?>";
			Matcher matcher = Pattern.compile(IMGURL_REG).matcher(
					artlist.get(i).getArticleContent());
			while (matcher.find()) {
				headimage = matcher.group();
				Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)")
						.matcher(headimage);
				while (m.find()) {
					headimage=m.group(1);
				}
				//System.out.println(headimage);
				break;
			}
			map.put("img", headimage);
			map.put("tiltle", tiltle);

			Timestamp date = artlist.get(i).getArticlePublictime();
			String time = new SimpleDateFormat("MM月dd日").format(date.getTime());
			// String time=date.getMonth()+"月"+date.getDay()+"日";
			map.put("time", time);
			map.put("id", artlist.get(i).getId().toString());
			resultlist.add(JSONObject.fromObject(map).toString());
		}
		setResult(JSONArray.fromObject(resultlist).toString());
		
	}
	public String execute() throws Exception {
		get("from Article as t  order by t.id desc",12);
		return SUCCESS;
	}
	public String banner() throws Exception {//,热闹文章
		get("from Article as t order by t.articleReaded desc",10);
		return SUCCESS;
	}
	public String all() throws Exception {//获取比较多的
		get("from Article as t  order by t.id desc",20);
		return SUCCESS;
	}
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Article> getArtlist() {
		return artlist;
	}

	public void setArtlist(List<Article> artlist) {
		this.artlist = artlist;
	}
}
