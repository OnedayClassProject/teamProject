package com.favor.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.favorDAO;

public class isFavorAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			
			String useremail=(String)session.getAttribute("userid");
			int num = Integer.parseInt(request.getParameter("num"));
			
			favorDAO fdao=new favorDAO();
			
			int result = fdao.isFavor(useremail, num);
			
			request.setAttribute("data", result);
			
			System.out.println("result: "+result);
			
			return "board/check.jsp";
	}

	
}
