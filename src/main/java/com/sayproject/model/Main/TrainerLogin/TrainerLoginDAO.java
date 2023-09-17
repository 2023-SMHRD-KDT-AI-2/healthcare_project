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
}