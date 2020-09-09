package com.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class storeInfoCheck implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Integer storenum1=(Integer)session.getAttribute("storenum");
		int storenum=storenum1.intValue();
		
		int startRow = 0;
		int endRow = 3;
		
		ClassDAO cdao = new ClassDAO();
		int count = cdao.StoreClassCount(storenum);
		
		ArrayList <ClassBean> list = cdao.getStoreClassInfo(storenum,startRow,endRow);
		 
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		
		return "store/Storepage.jsp";
	}

}
