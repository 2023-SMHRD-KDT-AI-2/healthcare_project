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
public class ExerciseSub2Action  implements Action {
	  private static final String CHARSET = "utf-8";

	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding(CHARSET);

	    request.setAttribute("no", request.getParameter("no")) ;
	    
	    request.setAttribute("name", request.getParameter("name")) ;
	    
	    request.setAttribute("age", request.getParameter("age")) ;
	    
	    request.setAttribute("gender", request.getParameter("gender")) ;
	    
	    request.setAttribute("weight", request.getParameter("weight")) ;
	    
	    request.setAttribute("height", request.getParameter("height")) ;
	    
	    ExerciseDAO dao = new ExerciseDAO();
	    MemberInfo memberinfo = new MemberInfo();// 데이터를 DAO로 보내기
	    System.out.println("넘어온 파라미터 : " + request.getParameter("name"));
	    memberinfo.setName(request.getParameter("name"));
	    MemberInfo info = dao.info(memberinfo);
	    System.out.println("사진 경로 : " + memberinfo.getPhotopath());
	    System.out.println("info : " + info);
	    
	    HttpSession session = request.getSession();
		session.setAttribute("info", info); // info 하고 하는 이름으로 info데이터를 보내준다
		
		int cnt = dao.check(request.getParameter("name"));
		
		request.setAttribute("check", cnt);
		
		System.out.println("cnt확인:"+cnt);
		
	    RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Exercise/exercise_sub2.jsp");
	    dis.forward(request, response);
	  }
	  
	  
	  
	  
}