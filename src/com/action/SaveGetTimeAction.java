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

public class SaveGetTimeAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String date = request.getParameter("date");
		String day  = request.getParameter("day");
		int num = Integer.parseInt(request.getParameter("num"));
		
		StoreDAO sdao = new StoreDAO();
		ArrayList<TimeSaveBean> list = sdao.getTime(date, day, num);
		
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject time = new JSONObject();
			time.put("start", list.get(i).getClass_starttime());
			time.put("end", list.get(i).getClass_endtime());
			time.put("currentpersonal", list.get(i).getCurrentpersonal());
			time.put("calnum",list.get(i).getCalnum());
			
			array.add(time);
		}
		
		object.put("time",array);
			
		request.setAttribute("data", object.toJSONString());
		System.out.println(object.toJSONString());
		
		return "store/checkEmail.jsp";
	}

}
