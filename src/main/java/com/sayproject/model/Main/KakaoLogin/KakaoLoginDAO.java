package com.sayproject.model.Main.KakaoLogin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class KakaoLoginDAO {
	
	 SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	  public int kakaoLoginInfo(KakaoInfo info) {
	    int cnt = 0;
	    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
	      cnt = sqlSession.selectOne("kakaoLoginInfo", info);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return cnt;
	  }

}
