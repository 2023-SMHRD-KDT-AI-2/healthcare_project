package com.sayproject.model.Main.KakaoLogin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;
import com.sayproject.model.Members.Member;

public class KakaoIdDuplicationCheckDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	
	//카카오 아이디 중복체크
	public int kakaoIdDuplicationCheck(long objecId) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.selectOne("kakaoIdDuplicate", objecId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}