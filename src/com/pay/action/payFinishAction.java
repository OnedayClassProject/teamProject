package com.pay.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.StoreDAO;

public class payFinishAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int class_registrynum = Integer.parseInt(request.getParameter("class_registrynum"));
		String reservation_personnel = request.getParameter("reservation_personnel");
		String reservation_price = request.getParameter("reservation_price");
		String user_name = request.getParameter("user_name");
		String reservation_date = request.getParameter("reservation_date");
		String content = request.getParameter("content");
		
		StoreDAO sdao = new StoreDAO();
		ClassBean cbean = sdao.getClass(class_registrynum);
		
		request.setAttribute("cbean", cbean);
		request.setAttribute("reservation_personnel", reservation_personnel);
		request.setAttribute("reservation_price", reservation_price);
		request.setAttribute("user_name", user_name);
		request.setAttribute("reservation_date", reservation_date);
		request.setAttribute("content", content);
		
		
		return "pay/payCom.jsp";
	}
	

}
