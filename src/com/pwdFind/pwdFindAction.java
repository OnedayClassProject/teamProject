package com.pwdFind;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class pwdFindAction implements CommandHandler {

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
		
		String authNum = mdao.authNum();//DAO 랜덤으로 받아서 뿌리는 authnum
		boolean result = mdao.sendEmail(email,authNum);//메일 전송

		request.setAttribute("data",authNum);
		
/*		int num = mdao.checkNum(checkNum);//인증번호 일치 확인
*/		return "board/check.jsp";
	}

}
