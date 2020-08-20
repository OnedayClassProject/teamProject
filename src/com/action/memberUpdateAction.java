package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class memberUpdateAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("userid");
		
		memberDAO mdao = new memberDAO();
		
		
		
		memberBean mbean = mdao.getMember(email);
		
		request.setAttribute("getMember",mbean);
		
		return "/member/memberUpdate.jsp";
	}
	
	
}
