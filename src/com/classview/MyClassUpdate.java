package com.classview;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class MyClassUpdate implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			String class_registrynum=request.getParameter("class_registrynum");
			int storenum=Integer.parseInt(request.getParameter("storenum"));
			
			
			ClassDAO cdao = new ClassDAO();
			
			ClassBean cbean=cdao.getClassbean(class_registrynum,storenum);
			
			request.setAttribute("cbean", cbean);
		
		
			return "/store/MyClassUpdate.jsp";
	
	}

}
