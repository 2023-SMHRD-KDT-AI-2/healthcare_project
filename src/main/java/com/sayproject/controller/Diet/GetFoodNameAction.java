package com.sayproject.controller.Diet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Diet.Diet;
import com.sayproject.model.Diet.DietDAO;
import com.sayproject.model.Diet.Food;
import com.sayproject.model.Diet.Meal;
import com.sayproject.model.Diet.Mealtime;

public class GetFoodNameAction implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        // gson형식을 위한 객체 생성
        Gson gson = new Gson();
        // custom-d.js에서 ajax를 통해 보내온 MonggoDB의 데이터 수신
        String foodName = request.getParameter("foodName");
        // 수신된 foodName를 Json형식으로 변환 후 meal에 저장
        Meal meal = gson.fromJson(foodName, Meal.class);
        
        DietDAO dao = new DietDAO();
        
        // 아침, 점심, 저녁, 간식별로 먹은 음식 리스트를 담을 객체 생성 
        Mealtime mealTime = new Mealtime();
        
        // 유저가 입력한 음식을 MariaDB에 저장된 food_nutrients 테이블에 food_code값으로 접근
        // 아침, 점심, 저녁, 간식별로 List를 따로 만들어서 각각 저장 후
        // 데이터를 한번에 전송하기 위해 mealTime에 아침, 점심, 저녁, 간식을 다시 하나의 ArrayList로 저장
        List<Diet> breakfastDietList = new ArrayList<>();
        for (Food breakfast: meal.getBreakfast()) {
            String code = breakfast.getCode();
            breakfastDietList.add(dao.showAllNutrient(code));
        }
        mealTime.setBreakfast(breakfastDietList);

        List<Diet> lunchDietList = new ArrayList<>();
        for (Food lunch: meal.getLunch()) {
            String code = lunch.getCode();
            lunchDietList.add(dao.showAllNutrient(code));
        }
        mealTime.setLunch(lunchDietList);

        List<Diet> dinnerDietList = new ArrayList<>();
        for (Food dinner: meal.getDinner()) {
            String code = dinner.getCode();
            dinnerDietList.add(dao.showAllNutrient(code));
        }
        mealTime.setDinner(dinnerDietList);
        
        List<Diet> otherfoodDietList = new ArrayList<>();
        for (Food otherfood: meal.getOtherfood()) {
            String code = otherfood.getCode();
            otherfoodDietList.add(dao.showAllNutrient(code));
        }
        mealTime.setOtherfood(otherfoodDietList);
        
        // custom-d.js로 ajax를 통해 보내는 과정 
        // mealTime 을 다시 json파일로 변경
        String mealData = gson.toJson(mealTime);
        
        // 해당 과정은 공부가 필요함
        response.setContentType("text/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(mealData);
        
        
        
    }

}