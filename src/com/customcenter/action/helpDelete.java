package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpDAO;

public class helpDelete implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("number"));
		helpDAO dao = new helpDAO();
		int check = dao.deleteHelp(num);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}

}
