package com.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class popularClassAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ClassDAO cdao = new ClassDAO();
		Vector<ClassBean> v= cdao.getClassInfo();
		
		//View페이지로 응답값을 전달 하기 위해...임시로 request내장객체영역에 응답할 값을 저장
		//응답할 값 : DB로 부터 조회한 전체 클래스 정보  Vector
		request.setAttribute("Vector", v);
	
		

		return "classList/popularClass.jsp";
	}

	
	
	
}
