package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.ClassCancleBean;
import com.store.db.ClassCancleDAO;

public class storeRefund implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Integer storenum = (Integer)session.getAttribute("storenum");
		String pageNum = request.getParameter("pageNum");
		int pageSize = 12;
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;
		
		ClassCancleDAO ccdao = new ClassCancleDAO();
		int count = ccdao.srefundCount(storenum);
	 
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
	
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		// storenum -> class테이블 class_registrynum -> classcancle 조회
		List<ClassCancleBean> StoreGetCancle = ccdao.StoreGetCancle(storenum,startRow,endRow);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("StoreGetCancle", StoreGetCancle);
		
		return "store/refundList.jsp";
	}
}
