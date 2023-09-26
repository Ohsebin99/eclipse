package com.tjoeun.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.FreeboardCommentDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.FreeboardCommentList;
import com.tjoeun.vo.FreeboardCommentVO;

public class FreeboardCommentService {
	
	 private static FreeboardCommentService instance = new FreeboardCommentService();
	   private FreeboardCommentService() {}
	   public static FreeboardCommentService getInstance() {
	      return instance;
	   }
	   
	public boolean insertComment(FreeboardCommentVO co) {
		SqlSession mapper = MySession.getSession();
		int result =  FreeboardCommentDAO.getInstance().insertComment(mapper, co);
	//	System.out.println(result);
		if (result == 1) {
			mapper.commit();
			mapper.close();
			return true;
		}else {
			mapper.close();
			return false;
		}
	}
	
	public int commentCount(int idx) {
		SqlSession mapper = MySession.getSession();
		int commentCount = FreeboardCommentDAO.getInstance().commentCount(mapper, idx);
		mapper.close();
		return commentCount;
	}
	
	public FreeboardCommentList selectCommentList(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentList freeboardCommentList = new FreeboardCommentList();
		freeboardCommentList.setList(FreeboardCommentDAO.getInstance().selectCommentList(mapper, idx));
		mapper.close();
		return freeboardCommentList;
	}
	
	public boolean updateComment(FreeboardCommentVO co) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, co.getIdx());
		if (original.getPassword().trim().equals(co.getPassword().trim())) {
			dao.updateComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		}else {
			mapper.close();
			return false;
		}
	}
	public boolean deleteComment(FreeboardCommentVO co) {
		SqlSession mapper = MySession.getSession();
		FreeboardCommentDAO dao = FreeboardCommentDAO.getInstance();
		
		FreeboardCommentVO original = dao.selectCommentByIdx(mapper, co.getIdx());
		
		if (original.getPassword().trim().equals(co.getPassword().trim())) {
			dao.deleteComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		}else {
			mapper.close();
			return false;
		}
	}
	
}



























