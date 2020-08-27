package com.like.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.like.db.LikeDAO;

public class likeOnAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String useremail = (String)session.getAttribute("userid");
		
		int result = 0;
		
		
		LikeDAO ldao = new LikeDAO();
		if(useremail == null){
			useremail ="";
			result = 0;
		}else{
			result = ldao.likeOn(num,useremail);
		}
		request.setAttribute("data", result);
		
		return "board/check.jsp";
	}
	
	

}
