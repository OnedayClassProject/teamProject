package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.command.CommandHandler;
import com.member.db.memberDAO;

public class memberCheckAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		
		System.out.println(email);
		memberDAO mdao = new memberDAO();
		
		int result = mdao.checkEmail(email);
		
		request.setAttribute("result", result);
		
		return "member/memberCheck.jsp";
		
	}
	
	

}
