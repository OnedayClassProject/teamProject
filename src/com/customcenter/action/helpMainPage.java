package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpDAO;

public class helpMainPage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		helpDAO dao = new helpDAO();
		request.setAttribute("list", dao.getHelpList());
		return "customcenter/help.jsp";
	}

}
