package com.sayproject.database.mariadb;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

    // SqlSession -> 작업을 의미하는 단어
    // 작업 : dB 연동 -> sql 문장 실행 -> 연결종료

    private static SqlSessionFactory sqlSessionFactory;

    // static 초기화 블럭 : 프로그램이 실행되면 자동적으로 실행되는 문법
    // 초기화 블럭 : 생성자가 실행이 될 때 자동적으로 실행되는 문법
    static {
        try {
            String resource = "com/smhrd/database/config.xml";
            // config.xml 파일을 수정하거나 작업을 할 수 있도록 읽어들이는 작업!
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSessionFactory getSqlSessionFactory(){
        return sqlSessionFactory;
    }
}