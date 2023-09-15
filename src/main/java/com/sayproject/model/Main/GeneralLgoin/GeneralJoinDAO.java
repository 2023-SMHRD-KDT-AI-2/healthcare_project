package com.sayproject.model.Main.GeneralLgoin;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;
import com.sayproject.model.Main.KakaoLogin.KakaoJoin;

public class GeneralJoinDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// members 회원가입 data insert
	public int generalJoin(GeneralJoin generalJoin) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.insert("generalJoin", generalJoin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// members 테이블에 있는 아이디 중복체크
	public int generalIDCheck(String idOrEmail) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.selectOne("generalIDCheck", idOrEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
}
