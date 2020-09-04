package com.pay.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;

public class PayAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String useremail = (String)session.getAttribute("userid");
		String class_name = request.getParameter("class_name");
		String reservation_category = request.getParameter("reservation_category");
		String reservation_personnel = request.getParameter("reservation_personnel");
		String reservation_date = request.getParameter("reservation_date");
		String reservation_price = request.getParameter("reservation_price");
		String reservation_pay = request.getParameter("reservation_pay");
		String reservation_tel = request.getParameter("reservation_tel");
		String reservation_location = request.getParameter("reservation_location");
		String point = request.getParameter("point");
		int class_registrynum = Integer.parseInt(request.getParameter("class_registrynum"));
		String content = request.getParameter("content");
		ReservationBean rbean = new ReservationBean();
		
		rbean.setUseremail(useremail);
		rbean.setClass_name(class_name);
		rbean.setReservation_category(reservation_category);
		rbean.setReservation_personnel(reservation_personnel);
		rbean.setReservation_date(reservation_date);
		rbean.setReservation_price(reservation_price);
		rbean.setReservation_pay(reservation_pay);
		rbean.setReservation_tel(reservation_tel);
		rbean.setReservation_location(reservation_location);
		rbean.setPoint(point);
		rbean.setClass_registrynum(class_registrynum);
		rbean.setContent(content);
		
		rbean.setPay_date(new Timestamp(System.currentTimeMillis()));
		
		ReservationDAO rdao = new ReservationDAO();
		rdao.addReservation(rbean);
		
		
		int data = 1;
		
		request.setAttribute("data", data);
		
		return "board/check.jsp";
	}
	
	
}
