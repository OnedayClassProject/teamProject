package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;

public class checkWriter implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = "";
		if(request.getSession().getAttribute("userid") != null){
			id = (String)request.getSession().getAttribute("userid");
		}else if(request.getSession().getAttribute("storeid") != null){
			id = (String)request.getSession().getAttribute("storeid");
		}
		if(id.equals(request.getParameter("check"))){
			request.setAttribute("data", 1);
		}else{
			request.setAttribute("data", 0);
		}
		return "/store/checkEmail.jsp";
	}

}
