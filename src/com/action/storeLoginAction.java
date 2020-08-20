package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

//로그인 수행
public class storeLoginAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		StoreDAO dao = new StoreDAO();
		HttpSession session = request.getSession();
		//로그인 수행
		int check = dao.loginStore(email, password);
		//store DB에 있는 경우
		if(check == 1){
			session.setAttribute("storeid", email);
		//비밀번호가 틀린경우
		}else if (check == 0){
			return null;
		}
		request.setAttribute("data", check);
		return "/store/checkEmail.jsp";
	}
	
}
