package com.sayproject.controller.Error;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class Error400Action  implements Action {
	  private static final String CHARSET = "utf-8";

	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding(CHARSET);

	    RequestDispatcher dis = request.getRequestDispatcher("/Main.say");
	    dis.forward(request, response);
	  }
}