package com.sayproject.model.Diet;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class DietDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	ArrayList<Diet> list = new ArrayList<Diet>();
	
	public ArrayList showAllNutrient(String food_code) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		list = (ArrayList) sqlSession.selectList("showAllNutrient");
		
		sqlSession.close();
		
		return list;
	}
	
}
