package meokjang.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import meokjang.vo.Param;
import meokjang.vo.PartyVO;
import meokjang.vo.RepleVO;


public class PartyDAO {
	private static PartyDAO instance = new PartyDAO();
	private PartyDAO() {}
	public static PartyDAO getInstance() {
		return instance;
	}
	
	public void insert(SqlSession mapper, PartyVO vo) {
		System.out.println("PartyDAO 클래스의 insert()메소드 실행");
		System.out.println(vo);
		mapper.insert("insert", vo);
	}
	public int selectCount(SqlSession mapper) {
		System.out.println("PartyDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
	}
	
	public ArrayList<PartyVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("PartyDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<PartyVO>) mapper.selectList("selectList", hmap);
	}
	
	public int selectCountMulti(SqlSession mapper, Param param) {
		System.out.println("PartyDAO 클래스의 selectCountMulti() 메소드 실행");
		return (int) mapper.selectOne("selectCountMulti", param);
	}
	
	public ArrayList<PartyVO> selectListMulti(SqlSession mapper, Param param) {
		System.out.println("PartyDAO 클래스의 selectListMulti() 메소드 실행");
		return (ArrayList<PartyVO>) mapper.selectList("selectListMulti", param);
	}

	public ArrayList<PartyVO> createMyList(SqlSession mapper, String id) {
		System.out.println("PartyDAO 클래스의 createMyList()메소드 실행");
		return (ArrayList<PartyVO>)mapper.selectList("createMyList", id);
	}
	
	public PartyVO joinMyList(SqlSession mapper, int originIdx) {
		System.out.println("PartyDAO 클래스의 joinMyList()메소드 실행");
		return (PartyVO)mapper.selectOne("joinMyList", originIdx);
	}

	public PartyVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("PartyDAO 클래스의 selectByIdx()메소드 실행");
		return (PartyVO) mapper.selectOne("selectByIdx", idx);
	}
	public void partyDelete(SqlSession mapper, int idx) {
		System.out.println("PartyDAO 클래스의 partyDelete()메소드 실행");
		mapper.update("partyDelete", idx);
	}
	public void partyUpdate(SqlSession mapper, PartyVO vo) {
		System.out.println("PartyDAO 클래스의 partyUpdate()메소드 실행");
		mapper.update("partyUpdate", vo);
	}
	
	public ArrayList<PartyVO> selectSlider(SqlSession mapper) {
		System.out.println("PartyDAO 클래스의 selectSlider()메소드 실행");
		return (ArrayList<PartyVO>) mapper.selectList("selectSlider");
	}
	
	public void partyReport(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("PartyDAO 클래스의 partyReport()메소드 실행");
		mapper.update("partyReport", hmap);
	}
	
}
