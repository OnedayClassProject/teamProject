package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;

public class ClassCreateAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		 
		String storeid = (String)session.getAttribute("storeid");
		
		StoreDAO sdao = new StoreDAO();
		int num = sdao.getClassNum();
		
		StoreBean sBean = sdao.getStore(storeid);
		
		request.setAttribute("num", num);
		request.setAttribute("sbean", sBean);
		
		return "store/classCreate.jsp";
	}

}
