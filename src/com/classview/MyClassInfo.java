package com.classview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class MyClassInfo implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		
		Integer storenum1=(Integer)session.getAttribute("storenum");
		int storenum=storenum1.intValue();
		
		String storeemail=(String)session.getAttribute("storeemail");
		
		ClassDAO cdao = new ClassDAO();

		String pageNum = request.getParameter("pageNum");
		int pageSize = 12;
		
		if(pageNum== null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;

		int count = cdao.StoreClassCount(storenum);
	 
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
	
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		ArrayList <ClassBean> list = cdao.getStoreClassInfo(storenum,startRow,endRow);
  
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		
		request.setAttribute("storenum",storenum);
		request.setAttribute("storeemail", storeemail);
				
		
		return "/store/MyClass.jsp";
	}

}
