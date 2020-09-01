package com.pwdFind;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class authNumCheck implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); String useremail =
		 * (String)session.getAttribute("userid");
		 */	
		

		request.setCharacterEncoding("UTF-8");
		String email=request.getParameter("email");
		String checkNum=request.getParameter("checkNum");
		
		memberDAO mdao = new memberDAO();
	
/*		int num = mdao.checkNum(checkNum);//인증번호 일치 확인
*/		return "board/check.jsp";
	}

}
