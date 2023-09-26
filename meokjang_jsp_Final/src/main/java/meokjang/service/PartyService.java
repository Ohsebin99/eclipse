package meokjang.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import meokjang.dao.PartyDAO;
import meokjang.dao.RepleDAO;
import meokjang.mybatis.MySession;
import meokjang.vo.Param;
import meokjang.vo.PartyList;
import meokjang.vo.PartyVO;
import meokjang.vo.RepleList;
import meokjang.vo.RepleVO;


public class PartyService {
	// singleton
	private static PartyService instance = new PartyService();
	private PartyService() {}
	public static PartyService getInstance() {
		return instance;
	}
	
	public void insert(PartyVO vo) {
		System.out.println("PartyService 클래스의 insert()메소드 실행");
		SqlSession mapper = MySession.getSession();
		PartyDAO.getInstance().insert(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
	public PartyList selectList(int currentPage, Param param) {
		System.out.println("PartyService 클래스의 selectList()메소드 실행");
		System.out.println(param);
		SqlSession mapper = MySession.getSession();
		
		PartyList partyList = null;
		PartyDAO dao = PartyDAO.getInstance();
		
		int pageSize = 8;
		int totalCount = dao.selectCount(mapper);
		partyList = new PartyList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", partyList.getStartNo());
		hmap.put("endNo", partyList.getEndNo());
		partyList.setList(dao.selectList(mapper, hmap));
		mapper.close();
		return partyList;
	}
	
	public PartyList selectListMulti(int currentPage, Param param) {
		System.out.println("PartyService 클래스의 selectListMulti() 메소드 실행");
		System.out.println(param);
		SqlSession mapper = MySession.getSession();
		PartyList partyList = null;
		PartyDAO dao = PartyDAO.getInstance();
		
		int pageSize = 5;
		int totalCount = dao.selectCountMulti(mapper, param);
		System.out.println(totalCount);
		
		partyList = new PartyList(pageSize, totalCount, currentPage);
		param.setStartNo(partyList.getStartNo());
		param.setEndNo(partyList.getEndNo());
		
		partyList.setList(dao.selectListMulti(mapper, param));
		System.out.println(partyList);
		mapper.close();
		return partyList;
	}
	public PartyList createMyList(String id) {
		System.out.println("PartyService 클래스의 createMyList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		PartyDAO dao = PartyDAO.getInstance();

		PartyList partyList = new PartyList();
		
		partyList.setList(dao.createMyList(mapper, id));
		System.out.println(partyList);
		
		mapper.commit();
		mapper.close();
		return partyList;
	}
	public ArrayList<PartyVO> joinMyList(String id) {
		System.out.println("PartyService 클래스의 joinMyList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		PartyDAO partydao = PartyDAO.getInstance();
		RepleDAO repledao = RepleDAO.getInstance();
		RepleList repleList = new RepleList();
		ArrayList<PartyVO> partyList  = new ArrayList<PartyVO>();
		
//		내가 댓글을 쓴 방 목록을 가져온다.(중복값 존재)
		repleList.setList(repledao.selectByRepleID(mapper, id));		
//		System.out.println(repleList);
		
//	ChatGPT를 활용한 리스트 내 중복된 값 제거 코드
		ArrayList<RepleVO> ro = repleList.getList();
		Set<Integer> originIdxSet = new HashSet<>();
		for (RepleVO repleVO : ro) {
		    originIdxSet.add(repleVO.getOriginIdx());
		}
		List<Integer> originIdxList = new ArrayList<>(originIdxSet);
//	ChatGPT를 활용한 리스트 내 중복된 값 제거 코드
//		System.out.println(originIdxList);
//		System.out.println(originIdxList.size());
//		System.out.println(originIdxList.get(0));
		
		for(int originIdx : originIdxList) {
//			System.out.println(originIdx);
			
//			수정해야 할 코드 각각 partyVO를 가져와 list에 add 해야한다.
			partyList.add(partydao.joinMyList(mapper, originIdx));
			
		}
		System.out.println(partyList);
		
		mapper.commit();
		mapper.close();
		return partyList;
	}
	
	
	public PartyVO selectByIdx (int idx) {
		System.out.println("PartyService 클래스의 selectByIdx()메소드 실행");
		SqlSession mapper = MySession.getSession();
		PartyVO vo = PartyDAO.getInstance().selectByIdx(mapper, idx);
		System.out.println(vo);
		mapper.close();
		return vo;
	}
	
	public void partyDelete(int idx) {
		System.out.println("PartyService 클래스의 partyDelete()메소드 실행");
		SqlSession mapper = MySession.getSession();
		PartyDAO.getInstance().partyDelete(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	public void partyUpdate (PartyVO vo) {
		System.out.println("PartyService 클래스의 partyUpdate()메소드 실행");
		System.out.println(vo);
		SqlSession mapper = MySession.getSession();
		PartyDAO.getInstance().partyUpdate(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	public PartyList selectSlider() {
		System.out.println("PartyService 클래스의 selectSlider()메소드 실행");
		SqlSession mapper = MySession.getSession();

		PartyList partyListSlider = new PartyList();
		partyListSlider.setList(PartyDAO.getInstance().selectSlider(mapper));
		System.out.println(partyListSlider);
		mapper.close();
		return partyListSlider;
	}
	
	public void partyReport(int idx, int deleteReport) {
		System.out.println("PartyService 클래스의 partyReport()메소드 실행");
		SqlSession mapper = MySession.getSession();
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("idx", idx);
		hmap.put("deleteReport", deleteReport);
		PartyDAO.getInstance().partyReport(mapper, hmap);
		
		mapper.commit();
		mapper.close();
	}
}
