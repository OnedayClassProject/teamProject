package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.command.CommandHandler;
import com.store.db.StoreDAO;
import com.store.db.TimeSaveBean;

public class TimeSettingAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String date = request.getParameter("date");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		StoreDAO sdao = new StoreDAO();
		ArrayList<TimeSaveBean> list = sdao.getAllDate(date, num);
		
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		for(int i=0; i < list.size(); i++) {
			JSONObject save = new JSONObject();
			save.put("date", list.get(i).getClass_date());
			save.put("day", list.get(i).getClass_day());
			
			array.add(save);
		}
		
		object.put("all", array);
		
		request.setAttribute("date", object.toJSONString());
		System.out.println(object.toJSONString());
		
		return "store/timeSetting.jsp";
	}

}
