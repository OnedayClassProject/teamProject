package com.customcenter.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.CommandHandler;
import com.help.db.helpDAO;
import com.notice.db.noticeDAO;

public class noticeMainPage implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		noticeDAO dao = new noticeDAO();
		int count = dao.getNoticeCount();
		
		// 게시판 가져오기  2페이지 10개 => 시작행 끝행
		// 한페이지에 15개 글을 가져오도록 설정
		int pageSize = 5;
		// 페이지 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		// 시작행번호 구하기  10  1페이지  1번행   2페이지  11번행   3  21번행
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;
		int pageCount =count/pageSize+(count%pageSize==0?0:1);
		//한화면에 보여줄 페이지수 설정
		int pageBlock=1;
		// 한화면에 보여줄 시작페이지 구하기  1~10  => 1  /  11~20 => 11
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		// 한화면에 보여줄 끝페이지 구하기
		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(count!=0){
			request.setAttribute("list", dao.getNoticeList(startRow,pageSize));
		}
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count); 
		request.setAttribute("pageNum", pageNum); 
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "customcenter/notice.jsp";
	}

}

