package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;

public class storeInfoCheckAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("storeInfoCheckAction() 함수");
		String email =request.getParameter("storeemail");
		String password= request.getParameter("storepw");
		StoreDAO dao = new StoreDAO();
		int check = dao.loginStore(email,password);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}

}
