package com.action;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.store.db.ClassBean;
import com.store.db.StoreDAO;

public class ClassRegistryAction implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 	request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html; charset=UTF-8");

		    ServletContext ctx = request.getServletContext();
		    String realPath = ctx.getRealPath("/thumbnailImage");
		    
		    System.out.println(realPath);
		    
		    int max = 100*1024*1024;
		    MultipartRequest multipartRequest = new MultipartRequest(request,realPath,max,"UTF-8",new DefaultFileRenamePolicy());
		    
		    int storeNum = Integer.parseInt(multipartRequest.getParameter("storenum"));
		    String name = multipartRequest.getParameter("classname");
		    String category = multipartRequest.getParameter("category");
		    String company = multipartRequest.getParameter("class_company");
		    String location = multipartRequest.getParameter("location");
		    String  level  = multipartRequest.getParameter("level");
		    String hour = multipartRequest.getParameter("hour");
		    String minute = multipartRequest.getParameter("minute");
		    String time = hour + "시간" + minute + "분";
		    String personnel = multipartRequest.getParameter("class_personal");
		    String price = multipartRequest.getParameter("price");
		    String sale = multipartRequest.getParameter("sale");
		    if(sale == null) {
		    	sale = "안함";
		    }
		    String parking = multipartRequest.getParameter("parking");
		    if(parking == null) {
		    	parking = "없음";
		    }
		    String content = multipartRequest.getParameter("content");
		    String fileImage = multipartRequest.getFilesystemName("image");
		    
		    ClassBean cb = new ClassBean();
		    cb.setStorenum(storeNum);
		    cb.setClass_name(name);
		    cb.setCategory(category);
		    cb.setClass_company(company);
		    cb.setLocation(location);
		    cb.setLevel(level);
		    cb.setTime(time);
		    cb.setPersonnel(personnel);
		    cb.setPrice(price);
		    cb.setSale(sale);
		    cb.setParking(parking);
		    cb.setContent(content);
		    cb.setThumbnail(fileImage);
		    
		    StoreDAO sdao = new StoreDAO();
		    int result = sdao.classRegistry(cb);
		    request.setAttribute("data", result);
		return "store/checkEmail.jsp";
	}

}
