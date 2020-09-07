package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.notice.db.noticeDAO;

public class noticeDelete implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("number"));
		noticeDAO dao = new noticeDAO();
		int check = dao.deleteNotice(num);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}

}
