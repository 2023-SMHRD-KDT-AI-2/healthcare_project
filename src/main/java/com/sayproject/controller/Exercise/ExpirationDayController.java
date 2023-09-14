package com.sayproject.controller.Exercise;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;
import com.sayproject.model.Exercise.ExerciseDAO;
import com.sayproject.model.Exercise.MemberInfo;
public class ExpirationDayController  implements Action {
	  private static final String CHARSET = "utf-8";

	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding(CHARSET);

	    ExerciseDAO dao = new ExerciseDAO();
	    MemberInfo memberinfo = new MemberInfo();// 데이터를 DAO로 보내기
	    memberinfo.setName("김진호");
	    
	    MemberInfo info = dao.info(memberinfo);
	    
	    HttpSession session = request.getSession();
		session.setAttribute("info", info); // info 라고 하는 이름으로 info데이터를 보내준다
		
	    RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Exercise/exercise_sub2.jsp");
	    dis.forward(request, response);
	  }
	  
	  
	  
	  
}