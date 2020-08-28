package com.classview;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.StoreDAO;

public class ClassViewAction implements CommandHandler {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		
		int classNum = Integer.parseInt(request.getParameter("class_registrynum"));
		
		StoreDAO sdao = new StoreDAO();
		ClassBean cb = sdao.getClass(classNum);
		
		
		request.setAttribute("cb", cb);
		
		return "classList/classView.jsp";
	}
	
}
