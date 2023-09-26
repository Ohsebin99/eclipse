package com.tjoeun.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.FreeboardCommentVO;

public class FreeboardCommentDAO {
	
	private static FreeboardCommentDAO instance = new FreeboardCommentDAO();
	private FreeboardCommentDAO() {}
	 public static FreeboardCommentDAO getInstance() {
	      return instance;
	   }
	 
	public int insertComment(SqlSession mapper, FreeboardCommentVO co) {
		return mapper.insert("insertComment", co);
	}
	
	public int commentCount(SqlSession mapper, int idx) {
		
		return (int) mapper.selectOne("commentCount", idx);
		
	}
	
	public ArrayList<FreeboardCommentVO> selectCommentList(SqlSession mapper, int idx) {
		
		return (ArrayList<FreeboardCommentVO>) mapper.selectList("selectCommentList", idx);
	}
	
	public FreeboardCommentVO selectCommentByIdx(SqlSession mapper, int idx) {
		
		return (FreeboardCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
	public void updateComment(SqlSession mapper, FreeboardCommentVO co) {
		mapper.update("updateComment", co);
		
	}
	
	public void deleteComment(SqlSession mapper, FreeboardCommentVO co) {
		mapper.delete("deleteComment", co);
		
	}
	
}
















