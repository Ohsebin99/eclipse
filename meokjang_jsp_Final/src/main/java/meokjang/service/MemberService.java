package meokjang.service;

import org.apache.ibatis.session.SqlSession;

import meokjang.dao.MemberDAO;
import meokjang.mybatis.MySession;
import meokjang.vo.MemberVO;



public class MemberService {

   private static MemberService instance = new MemberService();
   private MemberService() { }
   public static MemberService getInstance() {
      return instance;
   }
   
////   회원 가입 관련 함수

//   회원정보 DB에 저장하기
   public void insert(MemberVO mo) {
      System.out.println("MemberService의 insert()");
      SqlSession mapper = MySession.getSession();
      MemberDAO dao = MemberDAO.getInstance();
      
      dao.getInstance().insert(mapper, mo);
      
      mapper.commit();
      mapper.close();
      
   }
   
//   중복된 아이디가 있는지 DB 조회하기 ( ID중복검사 )
   public int IDCheck(String ID) {
      System.out.println("MemberService의 IDCheck()");
      SqlSession mapper = MySession.getSession();
      MemberDAO dao = MemberDAO.getInstance();

      int result = dao.getInstance().IDCheck(mapper, ID);
      
      mapper.commit();
      mapper.close();
      
      return result;
   }
   
////   로그인 관련 함수
   
//   같은 아이디의 DB의 정보 가져오기
   public MemberVO selectByID(String ID) {
      System.out.println("MemberService의 selectByID()");
      SqlSession mapper = MySession.getSession();
      MemberDAO dao = MemberDAO.getInstance();
      
      MemberVO result = dao.selectByID(mapper, ID);
      
      mapper.commit();
      mapper.close();
      
      return result;
      
   }
   // 아이디 찾기
   public MemberVO selectByName(MemberVO mo) {
		System.out.println("MemberService의 selectByName()");
		SqlSession mapper = MySession.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		
		
		MemberVO result = dao.selectByName(mapper, mo);
		
		mapper.commit();
		mapper.close();

		return result;
   }
   
   // 비밀번호 변경
   public MemberVO passwordSerch(MemberVO mo) {
		System.out.println("MemberService의 passwordSerch()");
		SqlSession mapper = MySession.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		
		
		MemberVO result = dao.passwordSerch(mapper, mo);
		
		mapper.commit();
		mapper.close();

		return result;
   }
   public void passwordChange(MemberVO mo) {
		System.out.println("MemberService의 passwordSerch()");
		SqlSession mapper = MySession.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.passwordChange(mapper, mo);
		
		mapper.commit();
		mapper.close();
   }
   
   public void memberDrop(String ID) {
	   System.out.println("MemberService의 memberDrop()");
	   SqlSession mapper = MySession.getSession();
	   MemberDAO.getInstance().memberDrop(mapper, ID);
	   mapper.commit();
	   mapper.close();
   }
   
   public void myProfileUpdate(MemberVO mo) {
	   System.out.println("MemberService의 myProfileUpdate()");
	   System.out.println(mo);
	   SqlSession mapper = MySession.getSession();
	   MemberDAO.getInstance().myProfileUpdate(mapper, mo);
	   mapper.commit();
	   mapper.close();
   }
}





