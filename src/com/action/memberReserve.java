package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;

public class memberReserve implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		ClassDAO cd = new ClassDAO();
		
		String pageNum = request.getParameter("pageNum");
		int pageSize = 12;
		
		if(pageNum== null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;
		
		int count = cd.reserveCount(userid);
	 
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
	
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		
		ArrayList<ClassBean> list = cd.reserveList(userid,startRow,endRow);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		return "member/reserveList.jsp";
	}

}
