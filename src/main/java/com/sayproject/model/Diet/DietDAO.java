package com.sayproject.model.Diet;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class DietDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	List<Diet> dietAllList = new ArrayList<Diet>();
	
	// food_code를 참조하여 음식데이터 조회 
	public List showAllNutrient(List code) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		dietAllList = sqlSession.selectList("showAllNutrient", code);
		
		System.out.println("dietAllList :" + dietAllList);
		System.out.println("dietAllList 크기 :" + dietAllList.size());

		sqlSession.close();

		return dietAllList;
	}
	
}
