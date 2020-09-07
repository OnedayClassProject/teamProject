package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.notice.db.noticeBean;
import com.notice.db.noticeDAO;

public class noticeWriteAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int header = Integer.parseInt(request.getParameter("header"));
		System.out.println("header: "+ header);
		noticeBean bean = new noticeBean();
		bean.setTitle(title);
		bean.setContent(content);
		bean.setHeader(header);
		noticeDAO dao = new noticeDAO();
		int check = dao.insertNotice(bean);
		request.setAttribute("data",check);
		return "store/checkEmail.jsp";
	}

}
