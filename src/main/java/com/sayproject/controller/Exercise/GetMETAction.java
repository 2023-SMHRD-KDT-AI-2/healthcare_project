package com.sayproject.controller.Exercise;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Diet.Diet;
import com.sayproject.model.Diet.Food;
import com.sayproject.model.Diet.Mealtime;
import com.sayproject.model.Exercise.ExerciseMaria;
import com.sayproject.model.Exercise.ExerciseMongo;
import com.sayproject.model.Exercise.Health;
import com.sayproject.model.Exercise.ExerciseDAO;

public class GetMETAction implements Action{
	private static final String CHARSET = "utf-8";
	
	
	@Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        Gson gson = new Gson();
        
        ExerciseDAO dao = new ExerciseDAO();
        ExerciseMaria maria = new ExerciseMaria();
        ExerciseMongo mongo = new ExerciseMongo();
       
        //요청
        String exerciseID = request.getParameter("exerciseID");
        System.out.println("요청 확인 " + exerciseID);
   
       Health health  = gson.fromJson(exerciseID, Health.class);
       System.out.println("테스트 : " +  health);
        
       
        
        
   
       
        // ajax 데이터를 Health에 list형태로 담음
//        Health health =  gson.fromJson(exerciseID, Health.class);
//        // int id = health.getExercise().get(0).getExerciseid();
//        
//        //Exercise_Maria maria =  dao.exerciseID(id);
//        
        
        
        
        
        
        
        
        
        
        
      
        
        // System.out.println("exercise db " + health);
        
        
//        health.getExercise_id();
//        health.getExercise_name();
//        health.getExercise_picture();
//        health.getMet();
//        
//        Exercise result = dao.exerciseID(health.getExercise_id());
//        exerciseList.add(result);
        
//        response.setContentType("text/json;charset=utf-8");
//        PrintWriter out = response.getWriter();
        
        //out.println(result);
        
        
        
      
        
        
        // 수신된 exerciseID를 Json형식으로 변환 후 health에 저장
        //Exercise health = gson.fromJson(exerciseID, Exercise.class);
        
        
        
        // 아침, 점심, 저녁, 간식별로 먹은 음식 리스트를 담을 객체 생성 
        //Mealtime mealTime = new Mealtime();
        
        // 유저가 입력한 음식을 MariaDB에 저장된 EXERCISE_INFO 테이블에 EXERCISE_ID값으로 접근
        // 아침, 점심, 저녁, 간식별로 List를 따로 만들어서 각각 저장 후
        // 데이터를 한번에 전송하기 위해 mealTime에 아침, 점심, 저녁, 간식을 다시 하나의 ArrayList로 저장
//        List<Diet> breakfastDietList = new ArrayList<>();
//        for (Food breakfast: meal.getBreakfast()) {
//            String code = breakfast.getCode();
//            breakfastDietList.add(dao.showAllNutrient(code));
//        }
//        mealTime.setBreakfast(breakfastDietList);

        
        // custom-d.js로 ajax를 통해 보내는 과정 
//        // mealTime 을 다시 json파일로 변경
//        String mealData = gson.toJson(mealTime);
//        
//        // 해당 과정은 공부가 필요함
//        response.setContentType("text/json;charset=utf-8");
//        PrintWriter out = response.getWriter();
//        out.println(mealData);
//        
    }

}
