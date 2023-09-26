package meokjang.dao;


import org.apache.ibatis.session.SqlSession;

import meokjang.vo.MemberVO;


public class MemberDAO {

	   private static MemberDAO instance = new MemberDAO();
	   private MemberDAO() { }
	   public static MemberDAO getInstance() {
	      return instance;
	   }
	   
	//   회원정보 DB에 저장하기
	   public void insert(SqlSession mapper, MemberVO mo) {
	      System.out.println("MemberDAO의 insert()");
	      
	      mapper.insert("memberInsert", mo);
	   }
	   
	//   중복된 아이디가 있는지 DB 조회하기 ( ID중복검사 )   
	   public int IDCheck(SqlSession mapper, String ID) {
	      System.out.println("MemberDAO의 IDCheck()");
	      return (int) mapper.selectOne("IDCheck", ID);
	   }
	   
	//   같은 아이디의 DB의 정보 가져오기
	   public MemberVO selectByID(SqlSession mapper, String ID) {
	      System.out.println("MemberDAO의 selectByID()");
	      return  (MemberVO) mapper.selectOne("selectByID", ID);
	   }
	   
	   // 아이디 찾기
	   public MemberVO selectByName(SqlSession mapper, MemberVO mo) {
			 System.out.println("MemberDAO의 selectByName()");
			return (MemberVO) mapper.selectOne("selectByName", mo);
		}
		// 비밀번호 변경
		public MemberVO passwordSerch(SqlSession mapper, MemberVO mo) {
			System.out.println("MemberDAO의 passwordSerch()");
			return (MemberVO) mapper.selectOne("passwordSerch", mo);
		}
		public void passwordChange(SqlSession mapper, MemberVO mo) {
			System.out.println("MemberDAO의 passwordChange()");
			mapper.update("passwordChange", mo);
		}
	   
		// 회원탈퇴
		public void memberDrop(SqlSession mapper, String ID) {
			System.out.println("MemberDAO의 memberDrop()");
			mapper.delete("memberDrop", ID);
		}
		public void myProfileUpdate(SqlSession mapper, MemberVO mo) {
			System.out.println("MemberDAO의 myProfileUpdate()");
			mapper.update("myProfileUpdate", mo);
		}
	   
	}