package com.pay.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.ClassCancleDAO;

public class RefundCancleAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int refundnum = Integer.parseInt(request.getParameter("refundnum"));
		
		ClassCancleDAO ccdao = new ClassCancleDAO();
		int check = ccdao.RefundCancle(refundnum);
		
		request.setAttribute("check", check);
		
		return "member/loginCheck.jsp";
	}
	
}
