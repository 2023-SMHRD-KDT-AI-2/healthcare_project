package com.sayproject.controller.Diet;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sayproject.controller.Action;

public class DietMainAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    String memberNo = request.getParameter("no");
    
    if (memberNo != null && memberNo.length() > 0) {
      Enumeration<String> parameterNames = request.getParameterNames();

      while (parameterNames.hasMoreElements()) {
        String parameterName = parameterNames.nextElement();
        request.setAttribute(parameterName, request.getParameter(parameterName));
      }
      RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Diet/diet_main.jsp");
      dis.forward(request, response);
    } else {
      response.sendRedirect("/Members.say");
    }
  }
}
