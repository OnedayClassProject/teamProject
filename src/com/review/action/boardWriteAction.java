package com.review.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class boardWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int reservationnum = Integer.parseInt(request.getParameter("reservationnum"));
		ReservationDAO rdao = new ReservationDAO();
		ReservationBean rbean = rdao.getOneReservation(reservationnum);
		request.setAttribute("rbean", rbean);
		
		String reservation_date = request.getParameter("reservation_date");
		SimpleDateFormat df = new SimpleDateFormat ( "yyyy-MM-dd" );
		df.setTimeZone ( TimeZone.getTimeZone ( "Asia/Seoul" ) );
		Date rd=null,pd=new Date();
		try{
			rd=df.parse(reservation_date);
			pd=df.parse(df.format(pd));
		}catch(java.text.ParseException e){
			e.printStackTrace();
		}
		int compare1=rd.compareTo(pd);
		if(compare1>0){
			System.out.println("리뷰 작성기간이 아님");
			request.setAttribute("check", 0);
			return "member/reserveList.jsp";
		}
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(rd);
		cal.add(Calendar.DATE, 5);
		rd=cal.getTime();
		
		int compare2=rd.compareTo(pd);
		if(compare2<0){
			System.out.println("리뷰 작성기간 지남");
			request.setAttribute("check", 1);
			return "member/reserveList.jsp";
		}else{
			return "board/boardWrite.jsp";
		}		
	}	
}
