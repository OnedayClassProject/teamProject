package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;

public class storeInfoPage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email =(String)request.getSession().getAttribute("storeid");
		StoreDAO dao = new StoreDAO();
		StoreBean bean = new StoreBean();
		bean = dao.getStore(email);
		request.setAttribute("bean",bean);
		return "store/storeInfo.jsp";
	}

}
