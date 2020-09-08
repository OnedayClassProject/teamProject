package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.notice.db.noticeBean;
import com.notice.db.noticeDAO;

public class noticeUpdate implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		noticeDAO dao = new noticeDAO();
		noticeBean bean = dao.getNoticeConent(num);
		request.setAttribute("bean", bean);
		request.setAttribute("pageNum", pageNum);
		return "customcenter/noticeUpdate.jsp";
	}

}
