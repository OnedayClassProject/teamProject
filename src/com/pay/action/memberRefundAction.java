package com.pay.action;

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
import com.store.db.ClassCancleBean;
import com.store.db.ClassCancleDAO;

public class memberRefundAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			
		
			try {
				
				int reservationnum = Integer.parseInt(request.getParameter("reservationnum"));
				String price = request.getParameter("price");
				
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
				
				int check = 0;
				ClassCancleDAO ccdao = new ClassCancleDAO();
				
				// 환불 테이블에서 조회해서 환불 여부 확인. 1이면 환불 테이블에 존재
				int result = ccdao.getClassCancle(reservationnum);
				System.out.println("result"+result);
				if(result != 1){ 
					
					
					//환불비교
					if(cur1.before(d1) || cur1.equals(d1)) {
						System.out.println("100%환불입니다.");
						
					} else if(cur1.equals(d2)) {
						price = Double.parseDouble(price) * 0.95+"";
						System.out.println("5% 차감 후 환불입니다.");
		
					} else if(cur1.equals(d3)) {
						price = Double.parseDouble(price) * 0.90+"";
						System.out.println("10% 차감 후 환불입니다.");
		
					} else if(cur1.equals(d4)) {
						price = Double.parseDouble(price) * 0.80+"";
						System.out.println("20% 차감 후 환불입니다.");
		
					} else if(cur1.equals(d5)) {
						price = Double.parseDouble(price)*0.70+"";
						System.out.println("30% 차감 후 환불입니다.");
		
					} else if(cur1.equals(d)) {
						check = 3;
						System.out.println("환불이 되지 않습니다.");
					}
					
					if(check == 0){
						// 환불 테이블에 추가
						check = ccdao.addRefund(reservationnum,price);
					}
					
				}else {
					check = 2;
					System.out.println("환불 진행중");
				}
				System.out.println("check"+check);
				request.setAttribute("check", check);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		return "member/loginCheck.jsp";
	}
	
	

}
