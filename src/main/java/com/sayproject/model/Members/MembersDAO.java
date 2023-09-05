package com.sayproject.model.Members;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sayproject.database.mariadb.SqlSessionManager;

public class MembersDAO {

  // 0. SqlSessionManager(Class) 기능 불러오기
  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

  // 회원 가입을 진행할 수 있는 메소드.
  public int join(Member member) {
    int cnt = 0;
    try {
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit
      SqlSession sqlSession = sqlSessionFactory.openSession(true);

      // 2. sql 문장 선택
      cnt = sqlSession.insert("memberJoin", member);

      // 4. DB 종료
      sqlSession.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cnt;
  }

  public int existId(String memberId) {
    int cnt = 0;
    try {
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit
      SqlSession sqlSession = sqlSessionFactory.openSession(true);

      // 2. sql 문장 선택
      cnt = sqlSession.selectOne("memberJoinExist", memberId);

      // 4. DB 종료
      sqlSession.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cnt;
  }

  public Member login(Member member) {
    Member loginMember = null;
    try {
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit
      SqlSession sqlSession = sqlSessionFactory.openSession(true);

      // 2. sql 문장 선택
      loginMember = sqlSession.selectOne("memberLogin", member);

      // 4. DB 종료
      sqlSession.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return loginMember;
  }
  
  public List<Member> memberList() {
    List<Member> memberList = null;
    try {
      memberList = new ArrayList<Member>();
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit
      SqlSession sqlSession = sqlSessionFactory.openSession(true);

      // 2. sql 문장 선택
      memberList = sqlSession.selectList("memberList");

      // 4. DB 종료
      sqlSession.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return memberList;
  }
}
