package com.helpComment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class helpCommentDAO {
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql ="";
	
	public void resourceClose(){
		try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		} catch (SQLException e) {
			System.out.println("resourceClose()에서 예외발생 : " + e);
		}
	}
	
	private Connection getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/teamProject");
		con = ds.getConnection();
		return con;
	}
	public int insertComment(helpCommentBean bean){
		int num = 0;
		try {
			con = getConnection();
			sql = "select max(commentnum) from helpcomment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) +1;
			}else{
				num = 1;
			}
			sql = "insert into helpcomment(id, comment, date ,num , commentnum) values (?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getComment());
			pstmt.setInt(3, bean.getNum());
			pstmt.setInt(4, num);
			pstmt.executeUpdate();
			return 1;

		} catch (Exception e) {
			System.out.println("insertComment()에서 예외발생 : "+ e);
		}finally {
			resourceClose();
		}
		return 0;
	}
	public List<helpCommentBean> getComment(int num){
		List<helpCommentBean> list = new ArrayList<helpCommentBean>();
		try {
			con = getConnection();
			sql = "select * from helpcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				helpCommentBean bean = new helpCommentBean();
				bean.setId(rs.getString("id"));
				bean.setNum(rs.getInt("num"));
				bean.setCommentnum(rs.getInt("commentnum"));
				bean.setComment(rs.getString("comment"));
				bean.setDate(rs.getTimestamp("date"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("getComment()에서 예외발생 : "+ e);
		}finally {
			resourceClose();
		}
		return list;
	}
	public int commentCount(int num){
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from helpcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("commentCount()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return count;
	}

	public int deleteComment(int num) {
		try {
			con = getConnection();
			String sql = "delete from helpcomment where commentnum =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			System.out.println("deleteComment()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return 0;
	}

	public int updateComment(int num, String comment) {
		try {
			con = getConnection();
			String sql = "update helpcomment set comment = ? where commentnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, comment);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			System.out.println("updateComment()에서 예외발생 : "+e);
		} finally{
			resourceClose();
		}
		return 0;
	}
}
