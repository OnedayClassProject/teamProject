package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class MyPageAction implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("userid");
		memberDAO mdao = new memberDAO();		
		memberBean mbean = mdao.getMember(email);
		request.setAttribute("getMember",mbean);
		
		ClassDAO mcdao = new ClassDAO();
		ArrayList <ClassBean> myList = mcdao.myList(email);
		request.setAttribute("myList", myList);		
		
		ClassDAO rcdao = new ClassDAO();
		ArrayList <ClassBean> refundList = rcdao.refundList(email);
		request.setAttribute("refundList", refundList);
		
		return "/member/mypagee.jsp";
	}	

}
