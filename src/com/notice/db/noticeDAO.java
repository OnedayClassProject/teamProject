package com.notice.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class noticeDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	private Connection getConnection() throws Exception{;
		Connection conn=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/teamProject");
		conn=ds.getConnection();
		return conn;
	}
	private void resourceClose(){
		try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		} catch (SQLException e) {
			System.out.println("resourceClose()에서 예외발생 : " + e);
		}
	}
	public int insertNotice(noticeBean bean){
		int result = 0;
		int num = 0;
		int header = 0;
		System.out.println("insert " + bean.getHeader());
		try {
			con = getConnection();
			String sql = "select max(num) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}
			if(bean.getHeader() == 1){
				sql = "select max(header) from notice";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					header = rs.getInt(1) + 1;
				}
			}
			sql = "insert into notice(num,title,content,date,header) values(?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, header);
			result = pstmt.executeUpdate();
			if(result !=0)
				return 1;
		} catch (Exception e) {
			System.out.println("insertNotice()에서 예외 발생 : "+ e);
			return 0;
		} finally{
			resourceClose();
		}
		return result;
	}
	public List<noticeBean> getNoticeList(int startRow, int pageSize){
		List<noticeBean> list = new ArrayList<noticeBean>();
		try {
			con = getConnection();
			String sql ="select * from notice order by header desc, num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				noticeBean bean = new noticeBean();
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getTimestamp("date"));
				bean.setHeader(rs.getInt("header"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getNoticeList()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		
		return list;
	}
	public noticeBean getNoticeConent(int num) {
		noticeBean bean = null;
		try {
			con = getConnection();
			String sql = "select * from notice where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean = new noticeBean();
				bean.setNum(num);
				bean.setTitle(rs.getString("title"));
				bean.setHeader(rs.getInt("header"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			System.out.println("getNoticeConent()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		
		return bean;
	}
	public int deleteNotice(int num) {
		int result = 0;
		try {
			con = getConnection();
			String sql = "delete from notice where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result !=0)
				return 1;
		} catch (Exception e) {
			System.out.println("deleteNotice()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return 0;
	}
	public int updateNotice(noticeBean bean) {
		int result = 0;
		try {
			con = getConnection();
			String sql = "update notice set title = ?, content = ?, date = now() header =? where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getHeader());
			pstmt.setInt(4, bean.getNum());
			result = pstmt.executeUpdate();
			if(result != 0)
				return 1;
		} catch (Exception e) {
			System.out.println("updateNotice()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return result;
	}
	public int getNoticeCount() {
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getNoticeCount()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return count;
	}
}
