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
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.selectOne("memberJoinExist", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public Member login(Member member) {
		Member loginMember = null;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			loginMember = sqlSession.selectOne("memberLogin", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginMember;
	}

	public List<Member> memberList() {
		List<Member> memberList = null;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			memberList = new ArrayList<Member>();
			memberList = sqlSession.selectList("memberList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}

	// 출석 중복체크
	public int duplicateAttendence(Member member) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.selectOne("duplicateAttendence", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 출석 입력하기
	public int RegistAttendenceAction(Member member) {
		int cnt = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			cnt = sqlSession.insert("RegistAttendenceAction", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 남자비율
	public int male(String male) {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("male", male);// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 여자비율
	public int female(String female) {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("female", female);// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 10대
	public int teenage() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("teenage");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 20대
	public int twenty() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("twenty");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 30대
	public int thirty() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("thirty");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 40대
	public int forty() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("forty");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 50대
	public int fifty() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("fifty");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 60대
	public int sixty() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("sixty");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}

	// 70대
	public int seventy() {
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		int cnt = sqlsession.selectOne("seventy");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return cnt;
	}
	
	// 나이별 비율
	public  ArrayList<Integer> age() {
		ArrayList<Integer> age = new ArrayList<>();
		// DB연결
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		// sql문장
		age = (ArrayList) sqlsession.selectList("age");// ("id",데이터값)
		// 데이터베이스 종료
		sqlsession.close();
		return age;
	}

	
	// 베스트 트레이너
		public String bestTrainer() {
			// DB연결
			SqlSession sqlsession = sqlSessionFactory.openSession(true);
			// sql문장
			String TrainerName = sqlsession.selectOne("bestTrainer");// ("id",데이터값)
			// 데이터베이스 종료
			sqlsession.close();
			return TrainerName;
		}
	
}