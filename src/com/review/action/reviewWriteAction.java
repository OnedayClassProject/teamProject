package com.review.action;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.review.db.ReviewBean;
import com.review.db.ReviewDAO;

public class reviewWriteAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/thumbnailImage");
		
		System.out.println(realPath);
		
		int max = 100*1024*1024;
		MultipartRequest multipartRequest = new MultipartRequest(request,realPath,max,"UTF-8",new DefaultFileRenamePolicy());
		  
		int class_reg = Integer.parseInt(multipartRequest.getParameter("class_regisitrynum"));
		String storenum =multipartRequest.getParameter("storenum");
		String company_name = multipartRequest.getParameter("company_name");
		String class_name = multipartRequest.getParameter("class_name");
		String subject = multipartRequest.getParameter("subject");
		String email = (String)session.getAttribute("userid");
		String res_date = multipartRequest.getParameter("reservation_date");
		int rating = Integer.parseInt(multipartRequest.getParameter("rating"));
		String content = multipartRequest.getParameter("content");
		String fileImage = multipartRequest.getFilesystemName("image");
		int reserveNum = Integer.parseInt(multipartRequest.getParameter("reserveNum"));
		System.out.println("rating"+rating);
		
		ReviewBean rbean = new ReviewBean();
		rbean.setClass_registrynum(class_reg);
		rbean.setStorenum(storenum);
		rbean.setCompany_name(company_name);
		rbean.setClass_name(class_name);
		rbean.setUseremail(email);
		rbean.setReservation_date(res_date);
		rbean.setRating(rating);
		rbean.setContent(content);
		rbean.setThumbnail(fileImage);
		rbean.setSubject(subject);
		rbean.setReviewdate(new Date(System.currentTimeMillis()));
		rbean.setReservationnum(reserveNum);
		
		ReviewDAO rdao = new ReviewDAO();
		int result = rdao.reviewWrite(rbean);
		
		int sumRating = rdao.sumRating(class_reg);
		int count = rdao.reviewCount(class_reg); 
		double div = sumRating/count;
		int sum = (int)div;
		
		System.out.println("recount"+count);
		System.out.println("div"+div);
		
		rdao.ratingUpdate(class_reg, sum);
		
		rdao.reviewComplete(reserveNum);
		
		request.setAttribute("data", result);
		 
		return "board/check.jsp";
	}
	
	

}
