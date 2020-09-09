package com.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.review.db.ReviewBean;
import com.review.db.ReviewDAO;

public class MemberReview implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("userid");
		String pageNum = request.getParameter("pageNum");
		
		int pageSize = 12;
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;
		
		ReviewDAO rdao = new ReviewDAO();
		
		int count = rdao.mReviewCount(email);
		
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
		
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		ArrayList<ReviewBean> list = rdao.MyReview(email,startRow,endRow);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		System.out.println("count"+count);
		System.out.println("list"+list);
		
		return "member/reviewList.jsp";
	}
	
}
