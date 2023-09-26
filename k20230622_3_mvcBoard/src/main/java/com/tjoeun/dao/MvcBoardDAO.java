package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.MvcBoardVO;

public class MvcBoardDAO {
	
	private static MvcBoardDAO instance = new MvcBoardDAO();
	private MvcBoardDAO() {}
	 public static MvcBoardDAO getInstance() {
	      return instance;
	   }
	 
	public void insert(SqlSession mapper, MvcBoardVO vo) {
		mapper.insert("insert", vo);
	}
	
	public int selectCount(SqlSession mapper) {
		
		return (int) mapper.selectOne("selectCount");
	}
	
	public ArrayList<MvcBoardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		
		return (ArrayList<MvcBoardVO>) mapper.selectList("selectList", hmap);
	}
	
	public void increment(SqlSession mapper, int idx) {
		mapper.update("increment", idx);
		
	}
	
	public MvcBoardVO selectByIdx(SqlSession mapper, int idx) {
		
		return (MvcBoardVO) mapper.selectOne("selectByIdx", idx);
	}
	
	public void update(SqlSession mapper, MvcBoardVO vo) {
		mapper.update("update", vo);
		
	}
	
	public void delete(SqlSession mapper, MvcBoardVO vo) {
		mapper.delete("delete", vo);
		
	}
	public void incrementSeq(SqlSession mapper, HashMap<String, Integer> hmap) {
		mapper.update("incrementSeq", hmap);
	}
	
	public void replyInsert(SqlSession mapper, MvcBoardVO vo) {
		mapper.insert("replyInsert", vo);
		
	}
	
}
