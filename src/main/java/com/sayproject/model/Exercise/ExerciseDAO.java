package com.sayproject.model.Exercise;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class ExerciseDAO {

	// SqlSessionManager(클래스이름임) 기능 불러오기
	// 실제 DB에 접근할 수 있는 클래스
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

	// 회원정보
	public MemberInfo info(MemberInfo memberinfo) { // (MemberInfo라는 클래스로부터 재료값을 memvberinfo 가져옴)
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);

		// sql문장
		MemberInfo info = sqlsession.selectOne("info", memberinfo);// ("id",데이터값)

		// 연결종료
		sqlsession.close();

		return info;
	}

	// 만기일
	public MemberInfo day(String expiration_day) {// (MemberInfo라는 클래스로부터 재료값을 memvberinfo 가져옴)
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);

		// sql문장
		MemberInfo day = sqlsession.selectOne("expiration", expiration_day);// ("id",데이터값)

		// 데이터베이스 종료
		sqlsession.close();

		return day;

	}

	public String met(int id) {
		SqlSession sqlsession = sqlSessionFactory.openSession(true); 
		
		String met = sqlsession.selectOne("met",id);
		sqlsession.close();
		
		return met;
		
	}
}
