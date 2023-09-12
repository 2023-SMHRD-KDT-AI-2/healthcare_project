package com.sayproject.model.Main.KakaoLogin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;
import com.sayproject.model.Members.Member;

public class KakaoIdDuplicationCheckDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int kakaoIdDuplicationCheck(String memberObjectId) {
			int cnt =0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.selectOne("kakaoIdDuplicate", memberObjectId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
}