package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.StoreDAO;


//회원탈퇴 역할 수행
public class storeDeleteAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreDAO dao = new StoreDAO();
		HttpSession session = request.getSession();
		String storeemail = (String)session.getAttribute("storeid");
		String storepw = request.getParameter("storepw");
		//회원탈퇴
		int check = dao.deleteStore(storeemail, storepw);
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}
}
