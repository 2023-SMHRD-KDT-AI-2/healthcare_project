package com.sayproject.controller.Diet;

import java.io.IOException;
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

        Gson gon = new Gson();
        String foodName = request.getParameter("foodName");
        Meal meal = gon.fromJson(foodName, Meal.class);
        
        DietDAO dao = new DietDAO();
        
        Mealtime mealTime = new Mealtime();
        
//        ArrayList<List<Food>> list = new ArrayList<List<Food>>();
        
//        list.add(meal.getBreakfast());
//        list.add(meal.getLunch());
//        list.add(meal.getDinner());
//        list.add(meal.getOtherfood());
        
//        Diet breakfast = new Diet();
//        Diet lunch = new Diet();
//        Diet dinner = new Diet();
//        Diet otherfood = new Diet();
        
        System.out.println(meal.getBreakfast());
        
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
        
        System.out.println(mealTime);
        
        request.setAttribute("mealTime", mealTime);
        
        RequestDispatcher rd = request.getRequestDispatcher("/Diet.say?c=main");
        rd.forward(request, response);
     
//        mealTime.add(breakfast);
//        mealTime.add(lunch);
//        mealTime.add(dinner);
//        mealTime.add(otherfood);

        
//        for (int i = 0; i < list.size(); i++) {
//    		double serving_size = 0;
//    		double eating_size = 0;
//    		double n = 0;
//    		double carbohydrate = 0;
//    		double protein = 0;
//    		double fat = 0;
//    		double cal = 0;
//        	for (int j = 0; j < list.get(i).size(); j++) {
//        		serving_size = dao.showAllNutrient(list.get(i).get(j).getCode()).getServing_size();
//        		eating_size = list.get(i).get(j).getGram();
//        		n = eating_size / serving_size;
//        		carbohydrate += n * dao.showAllNutrient(list.get(i).get(j).getCode()).getCarbohydrate();
//        		protein += n * dao.showAllNutrient(list.get(i).get(j).getCode()).getProtein();
//        		fat += n * dao.showAllNutrient(list.get(i).get(j).getCode()).getFat();
//        		cal += dao.showAllNutrient(list.get(i).get(j).getCode()).getEnergy();
//        	}
//        	mealTime.get(i).setCarbohydrate(carbohydrate);
//        	mealTime.get(i).setProtein(protein);
//        	mealTime.get(i).setFat(fat);
//        	mealTime.get(i).setEnergy(cal);
//        }
        
        
        
    }

}