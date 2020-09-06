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

public class TimeDeleteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String date = request.getParameter("date");
		String day = request.getParameter("day");
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(date);
		System.out.println(day);
		
		StoreDAO sdao = new StoreDAO();
		sdao.deleteTime(date, day, num);
		
		request.setAttribute("data", 1);
		
		return "store/checkEmail.jsp";
	}

}
