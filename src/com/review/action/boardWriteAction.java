package com.review.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;
import com.store.db.ReservationBean;
import com.store.db.ReservationDAO;
import com.store.db.StoreDAO;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class boardWriteAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		
			int classnum = Integer.parseInt(request.getParameter("class_registrynum"));
			int reservenum = Integer.parseInt(request.getParameter("reservenum"));
			String date = request.getParameter("date");
			
			StoreDAO sd = new StoreDAO();
			ClassBean bean = sd.getClass(classnum);
			
			
			request.setAttribute("bean", bean);
			request.setAttribute("reserveNum", reservenum);
			request.setAttribute("date", date);
			
			return "board/boardWrite.jsp";
	}	
}
