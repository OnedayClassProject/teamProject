package com.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.review.db.ReviewDAO;

public class DeleteReview implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int class_registrynum=Integer.parseInt(request.getParameter("class_registrynum"));
		int reviewNum=Integer.parseInt(request.getParameter("reviewNum"));
		String reviewId=request.getParameter("reviewId");
		
		ReviewDAO rdao = new ReviewDAO();
		int result = rdao.deleteReview(class_registrynum,reviewNum,reviewId);
		
		request.setAttribute("data", result);
		return "board/check.jsp"; 
	}

}
