package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.member.db.memberDAO;

public class VIPRegisterAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("userid");
		memberDAO dao = new memberDAO();
		int check = dao.registerVIP(id);
		request.setAttribute("check", check);
		return "/member/loginCheck.jsp";
	}

}
