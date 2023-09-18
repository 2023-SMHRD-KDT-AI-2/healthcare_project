package com.sayproject.controller.Diet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.model.Diet.DietDAO;

public class DietMainAction  implements Action {
	  private static final String CHARSET = "utf-8";

	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding(CHARSET);
	    
	    request.setAttribute("no", request.getParameter("no"));
	    
	    System.out.println("파라미터 수신 값 : " + request.getParameter("no"));
	    
	    RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Diet/diet_main.jsp");
	    dis.forward(request, response);
	  }
}