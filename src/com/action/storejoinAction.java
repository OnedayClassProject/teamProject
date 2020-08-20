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
		boolean result = false;
		
		StoreDAO dao=new StoreDAO();
		
		//회원가입 내용을 담고 있는 bean객체를 전달하여..
		//가입에 성공하면 true리턴, 실패하면 false리턴
		//회원가입 안되도록 일단 주석처리함
		result = dao.insertStore(bean);
	
		//회원 가입 처리에 실패 했을 경우 null을 반환 한다.
		if(result == false){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 실패');");
			out.println("location.href='./storejoin.do'");
			out.println("</script>");
			out.close();
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 성공');");
			out.println("location.href='./main.do'");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
}