package com.like.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.like.db.LikeDAO;

public class likeOffAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String useremail = (String)session.getAttribute("userid");
		int num = Integer.parseInt(request.getParameter("num"));
		
		LikeDAO ldao = new LikeDAO();
		
		int result = ldao.likeOff(num,useremail);
		request.setAttribute("data", result);
		
		return "board/check.jsp";
	}
	
	

}
