package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;
import com.store.db.StoreDAO;

public class storeReserve implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Integer storenum = (Integer)session.getAttribute("storenum");
		
		ReservationDAO rdao = new ReservationDAO();
		List<ReservationBean> GetReserve = rdao.GetReserve(storenum);
		
		request.setAttribute("GetReserve", GetReserve);
		
		
		
		return "store/reserveList.jsp";
	}

}
