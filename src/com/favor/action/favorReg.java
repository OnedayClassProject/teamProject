package com.favor.action;

import java.io.Console;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.favorDAO;

public class favorReg implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String useremail = (String)session.getAttribute("userid");
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("swdssd");
		int result = 0;
		
		favorDAO fdao = new favorDAO();
		
		if(useremail == null) {
			
			result = 0;
			
		} else {
			
			result = fdao.insertFavorite(useremail, num);
			
		}
		
		request.setAttribute("check", result);
		
		return "member/loginCheck.jsp";
	}
	
}
