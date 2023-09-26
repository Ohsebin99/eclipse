package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBUtil {
//   mysql에 연결하는 Connection을 리턴하는 메소드
   public static Connection getMysqlConn() {
      Connection conn = null;
      try {
         Class.forName("com.mysql.jdbc.Driver");
         String url = "jdbc:mysql://localhost:3306/javaam?useUnicode=true&characterEncoding=UTF-8"; 
         conn = DriverManager.getConnection(url, "root", "0000");
      } catch (Exception e) {
         System.out.println("드라이버 잘못된듯");
      } 
      return conn;
   }
//   Connection을 닫는 메소드
   public static void close (Connection conn) {
      if (conn != null) {
         try {
            conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }
   
//   oracle에 연결하는 Connection을 리턴하는 메소드
   public static Connection getOracleConnection() {
      Connection conn = null;
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
         conn = DriverManager.getConnection(url, "tjoeunit", "0000");
      } catch (Exception e) {
         System.out.println("드라이버클래스가 없거나 읽어올 수 없습니다.");
      } 
      return conn;
   }


   public static Connection getCommonsDBCPConnection() {
	   Connection conn = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Class.forName("org.apache.commons.dbcp.PoolingDriver");
		String url = "jdbc:apache:commons:dbcp:/pool"; 
		conn = DriverManager.getConnection(url);
	} catch (Exception e) {
		System.out.println("드라이버클래스가 없거나 읽어올 수 없습니다.");
	} 
	return conn;
	
}
//tomcat DBCP를 사용해서 mysql 이나 oracle에 연결하는 Connection을 리턴하는 메소드
public static Connection getTomcatDBCPConnection() {
 Connection conn = null;
 try {
    
    Context initContext = new InitialContext();
    DataSource dataSource = (DataSource) initContext.lookup("java:/comp/env/jdbc/TestDB");
    conn = dataSource.getConnection();
 } catch (Exception e) {
    e.printStackTrace();
 }
 return conn;
}
}

