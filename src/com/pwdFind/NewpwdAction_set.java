package com.pwdFind;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class NewpwdAction_set implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email=request.getParameter("email");
		String userpassword=request.getParameter("userpassword");
		
		memberDAO mdao = new memberDAO();
		
		int data = mdao.pwdUpdate(email,userpassword);
		
		request.setAttribute("data", data);
		return "/board/check.jsp";

}
	
}
