package com.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class memberJoinProAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		memberBean mbean = new memberBean();
		mbean.setUseremail(request.getParameter("useremail"));
		mbean.setUserpassword(request.getParameter("userpassword"));
		mbean.setUsername(request.getParameter("username"));
		mbean.setPhone(request.getParameter("phone"));
		mbean.setPostcode(request.getParameter("postcode"));
		mbean.setAddress(request.getParameter("address"));
		mbean.setDetailadd(request.getParameter("detailadd"));
		mbean.setExtraadd(request.getParameter("extraadd"));
		mbean.setJoindate(new Timestamp(System.currentTimeMillis()));
		
		boolean result = false;
		
		memberDAO mdao = new memberDAO();
		
		result = mdao.insertMember(mbean);
		
		if(result == false){
			return null;
		}
		
		
		return "/member/memberLogin.jsp";
	}
	
	
	
}
