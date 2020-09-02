package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberBean;
import com.member.db.memberDAO;

public class AllGetMember implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		memberDAO mdao = new memberDAO();
		List<memberBean> AllGetMem = mdao.AllGetMember();
		
		request.setAttribute("AllGetMem", AllGetMem);
		
		return "/Admin/AllGetMember.jsp";
	}
	
	
}
