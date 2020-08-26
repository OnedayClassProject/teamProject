package com.helpComment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.helpComment.db.helpCommentDAO;


public class commentDelete implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("number"));
		helpCommentDAO dao = new helpCommentDAO();
		int check = dao.deleteComment(num);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}

}
