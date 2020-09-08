package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpBean;
import com.help.db.helpDAO;

public class helpUpdateAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		helpBean bean = new helpBean();
		bean.setTitle(title);
		bean.setContent(content);
		bean.setNum(num);
		helpDAO dao = new helpDAO();
		int check = dao.updateHelp(bean);
		request.setAttribute("data", check);
		return "store/checkEmail.jsp";
	}
	
}
