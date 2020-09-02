package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;

public class AllGetStore implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		StoreDAO sdao = new StoreDAO();
		List<StoreBean> AllGetStore = sdao.AllGetStore();
		
		request.setAttribute("AllGetStore", AllGetStore);
		
		
		return "Admin/AllGetStore.jsp";
	}
	
}
