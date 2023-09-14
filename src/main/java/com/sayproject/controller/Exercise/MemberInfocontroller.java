package com.sayproject.controller.Exercise;

import java.awt.geom.FlatteningPathIterator;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sayproject.model.Exercise.ExerciseDAO;

//import com.sayproject.model.Exercise.ExerciseDAO;

public class MemberInfocontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInfocontroller(String id, String name, float met) {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");

		// 데이터 수집
		String id = request.getParameter("exrcise_id");
		String name = request.getParameter("exrcise_name");
		float met = Integer.parseInt("met");

		// 기능처리
		ExerciseDAO dao = new ExerciseDAO();
		MemberInfocontroller info = new MemberInfocontroller(id,name,met);
		
	}

}
