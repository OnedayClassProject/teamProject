package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;


//회원탈퇴 역할 수행
public class storeDeleteAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDAO dao = new StoreDAO();
		String storeemail = request.getParameter("storeemail");
		String storepw = request.getParameter("storepw");
		//회원탈퇴
		int check = dao.deleteStore(storeemail, storepw);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}
}
