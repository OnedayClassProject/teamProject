package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.CommandHandler;
import com.store.db.StoreDAO;

//로그인 수행
public class storeLoginAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		StoreDAO dao = new StoreDAO();
		HttpSession session = request.getSession();
		//int check = dao.loginStore(email, password);
		int check = dao.loginStore("test1@test.test", "123");
		//store DB에 있는 경우
		if(check == 1){
			//session.setAttribute("email", email);
			session.setAttribute("email", "test1@test.test");	
			System.out.println("확인");
		//비밀번호가 틀린경우
		}else if (check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		//이메일이 존재하지 않는 경우
		}else if(check == -1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('이메일이 존재하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		return "/main.do";
	}
	
}
