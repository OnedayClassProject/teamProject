<%@page import="com.store.db.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("checkEmail 실행");
	String email = request.getParameter("email");
	StoreDAO dao = new StoreDAO();
%>
<%=dao.emailCheck(email)%>