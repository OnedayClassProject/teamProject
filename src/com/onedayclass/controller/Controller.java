package com.onedayclass.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.nullhandler.NullHandler;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Map<String,CommandHandler> commandHandlerMap = new HashMap<>();
    
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init() throws ServletException{
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		try(FileReader fis = new FileReader(configFilePath)){
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String handlerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String command = request.getRequestURI();
		System.out.println(command);
		System.out.println(command.indexOf(request.getContextPath()));
		System.out.println(command.substring(request.getContextPath().length()));
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		CommandHandler handler = commandHandlerMap.get(command);
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(viewPage != null) {
//			request.setAttribute("views", viewPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
