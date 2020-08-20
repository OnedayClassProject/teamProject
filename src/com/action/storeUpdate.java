package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

//회원 수정 forward
public class storeUpdate implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String storemail = (String)request.getSession().getAttribute("storeid");
		StoreDAO dao = new StoreDAO();
		request.setAttribute("store", dao.getStore(storemail));
		return "store/storeupdate.jsp";
	}

}
