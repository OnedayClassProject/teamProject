package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.notice.db.noticeBean;
import com.notice.db.noticeDAO;

public class noticePage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		//게시글
		noticeDAO dao = new noticeDAO();
		noticeBean bean = new noticeBean();
		bean = dao.getNoticeConent(num);
		
		
		request.setAttribute("bean", bean);
		request.setAttribute("pageNum", pageNum);
		return "customcenter/noticeContent.jsp";
	}

}
