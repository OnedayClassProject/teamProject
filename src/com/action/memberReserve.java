package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;

public class memberReserve implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		   HttpSession session = request.getSession();
		      
	      String email = (String)session.getAttribute("userid");
	      
	      ReservationDAO rdao = new ReservationDAO();
	      List<ReservationBean> GetReserve = rdao.memReserve(email);
	      
	      request.setAttribute("GetReserve", GetReserve);
		      
		return "member/reserveList.jsp";
	}

}
