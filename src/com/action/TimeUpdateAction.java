package com.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;
import com.store.db.TimeSaveBean;

public class TimeUpdateAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] list = request.getParameterValues("start");
		String[] list1 = request.getParameterValues("end");
		String date = request.getParameter("date");
		String day = request.getParameter("day");
		int personal = Integer.parseInt(request.getParameter("personal"));
		int num = Integer.parseInt(request.getParameter("num"));
		String[] calNum = request.getParameterValues("calNum");
		
		System.out.println(Arrays.toString(list));
		System.out.println(Arrays.toString(list1));
		System.out.println(date);
		System.out.println(day);
		
		StoreDAO sdao = new StoreDAO();
		for(int i = 0; i < list.length; i++) {
			int calNum2 = Integer.parseInt(calNum[i]);
			sdao.updateTime(list[i],list1[i],date,day,personal,num,calNum2);
		}
		
		request.setAttribute("data", 1);
		
		return "store/checkEmail.jsp";
	}

}
