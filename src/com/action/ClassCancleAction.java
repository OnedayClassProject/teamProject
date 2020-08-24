package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

public class ClassCancleAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		StoreDAO sdao = new StoreDAO();
		int result = sdao.classCancleTimeDelete(num);
		
		request.setAttribute("data", result);
		
		
		return "store/checkEmail.jsp";
	}

}
