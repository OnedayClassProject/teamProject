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
    
	//처음에 hachmap을 만들어준다.
	//맵핑한 주소값과 클래스를 담기 위한 hashmap
	private Map<String,CommandHandler> commandHandlerMap = new HashMap<>();
    
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init() throws ServletException{
		
		
		//web.xml에 init-param 부분에 이름은 configFile로 되어있고
		//값은 commandHandler.properties라고 정의했습니다.
		//configFile = commandHandler.properties <- 의미
		//getInitParameter("configFile")로 commandHandler.properties 호출
		String configFile = getInitParameter("configFile");
		//properties 파일을 읽을 수 있는 Properties 객체 생성
		Properties prop = new Properties();
		//commandHandler.properties가 있는 경로를 저장
		String configFilePath = getServletContext().getRealPath(configFile);
		
		//FileReader로 file을 읽어온다.
		try(FileReader fis = new FileReader(configFilePath)){
			//위에서 만든 properties객체에 FileReader로 읽어온 파일을 로드
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		//properties 파일에 있는 키값을 반복문돌린다.
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			//command에는 key값이 들어가 있다.
			String command = (String)keyIter.next();
			//key값으로 handlerClassName에 value 값을 저장시킨다.
			String handlerClassName = prop.getProperty(command);
			try {
				//value값을 클래스로 찾아와서 저장
				Class<?> handlerClass = Class.forName(handlerClassName);
				//class를 CommandHandler 인터페이스타입으로 바꿔서 저장
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				// 맨 위에서 만든 commandHandlerMap에 키값과 Value(Class)값을 넣어줍니다.
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
		//요청한 주소가 request로 받아와 command에 저장
		//예) /프로젝트명/login.do <- 출력
		String command = request.getRequestURI();
		System.out.println(command);
		System.out.println(command.indexOf(request.getContextPath()));
		System.out.println(command.substring(request.getContextPath().length()));
		//if문에서 /프로젝트명 <- 있으면 0을 반환하고 없으면 -1을 반환합니다.
		if(command.indexOf(request.getContextPath()) == 0) {
			// /프로젝트명 길이를 구해서 /프로젝트명/login.do -> /login.do 
			// 앞에 처럼 경로를 /프로젝트명 길이만큼 잘라서 반환해서 저장
			command = command.substring(request.getContextPath().length());
		}
		//properties파일에 /login.do가 있다면 value(class)값을 반환
		//handler에는 클래스가 들어간다.
		CommandHandler handler = commandHandlerMap.get(command);
		//handler가 null이면 에러페이지이동 
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			//액션페이지에서 나온 값을 반환받아서 저장
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
