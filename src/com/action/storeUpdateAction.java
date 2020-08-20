package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;

public class storeUpdateAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		StoreDAO dao = new StoreDAO();
		StoreBean bean = new StoreBean();
		bean.setStoreemail(request.getParameter("storeemail"));
		bean.setStorepw(request.getParameter("storepw"));
		bean.setStorename(request.getParameter("storename"));
		bean.setStoretel(request.getParameter("storetel"));
		bean.setStorepostcode(request.getParameter("storepostcode"));
		bean.setStoreaddress1(request.getParameter("storeaddress1"));
		bean.setStoreaddress2(request.getParameter("storeaddress2"));
		bean.setStoreaddress3(request.getParameter("storeaddress3"));
		dao.updateStore(bean);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('수정완료');");
		out.println("location.href='./main.do'");
		out.println("</script>");
		out.close();

		return null;
	}
}
