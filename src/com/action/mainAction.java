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

public class mainAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		
		ClassDAO cdao = new ClassDAO();
		ArrayList <ClassBean> list = cdao.popularList(0,20);
		
		request.setAttribute("list", list);
		
		return "index.jsp";
	}

}
