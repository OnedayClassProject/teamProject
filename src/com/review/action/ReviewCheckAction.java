package com.review.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;

public class ReviewCheckAction implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		//리뷰쓸수있는기간
		//현재 날짜 가져오기
			DateFormat f= new SimpleDateFormat("yyyy-MM-dd");
			
			Calendar c = Calendar.getInstance();
			try {
			System.out.println(f.format(c.getTime()));
			String current = f.format(c.getTime());
			Date current2 = f.parse(current);
			
			//예약 날짜
//			String review =request.getParameter("date");
			String review ="2020-09-07";
			DateFormat review1 = new SimpleDateFormat("yyyy-MM-dd");
			
			
			Calendar c1 = Calendar.getInstance();
			Date c3 = null;
			
			c3 = review1.parse(review);
			c1.setTime(c3);
			String review2 = review1.format(c1.getTime());
			Date par1 = review1.parse(review2);
			c1.add(Calendar.DAY_OF_MONTH, 5);
			String review3 = review1.format(c1.getTime());
			Date par2 = review1.parse(review3);
			
			System.out.println(par1 + " "+par2 );
			
			
			if(current2.after(par1) || current2.equals(par1)) {
				if(current2.before(par2) || current2.equals(par2)) {
					System.out.println("리뷰를 쓸 수 있습니다.");
					request.setAttribute("check", 1);
				} else {
					System.out.println("기간이 지나서 쓰실 수 없습니다.");
					request.setAttribute("check", 2);
				}
			} else {
				System.out.println("기간이 되지 않아서 쓰실 수 없습니다.");
				request.setAttribute("check", 3);
			}
		
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return "member/loginCheck.jsp";
	}

}
