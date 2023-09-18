package com.sayproject.model.Members;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sayproject.database.mariadb.SqlSessionManager;

public class MembersDAO {

  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

  public int join(Member member) {
    int cnt = 0;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      cnt = sqlSession.insert("memberJoin", member);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cnt;
  }

  public int existId(String memberId) {
    int cnt = 0;
    try(SqlSession sqlSession = sqlSessionFactory.openSession(true)){
      cnt = sqlSession.selectOne("memberJoinExist", memberId);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cnt;
  }

  public Member login(Member member) {
    Member loginMember = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
      loginMember = sqlSession.selectOne("memberLogin", member);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return loginMember;
  }
  
  public List<Member> memberList() {
    List<Member> memberList = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
      memberList = new ArrayList<Member>();
      memberList = sqlSession.selectList("memberList");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return memberList;
  }
  // 출석 중복체크
  public int duplicateAttendence(Member member) {
	  int cnt =0;
	  try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
	      cnt = sqlSession.selectOne("duplicateAttendence", member);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return cnt;
  }
  
  
  //출석 입력하기
  public int RegistAttendenceAction(Member member) {
	  int cnt =0;
	  try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
	      cnt = sqlSession.insert("RegistAttendenceAction", member);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return cnt;
}
}