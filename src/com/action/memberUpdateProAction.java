package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class memberUpdateProAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("userid");
		String name = request.getParameter("username");
		memberBean mbean = new memberBean();
		
		mbean.setUseremail(email);
		mbean.setUsername(name);
		mbean.setPhone(request.getParameter("phone"));
		mbean.setPostcode(request.getParameter("postcode"));
		mbean.setAddress(request.getParameter("address"));
		mbean.setDetailadd(request.getParameter("detailadd"));
		mbean.setExtraadd(request.getParameter("extraadd"));
		
		memberDAO mdao = new memberDAO();
		
		int check = mdao.updateMember(mbean);
		
		request.setAttribute("check",check );
		
		return "/member/loginCheck.jsp";
	}
	

}
