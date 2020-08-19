package com.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;

public class TimeSaveAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] list = request.getParameterValues("start");
		String[] list1 = request.getParameterValues("end");
		String date = request.getParameter("date");
		String day = request.getParameter("day");
		
		System.out.println(Arrays.toString(list));
		System.out.println(Arrays.toString(list1));
		System.out.println(date);
		System.out.println(day);
		
		return null;
	}

}
