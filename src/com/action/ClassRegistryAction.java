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
		    
		
		
		
		return null;
	}

}
