package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

//업체 회원가입시 이메일 중복여부 확인
public class storeCheckEmailAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("테스트");
		String email = request.getParameter("email");
		StoreDAO dao = new StoreDAO();
		request.setAttribute("data", dao.emailCheck(email));
		System.out.println(request.getAttribute("data"));
		return "store/checkEmail.jsp";
	}

}
