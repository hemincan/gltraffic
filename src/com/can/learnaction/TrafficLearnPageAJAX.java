package com.can.learnaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.can.hibernate.Marktype;
import com.can.hibernate.MarktypeDAO;
import com.opensymphony.xwork2.ActionSupport;

public class TrafficLearnPageAJAX extends ActionSupport {
	private String result;
	public String execute() throws Exception{
		MarktypeDAO dao=new MarktypeDAO();
		List<Marktype> typelist = dao.findAll();
		List<String> resultlist = new ArrayList<String>();
		Map<String, String> map=new HashMap<String, String>();
		for (int i = 0; i < typelist.size(); i++) {
			map.put("typeid", typelist.get(i).getId()+"");
			map.put("typename", typelist.get(i).getTypeName());
			map.put("describe", typelist.get(i).getTypeDescribe());
			if(typelist.get(i).getTypeImage()==null){
				map.put("image","defalut.png");
			}else{
				
				map.put("image",typelist.get(i).getTypeImage() );
			}
			
			JSONObject json = JSONObject.fromObject(map);
			resultlist.add(json.toString());
		}
		setResult(JSONArray.fromObject(resultlist).toString());
		return SUCCESS;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
