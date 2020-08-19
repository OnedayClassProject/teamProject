package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class memberInfoAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("useremail");
		
		memberBean mbean = new memberBean();
		memberDAO mdao = new memberDAO();
		
		mbean = mdao.getMember(email);
		
		request.setAttribute("getmember", mbean);
		
		return "member/memberInfo.jsp";
	}
	
	
}
