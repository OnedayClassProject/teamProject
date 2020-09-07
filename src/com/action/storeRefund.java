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
		
		// storenum -> class테이블 class_registrynum -> classcancle 조회
		ClassCancleDAO ccdao = new ClassCancleDAO();
		List<ClassCancleBean> StoreGetCancle = ccdao.StoreGetCancle(storenum);
		
		request.setAttribute("StoreGetCancle", StoreGetCancle);
		
		return "store/refundList.jsp";
	}
}
