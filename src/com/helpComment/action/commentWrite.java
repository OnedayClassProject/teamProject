package com.helpComment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.helpComment.db.helpCommentBean;
import com.helpComment.db.helpCommentDAO;

public class commentWrite implements CommandHandler{

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
		
		String comment = request.getParameter("comment");
		int num = Integer.parseInt(request.getParameter("num"));
		
		helpCommentDAO dao = new helpCommentDAO();
		helpCommentBean bean = new helpCommentBean();
		bean.setId(id);
		bean.setComment(comment);
		bean.setNum(num);
		int check = dao.insertComment(bean);
		request.setAttribute("data", check);
		return "store/checkEmail.jsp";
	}

}
