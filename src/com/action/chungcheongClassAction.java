package com.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class chungcheongClassAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String pageNum = request.getParameter("pageNum");
		
		// 한 페이지에 보여질 개수 
		int pageSize = 12;
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		ClassDAO cdao = new ClassDAO();
		int cnt = cdao.chungcheongCount();
		System.out.println(cnt);
		
		int pageCount = cnt/pageSize + (cnt%pageSize == 0 ? 0 : 1);
		int pageBlock = 10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		
		if (endPage > pageCount) endPage = pageCount;
		
		Vector<ClassBean> v = cdao.chungcheongList(startRow, endRow);
		
		request.setAttribute("Vector", v);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", cnt);
		
		return "classList/chungcheongClass.jsp";
	}
	
	


}
