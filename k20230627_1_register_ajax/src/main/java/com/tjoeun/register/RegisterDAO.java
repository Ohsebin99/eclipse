package com.tjoeun.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public RegisterDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "tjoeunit", "0000");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 정보가 올바르지 않습니다.");
		}
	}
	
	

	public int register(RegisterVO vo) {
		
		try {
			String sql = "insert into register (userID, userPassword, userName, userAge, userGender, userEmail) values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserID());
			pstmt.setString(2, vo.getUserPassword());
			pstmt.setString(3, vo.getUserName());
			pstmt.setInt(4, vo.getUserAge());
			pstmt.setString(5, vo.getUserGender());
			pstmt.setString(6, vo.getUserEmail());
			return pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		//	System.out.println("중복된 아이디");
		}
		return 0;
	}


//	회원 가입하려는 아이디가 테이블에 존재하는가 판단하는
	public int registerCheck(String userID) {
		
		try{
			String sql = "select * from register where trim(userID) = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (userID.trim().equals("")) {
				// 중복 검사할 아이디를 입력하지 않고 중복 체크 버튼을 클릭한 경우
				return 1;
			} else if(rs.next()){
				// 사용중인 아이디일 경우
				return 2;
			}else {
				// 사용가능한 아이디일 경우
				return 3;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}





























