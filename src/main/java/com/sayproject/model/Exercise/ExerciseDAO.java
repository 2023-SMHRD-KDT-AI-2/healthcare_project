package com.sayproject.model.Exercise;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class ExerciseDAO {

	// 0. SqlSessionManager(클래스이름) 기능 불러오기
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	
	//met 가져오기
	public ArrayList<Exercise> met(Exercise exercise) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		list = (ArrayList)sqlSession.selectList("met");
		sqlSession.close();
		return list;
		
	}
	
	ArrayList<MemberInfo> list = new ArrayList<>();
	// 회원정보
	public ArrayList info(MemberInfo memberinfo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true); //데이터베이스 연결	
		list = (ArrayList)sqlSession.selectList("info", memberinfo);
		sqlSession.close();
		return list;
		
		
	}
}
