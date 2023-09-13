package com.sayproject.model.Diet;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class DietDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	Diet dietAll = new Diet();
	
	public Diet showAllNutrient(String code) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		dietAll = sqlSession.selectOne("showAllNutrient", code);
		
		sqlSession.close();

		return dietAll;
	}
	
}
