package com.helpComment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.helpComment.db.helpCommentDAO;

public class commentUpdate implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("number"));
		String comment = request.getParameter("comment");
		helpCommentDAO dao = new helpCommentDAO();
		int check = dao.updateComment(num , comment);
		request.setAttribute("data", check);
		return "store/checkEmail.jsp";
	}

}
