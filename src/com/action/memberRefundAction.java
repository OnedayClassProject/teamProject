package com.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;

public class memberRefundAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			
			String email = (String)session.getAttribute("userid");
			int class_registrynum = Integer.parseInt(request.getParameter("class_registrynum"));
			int reservationnum = Integer.parseInt(request.getParameter("reservationnum"));
			double price = Integer.parseInt(request.getParameter("price"));
			String time = request.getParameter("time");
		
			try {
				//현재 날짜 가져오기
				DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal1 = Calendar.getInstance();
				System.out.println(format1.format(cal1.getTime()));
	
				//예약 날짜
				String data =request.getParameter("reservation_date");
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
	
				Date date = null;
				
				date = format.parse(data);
				
				cal.setTime(date);
	
				//예약환불날짜 저장
				String re1 = format.format(cal.getTime());
				Date d = format.parse(re1);
	
				cal.add(Calendar.DAY_OF_MONTH, -5);
	
				String re2 = format.format(cal.getTime());
	
				Date d1 = format.parse(re2);
	
				cal.add(Calendar.DAY_OF_MONTH, 1);
	
				String re3 = format.format(cal.getTime());
	
				Date d2 = format.parse(re3);
	
				cal.add(Calendar.DAY_OF_MONTH, 1);
	
				String re4 = format.format(cal.getTime());
	
				Date d3 = format.parse(re4);
	
				cal.add(Calendar.DAY_OF_MONTH, 1);
	
				String re5 = format.format(cal.getTime());
	
				Date d4 = format.parse(re5);
	
				cal.add(Calendar.DAY_OF_MONTH, 1);
	
				String re6 = format.format(cal.getTime());
	
				Date d5 = format.parse(re6);
	
				System.out.println(d + " " + d1 + " " + d2 + " " + d3 + " " + d4 + " " +d5);
	
				String cur = format1.format(cal1.getTime());
				Date cur1 = format1.parse(cur);
	
				System.out.println(cur1);

				//환불비교
	
				if(cur1.before(d1) || cur1.equals(d1)) {
					request.setAttribute("check", 1);
					System.out.println("100%환불입니다.");
					
				} else if(cur1.equals(d2)) {
					request.setAttribute("check", 1);
					price = price * 0.95;
					System.out.println("5% 차감 후 환불입니다.");
	
				} else if(cur1.equals(d3)) {
					request.setAttribute("check", 1);
					System.out.println("10% 차감 후 환불입니다.");
	
				} else if(cur1.equals(d4)) {
					request.setAttribute("check", 1);
					System.out.println("20% 차감 후 환불입니다.");
	
				} else if(cur1.equals(d5)) {
					request.setAttribute("check", 1);
					System.out.println("30% 차감 후 환불입니다.");
	
				} else if(cur1.equals(d)) {
					request.setAttribute("check", 1);
					System.out.println("환불이 되지 않습니다.");
	
				} else {
					request.setAttribute("check", 3);
					System.out.println("환불이 되지 않습니다.");
	
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return "member/loginCheck";
	}
	
	

}
