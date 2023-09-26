package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.FreeboardVO;

public class FreeboardDAO {
	
	private static FreeboardDAO instance = new FreeboardDAO();
	private FreeboardDAO() {}
	 public static FreeboardDAO getInstance() {
	      return instance;
	   }
	 
	public void insert(SqlSession mapper, FreeboardVO vo) {
		mapper.insert("insert", vo);
	}
	
	public int selectCount(SqlSession mapper) {
		
		return (int) mapper.selectOne("selectCount");
	}
	
	public ArrayList<FreeboardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		
		return (ArrayList<FreeboardVO>) mapper.selectList("selectList", hmap);
	}
	
	public FreeboardVO selectByIdx(SqlSession mapper, int idx) {
		
		return (FreeboardVO) mapper.selectOne("selectByIdx", idx);
	}
	
	
	public void hit(SqlSession mapper, int idx) {
		
		mapper.update("hit", idx);
	}
	
	public void delete(SqlSession mapper, int idx) {
		mapper.delete("delete", idx);
		
	}
	
	public void update(SqlSession mapper, FreeboardVO vo) {
		mapper.update("update", vo);
		
	}
	public ArrayList<FreeboardVO> selectNotice(SqlSession mapper) {
		
		return (ArrayList<FreeboardVO>) mapper.selectList("selectNotice");
	}
	
	
	
	
}
