package com.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class VipDateCheckAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		if(userid != null) {
		memberDAO mdao = new memberDAO();
		memberBean mbean = mdao.getMember(userid);
		String vip_finish = mbean.getVip_finish();
		if(vip_finish.equals("0")) {
			request.setAttribute("check", 0);
			return "member/loginCheck.jsp";
		}
		String date = vip_finish.substring(0,10);
		System.out.println(date);
		
		try {
		DateFormat f= new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar c = Calendar.getInstance();
		
		System.out.println(f.format(c.getTime()));
		String current = f.format(c.getTime());
		Date current2 = f.parse(current);
		
		
		//vip만료일
		String review =date;
		DateFormat review1 = new SimpleDateFormat("yyyy-MM-dd");
		
		
		Calendar c1 = Calendar.getInstance();
		Date c3 = null;
		
		c3 = review1.parse(review);
		c1.setTime(c3);
		String review2 = review1.format(c1.getTime());
		Date par1 = review1.parse(review2);
		if(current2.after(par1)) {
			request.setAttribute("check", 1);
			mdao.vipFinish(userid);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		} else {
			request.setAttribute("check", 0);
		}
		
		return "member/loginCheck.jsp";
	}

}
