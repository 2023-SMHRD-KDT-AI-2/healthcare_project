package com.sayproject.model.Main.KakaoLogin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class KakaoJoinDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int kakaoJoin(KakaoJoin kakaoJoin) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.insert("kakaoJoin", kakaoJoin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}