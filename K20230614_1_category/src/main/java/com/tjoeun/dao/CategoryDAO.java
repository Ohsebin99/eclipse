package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.CategoryVO;

public class CategoryDAO {

	private static CategoryDAO instance = new CategoryDAO();
	private CategoryDAO() {}
	public static CategoryDAO getInstance() {
		return instance;
	}
	
//	CategoryService 클래스에서 호출되는 mapper와 테이블에 저장할 메인 카테고리 정보가 저장된 객체를
//	넘겨받고 테이블에 메인 카테고리를 저장하는 category.xml 파일의 insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, CategoryVO vo) {
		mapper.insert("insert", vo);
		
	}
//	CategoryService 클래스에서 호출되는 mapper를 넘겨받고 테이블에 저장된 전체 카테고리 목록을
//	얻어오는 category.xml 파일의 select sql 명령을 실행하는 메소드
	public ArrayList<CategoryVO> selectList(SqlSession mapper) {
		// selectOne(): ibatis의 queryForObject() 메소드와 같은 기능이 실행된다.
		// selectList(): ibatis의 queryForList() 메소드와 같은 기능이 실행된다.
		
		return (ArrayList<CategoryVO>) mapper.selectList("selectList");
	}
	
//	CategoryService 클래스에서 호출되는 mapper와 gup와 seq가 저장된 HashMap 객체를 넘겨받고 같은 카테고리
//	그룹(gup)에서 조건에 만족하는 카테고리 출력 순서를 조정하기 위해 seq를 1씩 증가시키는 category.xml 파일의
//	update sql 명령을 실행하는 메소드
	public void increment(SqlSession mapper, HashMap<String, Integer> hmap) {
		mapper.update("increment", hmap);
	}
	
//	CategoryService 클래스에서 호출되는 mapper와 테이블에 저장할 서브 카테고리 정보가 저장된 객체를 넘겨받고
//	테이블에 서브 카테고리를 저장하는 category.xml 파일의 insert sql 명령을 실행하는 메소드
	public void reply(SqlSession mapper, CategoryVO vo) {
		mapper.insert("reply", vo);
	}
	
//	CategoryService 클래스에서 호출되는 mapper와 삭제할 카테고리 번호를 넘겨받고 카테고리 1건을 삭제하는
//	category.xml 파일의 delete sql 명령을 실행하는 메소드
	public void delete(SqlSession mapper, int idx) {
		mapper.delete("delete", idx);
	}
	
	
	public CategoryVO selectByIdx(SqlSession mapper, int idx) {
		
		return (CategoryVO) mapper.selectOne("selectByIdx", idx);
	}
	
	
	public void deleteCategory(SqlSession mapper, int idx) {
		mapper.insert("deleteCategory", idx);
		
	}
	
	public void deleteCheck(SqlSession mapper, int idx) {
		mapper.update("deleteCheck", idx);
		
	}
	
	public void restore(SqlSession mapper, int idx) {
		mapper.update("restore", idx);
		
	}
	
	public void update(SqlSession mapper, CategoryVO vo) {
		mapper.update("update", vo);
		
	}
	
	
	public void deleteReport(SqlSession mapper, int idx) {
		mapper.update("deleteReport", idx);
		
	}
	public ArrayList<CategoryVO> deleteList(SqlSession mapper, CategoryVO vo) {
		
		
		return (ArrayList<CategoryVO>) mapper.selectList("deleteList", vo);
	}
	public ArrayList<CategoryVO> seleteGup(SqlSession mapper, int gup) {
		
		return (ArrayList<CategoryVO>) mapper.selectList("seleteGup", gup);
	}
	
	public void reSeq(SqlSession mapper, HashMap<String, Integer> hmap) {
		mapper.update("reSeq", hmap);
	}
	

	
	
	
	
	
	


	
	
}
