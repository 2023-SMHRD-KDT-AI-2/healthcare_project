package com.sayproject.model.Main.GeneralLgoin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class GeneralLoginDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	
	// 일반로그인 성공시 members테이블 데이터 호출!(세션화하기)
	public GeneralJoin generalSession(String idOrEmail) {
		GeneralJoin session = null;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			session = (GeneralJoin)sqlSession.selectOne("generalSession", idOrEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return session;
	}

}
