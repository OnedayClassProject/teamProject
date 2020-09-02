package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.StoreDAO;

public class GetClass implements CommandHandler{

 	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String storeemail = request.getParameter("email");
		
		StoreDAO sdao = new StoreDAO();
		List<ClassBean> AllGetClass = sdao.AllGetClass(storeemail);
		
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		for(int i = 0; i < AllGetClass.size();i++){
			JSONObject save = new JSONObject();
			save.put("class_registrynum", AllGetClass.get(i).getClass_registrynum());
			save.put("class_name",AllGetClass.get(i).getClass_name() );
			save.put("level", AllGetClass.get(i).getLevel());
			save.put("time", AllGetClass.get(i).getTime()); //소요시간
			save.put("thumbnail", AllGetClass.get(i).getThumbnail());
			save.put("personnel", AllGetClass.get(i).getPersonnel());
			save.put("price", AllGetClass.get(i).getPrice());
			save.put("sale", AllGetClass.get(i).getSale());
			save.put("reservation_count", AllGetClass.get(i).getReservation_count());
			save.put("rating", AllGetClass.get(i).getRating());
			
			array.add(save);
			
		}
		object.put("all", array);
		
		request.setAttribute("allData", object.toJSONString());
		System.out.println(object.toJSONString());
		return "Admin/classData.jsp";
	}

	
}
