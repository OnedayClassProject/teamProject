package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class AdminLoginProAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		memberDAO mdao = new memberDAO();
		int check = mdao.loginCheck(email,password);
		
		if(check == 1){
			session.setAttribute("userid", email);
		}else if(check == 0){
			return null;
		}
		request.setAttribute("check", check);
		
		return "/member/loginCheck.jsp";
	}
	
	
}
