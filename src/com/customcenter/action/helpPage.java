package com.customcenter.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpBean;
import com.help.db.helpDAO;
import com.helpComment.db.helpCommentBean;
import com.helpComment.db.helpCommentDAO;

public class helpPage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		//게시글
		helpDAO dao = new helpDAO();
		helpBean bean = new helpBean();
		bean = dao.getHelpConent(num);
		
		//덧글
		helpCommentDAO cdao = new helpCommentDAO();
		List<helpCommentBean> list = new ArrayList<helpCommentBean>();
		list = cdao.getComment(num);
		
		int count = cdao.commentCount(num);
		
		request.setAttribute("bean", bean);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "customcenter/helpContent.jsp";
	}

}
