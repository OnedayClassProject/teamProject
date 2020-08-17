package com.nullhandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class NullHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/error/errorPage.jsp";
	}

}
