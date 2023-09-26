package com.tjoeun.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.FreeboardDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.FreeboardList;
import com.tjoeun.vo.FreeboardVO;


public class FreeboardService {
	
	  private static FreeboardService instance = new FreeboardService();
	   private FreeboardService() {}
	   public static FreeboardService getInstance() {
	      return instance;
	   }
	//   vo(글이 저장된 객체)를 받고 mapper를 얻어와 글을 저장하는 insert sql 명령 실행 
	   public void insert(FreeboardVO vo) {
	      SqlSession mapper = MySession.getSession();
	      FreeboardDAO.getInstance().insert(mapper, vo);
	      
	      mapper.commit();
	      mapper.close();

	}
	   
//	list.jsp 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1페이지 분량의 메인글
//	목록을 얻어오는 FreeboardDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardList selectList(int currentPage) {
		  SqlSession mapper = MySession.getSession();
		  FreeboardDAO dao = FreeboardDAO.getInstance();
		  
		  int pageSize = 10;
		  int totalCount = FreeboardDAO.getInstance().selectCount(mapper);
		//  System.out.println(totalCount);
		  
		  FreeboardList freeboardList = new FreeboardList(pageSize, totalCount, currentPage);
		  HashMap<String, Integer> hmap = new HashMap<>();
		  hmap.put("startNo", freeboardList.getStartNo());
		  hmap.put("endNo", freeboardList.getEndNo());
		  freeboardList.setList(dao.selectList(mapper, hmap));
		  System.out.println(freeboardList);
		  
		  mapper.close();
		  return freeboardList;
	}
	
	public FreeboardVO selectByIdx(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardVO vo = FreeboardDAO.getInstance().selectByIdx(mapper, idx);
		System.out.println(vo);
		mapper.close();
		return vo;
	}
	
	
	public void hit(int idx) {
		SqlSession mapper = MySession.getSession();
		 FreeboardDAO.getInstance().hit(mapper, idx);
		 
		 mapper.commit();
	     mapper.close();
	}
	
	public void delete(int idx) {
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().delete(mapper, idx);
		 mapper.commit();
	     mapper.close();
	}
	
	public void update(FreeboardVO vo) {
		SqlSession mapper = MySession.getSession();
		FreeboardDAO.getInstance().update(mapper, vo);
		 mapper.commit();
	     mapper.close();
	}
	
	public ArrayList<FreeboardVO> selectNotice() {
		SqlSession mapper = MySession.getSession();
		
		ArrayList<FreeboardVO> notice = FreeboardDAO.getInstance().selectNotice(mapper);
		  mapper.close();
		  return notice;
	}
}











