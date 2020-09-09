package com.favor.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.like.db.LikeBean;
import com.like.db.LikeDAO;
import com.member.db.favorDAO;
import com.store.db.ClassBean;

public class MemberFavor implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("userid");
		
		favorDAO fdao = new favorDAO();
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 12;
		
		if(pageNum== null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;
		
		int count = fdao.favorCount(email);
		
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
		
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		ArrayList<ClassBean> list = fdao.favorList(email,startRow,endRow);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		return "member/favorList.jsp";
	}
	
}
