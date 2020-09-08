package com.review.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.command.CommandHandler;
import com.review.db.ReviewBean;
import com.review.db.ReviewDAO;
import com.store.db.ClassBean;
import com.store.db.ClassDAO;

public class GetReview implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int class_num = Integer.parseInt(request.getParameter("class_registrynum"));
		String pageNum = request.getParameter("pageNum");

		int pageSize = 7;
		
		if(pageNum== null){
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage - 1) * pageSize ;
		int endRow = pageSize;
		
		ReviewDAO rdao = new ReviewDAO();

		int count = rdao.reviewCount(class_num);
	 
		int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
	
		int pageBlock=10;
		
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		if(endPage>pageCount) endPage=pageCount;
		
		ArrayList <ReviewBean> list = rdao.reviewAllList(class_num,startRow,endRow);

/*		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
*/

		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObject1 = new JSONObject();
			jsonObject1.put("num", list.get(i).getReviewnum());
			jsonObject1.put("class_registrynum", list.get(i).getClass_registrynum());
			jsonObject1.put("storenum", list.get(i).getStorenum());
			jsonObject1.put("class_name", list.get(i).getClass_name());
			jsonObject1.put("useremail", list.get(i).getUseremail());
			jsonObject1.put("thumbnail", list.get(i).getThumbnail());
			jsonObject1.put("subject", list.get(i).getSubject());
			jsonObject1.put("content", list.get(i).getContent());
			jsonObject1.put("reviewdate", list.get(i).getReviewdate().toString());
			jsonObject1.put("rating", list.get(i).getRating());
			jsonObject1.put("reservation_date", list.get(i).getReservation_date());
	        jsonObject1.put("startPage",startPage);
	        jsonObject1.put("endPage",endPage);
	        
			jsonArray.add(jsonObject1);
		}
		jsonObject.put("review", jsonArray);
		
		System.out.println(jsonObject.toJSONString());
		request.setAttribute("data",jsonObject.toJSONString());
	
		return "/board/check.jsp";
	}

}
