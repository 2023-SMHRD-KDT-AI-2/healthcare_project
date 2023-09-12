package com.sayproject.controller.Diet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Diet.DietAll;
import com.sayproject.model.Diet.DietDAO;
import com.sayproject.model.Diet.Food;
import com.sayproject.model.Diet.Meal;

public class GetFoodNameAction implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        Gson gon = new Gson();
        String foodName = request.getParameter("foodName");
        Meal meal = gon.fromJson(foodName, Meal.class);
        
        ArrayList<DietAll> breakfastList = new ArrayList<DietAll>();
        ArrayList<DietAll> lunchList = new ArrayList<DietAll>();
        ArrayList<DietAll> dinnerList = new ArrayList<DietAll>();
        ArrayList<DietAll> otherfoodList = new ArrayList<DietAll>();
        
        DietDAO dao = new DietDAO();
        
        for (Food breakfast : meal.getBreakfast()){
            String code = breakfast.getCode();
            breakfastList.add(dao.showAllNutrient(code));
        }
        
        for (Food lunch : meal.getLunch()){
            String code = lunch.getCode();
            lunchList.add(dao.showAllNutrient(code));
        }
        
        for (Food dinner : meal.getDinner()){
            String code = dinner.getCode();
            dinnerList.add(dao.showAllNutrient(code));
        }
        
        for (Food otherfood : meal.getOtherfood()){
            String code = otherfood.getCode();
            DietAll all = dao.showAllNutrient(code);
            
            otherfoodList.add(dao.showAllNutrient(code));
        }
        
        double carbohydrate_sum = 0;
        
        for (int i = 0; i < meal.getBreakfast().size(); i++) {
        	carbohydrate_sum += (meal.getBreakfast().get(i).getGram() / breakfastList.get(i).getServing_size() * breakfastList.get(i).getCarbohydrate());
        }
        for (int i = 0; i < meal.getLunch().size(); i++) {
        	carbohydrate_sum += (meal.getLunch().get(i).getGram() / lunchList.get(i).getServing_size() * lunchList.get(i).getCarbohydrate());
        }
        for (int i = 0; i < meal.getDinner().size(); i++) {
        	carbohydrate_sum += (meal.getDinner().get(i).getGram() / dinnerList.get(i).getServing_size() * dinnerList.get(i).getCarbohydrate());
        }
        for (int i = 0; i < meal.getOtherfood().size(); i++) {
        	carbohydrate_sum += (meal.getOtherfood().get(i).getGram() / otherfoodList.get(i).getServing_size() * otherfoodList.get(i).getCarbohydrate());
        }
        
        System.out.println(carbohydrate_sum);


    }

}