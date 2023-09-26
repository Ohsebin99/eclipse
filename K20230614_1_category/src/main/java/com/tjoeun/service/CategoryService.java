package com.tjoeun.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.CategoryDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.CategoryList;
import com.tjoeun.vo.CategoryVO;

public class CategoryService {
	
	private static CategoryService instance = new CategoryService();
	private CategoryService() {}
	public static CategoryService getInstance() {
		return instance;
	}
	
//	insert.jsp에서 호출되는 테이블에 저장할 메인 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후
//	CategoryDAO 클래스의 메인 카테고리를 테이블에 저장하는 insert sql 명령을 실행하는 메소드를 호출 하는 메소드
	public void insert(CategoryVO vo) {
		//	mapper를 얻어온다.
		SqlSession mapper = MySession.getSession();
		
	//	System.out.println("연결성공: " + mapper);
		
		// 전처리
		
		//	CategoryDAO 클래스의 insert sql 명령을 실행하는 메소드를 호출한다.
		CategoryDAO.getInstance().insert(mapper, vo);
		
		// 실행한 sql 명령이 테이블을 변경하는 insert, delete, update sql 명령일 경우 작업 결과를 테이블에
		// 반영시키기 위해서 작업이 완료되면 반드시 commit() 메소드를 실행해야 한다.
		// 테이블이 변경되지 않는 select sql 명령은 commit() 메소드를 실행하지 않아도 상관없다.
		mapper.commit();
		
		// mapper를 사용한 데이터베이스 작업이 완료되면 반드시 mapper를 닫아야 한다.
		mapper.close();
	}
	
//	list.jsp에서 호출되는 mapper를 얻어온 후 CategoryDAO 클래스의 테이블에 저장된 전체 카테고리 목록을
//	얻어오는 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public CategoryList selectList() {
		SqlSession mapper = MySession.getSession();
		
		// 전체 카테고리 목록을 저장해서 리턴시킬 객체를 선언한다.
		CategoryList categoryList = new CategoryList();
		// 테이블에서 얻어온 전체 카테고리 목록을 CategoryList 클래스의 ArrayList에 저장한다.
		categoryList.setList(CategoryDAO.getInstance().selectList(mapper));
		System.out.println(categoryList);
		mapper.close();
		return categoryList;
	}
	
//	reply.jsp에서 호출되는 테이블에 저장할 서브 카테고리 저장된 객체를 넘겨받고 mapper를 얻어온 후
//	CategoryDAO 클래스의 서브 카테고리를 테이블에 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void reply(CategoryVO vo) {
		SqlSession mapper = MySession.getSession();
		CategoryDAO dao = CategoryDAO.getInstance();
		
		// 서브 카테고리가 삽입될 위치를 결정하기 위해서 lev와 sql를 각각 1씩 증가시킨다.
		// 서브 카테고리의 레벨은 부모 카테고리의 레벨보다 1크다.
		vo.setLev(vo.getLev() + 1);
		// 서브 카테고리가 부모 카테고리 바로 아래 나와야 하므로 출력 순서가 부모 카테고리 보다 1크다.
		vo.setSeq(vo.getSeq() + 1);
		
		// 서브 카테고리를 위치에 맞게 삽입하기 위해서 같은 카테고리 그룹(gup)의 카테고리 출력 순서(seq)를
		// 조정(수정)하는 메소드를 실행한다.
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("gup", vo.getGup());
		hmap.put("seq", vo.getSeq());
		dao.increment(mapper, hmap); // update
		
		// 서브 카테고리가 저장될 위치가 확보되면 서브 카테고리를 테이블에 저장하는 메소드를 호출한다.
		dao.reply(mapper, vo);
		
		
		mapper.commit();
		mapper.close();
	}

//	delete.jsp에서 호출되는 삭제할 카테고리 번호를 넘겨받고 mapper를 얻어온 수 CategoryDAO 클래스의 카테고리
//	1건을 삭제하는 delete sql 명령을 실행하는 메소드를 호출하는 메소드
	public void delete(int idx) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().delete(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public CategoryVO selectByIdx(int idx) {
		
		SqlSession mapper = MySession.getSession();
		
		CategoryVO vo = CategoryDAO.getInstance().selectByIdx(mapper, idx);
		System.out.println(vo);
		mapper.close();
		
		return vo;
	}
	
	public void deleteCategory(int idx) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().deleteCategory(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public void deleteCheck(int idx) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().deleteCheck(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public void restore(int idx) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().restore(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public void update(CategoryVO vo) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().update(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
	public void deleteReport(int idx) {
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().deleteReport(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public ArrayList<CategoryVO> deleteList(CategoryVO vo) {
		SqlSession mapper = MySession.getSession();
		
		ArrayList<CategoryVO> deleteList = CategoryDAO.getInstance().deleteList(mapper, vo);
		
		mapper.close();
		
		return deleteList;
	}
	
	public void reSeq(int gup) {
		SqlSession mapper = MySession.getSession();
		CategoryDAO dao = CategoryDAO.getInstance();
		
		// seq를 다시 부여할 카테고리 그룹만 얻어와서 ArrayList에 저장한다.
		ArrayList<CategoryVO> gupList = CategoryDAO.getInstance().seleteGup(mapper, gup);
		// ArrayList로 얻어온 카테고리 그룹의 카테고리 개수만큼 반복하며 seq를 0부터 다시 부여한다.
		for(int i=0; i<gupList.size(); i++) {
			// seq를 수정할 카테고리 일련번호(idx)와 seq를 수정할 데이터(i)를 HashMap 객체에 저장한다.
			HashMap<String, Integer> hmap = new HashMap<>();
			hmap.put("idx", gupList.get(i).getIdx());
			hmap.put("i", i);
			dao.reSeq(mapper, hmap);
		}
		
//		for(CategoryVO vo : gupList) {
//			System.out.println(vo);
//		}
		
		// ArrayList로 얻어온 카테고리 그룹의 카테고리 개수만큼 반복하며 seq를 0부터 다시 부여한다.
		
		mapper.commit();
		mapper.close();
	}
	
}


























