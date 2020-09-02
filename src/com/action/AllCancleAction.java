package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

public class AllCancleAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String num =request.getParameter("num");
		
		
		if(num != null) {
			
			int num2 = Integer.parseInt(num);
			StoreDAO sdao = new StoreDAO();
			int result = sdao.classCancleDelete(num2);
			result = sdao.classCancleTimeDelete(num2);
			request.setAttribute("data", result);
		} else {
			request.setAttribute("data", 0);
		}
		return "store/checkEmail.jsp";
	}

}
