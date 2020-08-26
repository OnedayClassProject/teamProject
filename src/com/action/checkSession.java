package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;

public class checkSession implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute("userid") != null || request.getSession().getAttribute("storeid") != null){
			request.setAttribute("data", 1);
		}else {
			request.setAttribute("data", 0);
		}
		return "store/checkEmail.jsp";
	}

}
