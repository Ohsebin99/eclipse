package com.tjoeun.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tjoeun.dao.GuestbookDAO;
import com.tjoeun.ibatis.MyAppSqlConfig;
import com.tjoeun.vo.GuestbookVO;

public class UpdateService {

	private static UpdateService instance = new UpdateService();
	
	private UpdateService() {}
	public static UpdateService getInstance() {
		return instance;
	}
	
	public void update(GuestbookVO vo) {
	System.out.println("UpdateService 클래스의 update() 메소드 실행");
	SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
	
	try {
		GuestbookDAO.getInstance().update(mapper, vo);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
}



















