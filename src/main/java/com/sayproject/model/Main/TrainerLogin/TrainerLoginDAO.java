package com.sayproject.model.Main.TrainerLogin;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sayproject.database.mariadb.SqlSessionManager;

public class TrainerLoginDAO {

  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

  // 카카오 아이디 중복체크
  public TrainerAccount trainerLoginCheck(TrainerAccount trainerAccount) {
    TrainerAccount returnTrainerAccount = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      returnTrainerAccount = sqlSession.selectOne("trainerLogin", trainerAccount);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return returnTrainerAccount;
  }

  public ArrayList<TrainerAccount> getAllTrainer() {
    List<TrainerAccount> returnAllTrainerList = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      returnAllTrainerList = sqlSession.selectList("getAllTrainer");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return (ArrayList<TrainerAccount>) returnAllTrainerList;
  }

  public Double getTrainerAvgGrade(int trainer_no) {
    Double avgGrade = 0.0;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      avgGrade = sqlSession.selectOne("trainerAvgGrade", trainer_no);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return avgGrade;
  }
  
  /**
   * members 테이블에서 trainer 번호를 검색하여 count 를 리턴한다.
   * @param trainer_no
   * @return
   */
  public int getTrainerMemberCount(int trainer_no) {
    int trainerMemberCount = 0;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      trainerMemberCount = sqlSession.selectOne("TrainerMemberCount", trainer_no);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return trainerMemberCount;
  }
  /**
   * 당일 출근한 멤버의 수를 샌다. 추후 날짜에 도입하려 한다.
   * @param trainer_no
   * @return
   */
  public int getMembersAttendenceCountForTrainer(int trainer_no) {
    int membersAttendenceCountForTrainer = 0;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      membersAttendenceCountForTrainer = sqlSession.selectOne("MembersAttendenceCountForTrainer", trainer_no);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return membersAttendenceCountForTrainer;    
  }
}
