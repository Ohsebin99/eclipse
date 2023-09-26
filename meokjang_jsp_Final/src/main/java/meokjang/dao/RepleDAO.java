package meokjang.dao;

import java.util.ArrayList;	

import org.apache.ibatis.session.SqlSession;

import meokjang.mybatis.MySession;
import meokjang.vo.RepleList;
import meokjang.vo.RepleVO;


public class RepleDAO {

	private static RepleDAO instance = new RepleDAO();

	private RepleDAO() {
	}

	public static RepleDAO getInstance() {
		return instance;
	}

   public ArrayList<RepleVO> selectRepleList(SqlSession mapper, int idx){
      System.out.println("RepleDAO 클래스의 selectRepleList()메소드 실행");
      return (ArrayList<RepleVO>) mapper.selectList("selectRepleList", idx);
   }
   
	public void repleInsert(SqlSession mapper, RepleVO ro) {
		System.out.println("RepleDAO 클래스의 repleInsert()메소드 실행");
		mapper.insert("repleInsert", ro);
	}
   
	public ArrayList<RepleVO> selectByRepleID(SqlSession mapper, String id) {
		System.out.println("RepleDAO 클래스의 selectByRepleID()메소드 실행");
		return (ArrayList<RepleVO>) mapper.selectList("selectByRepleID", id);
	}
	
	public void updateJoin(SqlSession mapper, int repleIdx) {
		System.out.println("RepleDAO 클래스의 updateJoin()메소드 실행");
		mapper.update("updateJoin", repleIdx);
	}
	
	public void deleteJoin(SqlSession mapper, int repleIdx) {
		System.out.println("RepleDAO 클래스의 deleteJoin()메소드 실행");
		mapper.delete("deleteJoin", repleIdx);
	}

	public ArrayList<RepleVO> getFixList(SqlSession mapper, String repleIdx) {
		System.out.println("RepleDAO 클래스의 deleteJoin()메소드 실행");
		return (ArrayList<RepleVO>) mapper.selectList("getFixList", repleIdx);
	}


}