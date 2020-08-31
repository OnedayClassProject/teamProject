package com.classview;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;
import com.store.db.StoreDAO;

public class ClassPayAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("userid");
		
		String person_num = request.getParameter("person_num");
		String reserve_date = request.getParameter("reserve_date");
		String sum_price = request.getParameter("sum_price");
		String time = request.getParameter("time");
		
		int class_registrynum = Integer.parseInt(request.getParameter("class_registrynum"));
		
		System.out.println("email"+email);
		System.out.println(person_num);
		System.out.println(reserve_date);
		System.out.println(sum_price);
		System.out.println(class_registrynum);
		System.out.println(time);
		
		StoreDAO sdao = new StoreDAO();
		ClassBean cbean = sdao.getClass(class_registrynum);
		
		memberDAO mdao = new memberDAO();
		memberBean mbean = mdao.getMember(email);
		
		request.setAttribute("cbean", cbean);
		request.setAttribute("mbean", mbean);
		
		request.setAttribute("person_num",person_num);
		request.setAttribute("reserve_date", reserve_date);
		request.setAttribute("sum_price", sum_price);
		request.setAttribute("time", time);
		
		
		return "pay/paypage.jsp";
	}
	
	

}
