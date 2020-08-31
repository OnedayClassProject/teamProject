package com.classview;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;

public class ClassCheckAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int data = 1;
		
		request.setAttribute("data", data);
		return "board/check.jsp";
	}
	
	
}
