package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpBean;
import com.help.db.helpDAO;

public class helpWriteAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = "";
		if(request.getSession().getAttribute("userid") != null){
			id = (String)request.getSession().getAttribute("userid");
		}else if(request.getSession().getAttribute("storeid") != null){
			id = (String)request.getSession().getAttribute("storeid");
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		helpBean bean = new helpBean();
		bean.setTitle(title);
		bean.setContent(content);
		bean.setWriter(id);
		helpDAO dao = new helpDAO();
		int check = dao.insertHelp(bean);
		request.setAttribute("data",check);
		return "store/checkEmail.jsp";
	}

}
