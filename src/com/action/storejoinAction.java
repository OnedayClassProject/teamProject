package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreBean;
import com.store.db.StoreDAO;
import com.sun.beans.editors.IntegerEditor;

//회원가입 수행
public class storejoinAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("StoreJoinAction() 실행");
		
		request.setCharacterEncoding("UTF-8");
		StoreBean bean = new StoreBean();
		bean.setStoreemail(request.getParameter("storeemail"));
		bean.setStorepw(request.getParameter("storepw"));
		bean.setStorename(request.getParameter("storename"));
		bean.setStoretel(request.getParameter("storetel"));
		bean.setStorepostcode(request.getParameter("storepostcode"));
		bean.setStoreaddress1(request.getParameter("storeaddress1"));
		bean.setStoreaddress2(request.getParameter("storeaddress2"));
		bean.setStoreaddress3(request.getParameter("storeaddress3"));

		//회원가입 성공 여부를 담을 변수 선언
		int check = 0;
		
		StoreDAO dao=new StoreDAO();
		
		//회원 가입 처리에 실패 했을 경우 0을 반환 한다.
		//회원가입에 성공하면 1을 반환한다
		check = dao.insertStore(bean);
		request.setAttribute("data", check);
		
		return "/store/checkEmail.jsp";
	}
	
}