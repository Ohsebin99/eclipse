package com.tjoeun.fileupload;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FileDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public FileDAO() {
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
	public void upload(String filename, String fileRealname) {
		
		try {
			String sql = "insert into fileupload(idx, filename, filerealname) " +
						"values (fileupload_idx_seq.nextval, ?, ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, filename);
					pstmt.setString(2, fileRealname);
					pstmt.executeUpdate();
		} catch(SQLException e) {
			
		}
	}
	
	public ArrayList<FileVO> getUploadList() {
		
		ArrayList<FileVO> list = new ArrayList<>();
		try {
			String sql = "select * from fileupload order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileVO vo = new FileVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setFilename(rs.getString("filename"));
				vo.setFileRealname(rs.getString("FileRealname"));
				vo.setDownloadCount(rs.getInt("downloadCount"));
				list.add(vo);
			}
			System.out.println(list);
		} catch(SQLException e) {
			
		}
		return list;
	}
	
	public void hit(String fileRealname) {
		
		try {
			String sql = "update fileupload set downloadcount = downloadcount + 1 where fileRealname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileRealname);
			pstmt.executeUpdate();
		}catch (SQLException e) {
				e.printStackTrace();
		}
		
	}
	
}

















