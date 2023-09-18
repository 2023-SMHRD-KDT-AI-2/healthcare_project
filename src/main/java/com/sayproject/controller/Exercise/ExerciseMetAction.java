package com.sayproject.controller.Exercise;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.lang.reflect.Type;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sayproject.controller.Action;
import com.sayproject.model.Exercise.ExerciseDAO;
import com.sayproject.model.Exercise.ExerciseMongo;

public class ExerciseMetAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		String exerciseID = request.getParameter("exerciseID");

		System.out.println("요청확인 : " + exerciseID);

		Gson gson = new Gson();

		Type listType = new TypeToken<ArrayList<ExerciseMongo>>(){}.getType();
		
		ArrayList<ExerciseMongo> exerciseList = gson.fromJson(exerciseID, listType);
		ArrayList<String> sendList = new ArrayList<String>();
		System.out.println("exerciseList : " + exerciseList);
		
		ExerciseDAO dao = new ExerciseDAO();
		
		for (ExerciseMongo e: exerciseList) {
			sendList.add(dao.met(e.getExerciseid()));
			System.out.println("샌드리스트 : " + sendList);
		}
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out= response.getWriter();
		
		out.print(sendList);
		
		
	      
	      
		
		//dao.met(exerciseID)`

	}
	
}
