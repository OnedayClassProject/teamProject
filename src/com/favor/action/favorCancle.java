package com.favor.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.favorDAO;

public class favorCancle implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String useremail = (String)session.getAttribute("userid");
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = 0;
		
		favorDAO fdao = new favorDAO();
		
		result = fdao.deleteFavorite(useremail, num);
		
		request.setAttribute("check", result);
		
		return "member/loginCheck.jsp";
	}

}
