package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpBean;
import com.help.db.helpDAO;

public class helpPage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		helpDAO dao = new helpDAO();
		helpBean bean = new helpBean();
		bean = dao.getHelpConent(num);
		request.setAttribute("bean", bean);
		request.setAttribute("pageNum", pageNum);
		return "customcenter/helpContent.jsp";
	}

}
