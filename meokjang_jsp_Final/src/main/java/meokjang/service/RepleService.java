package meokjang.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import meokjang.dao.PartyDAO;
import meokjang.dao.RepleDAO;
import meokjang.mybatis.MySession;
import meokjang.vo.PartyVO;
import meokjang.vo.RepleList;
import meokjang.vo.RepleVO;


public class RepleService {

	private static RepleService instance = new RepleService();

	private RepleService() {
	}

	public static RepleService getInstance() {
		return instance;
	}

   public RepleList selectRepleList(int idx) {
      System.out.println("RepleService 클래스의 selectRepleList()메소드 실행");
      SqlSession mapper = MySession.getSession();
      RepleList repleList = new RepleList();
      repleList.setList(RepleDAO.getInstance().selectRepleList(mapper, idx));
      mapper.close();
      return repleList;
   }
   
   public void repleInsert(RepleVO ro) {
	   System.out.println("RepleService 클래스의 repleInsert()메소드 실행");
	   SqlSession mapper = MySession.getSession();
	   RepleDAO dao = RepleDAO.getInstance();
	   
	   dao.repleInsert(mapper, ro);
		
	   mapper.commit();
	   mapper.close();
   }
   
   public void updateJoin(int repleIdx){
	   System.out.println("RepleService 클래스의 updateJoin()메소드 실행");
	   SqlSession mapper = MySession.getSession();
	   RepleDAO.getInstance().updateJoin(mapper, repleIdx);
	   mapper.commit();
	   mapper.close();
   }
   
   public void deleteJoin(int repleIdx){
	   System.out.println("RepleService 클래스의 deleteJoin()메소드 실행");
	   SqlSession mapper = MySession.getSession();
	   RepleDAO.getInstance().deleteJoin(mapper, repleIdx);
	   mapper.commit();
	   mapper.close();
   }
   
   public ArrayList<RepleVO> getFixList(String repleIdx){
	   System.out.println("RepleService 클래스의 getFixList()메소드 실행");
	   SqlSession mapper = MySession.getSession();
	   ArrayList<RepleVO> repleList = new ArrayList<>();
	   repleList.addAll(RepleDAO.getInstance().getFixList(mapper, repleIdx));
	   mapper.commit();
	   mapper.close();
	   return repleList;
   }
}
