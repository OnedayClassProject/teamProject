package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class memberDeleteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("useremail");
		String password = request.getParameter("password");
		
		
		
		memberDAO mdao = new memberDAO();
		int check = mdao.loginCheck(email,password);
		
		if(check == 0){
			return null;
		}else if(check == 1){
			mdao.deleteMember(email, password);
		}
		request.setAttribute("check", check);
		
		return "/member/loginCheck.jsp";
	}

}
