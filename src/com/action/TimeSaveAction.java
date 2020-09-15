package com.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.store.db.StoreDAO;
import com.store.db.TimeSaveBean;

public class TimeSaveAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] list = request.getParameterValues("start");
		String[] list1 = request.getParameterValues("end");
		String date = request.getParameter("date");
		String day = request.getParameter("day");
		int personal = Integer.parseInt(request.getParameter("personal"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		StoreDAO sdao = new StoreDAO();
		for(int i = 0; i < list.length; i++) {
			TimeSaveBean bean = new TimeSaveBean();
			bean.setClass_registrynum(num);
			bean.setClass_date(date);
			bean.setClass_day(day);
			bean.setClass_starttime(list[i]);
			bean.setClass_endtime(list1[i]);
			bean.setPersonal(personal);
			bean.setCalnum(i+1);
			sdao.insetTime(bean);
		}
		sdao.deleteSpaceTime();
		
		request.setAttribute("data", 1);
		
		return "store/checkEmail.jsp";
	}

}
