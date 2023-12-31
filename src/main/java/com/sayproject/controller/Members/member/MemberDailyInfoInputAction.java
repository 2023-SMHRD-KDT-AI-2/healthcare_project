package com.sayproject.controller.Members.member;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;

public class MemberDailyInfoInputAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    Enumeration<String> parameterNames = request.getParameterNames();

    while (parameterNames.hasMoreElements()) {
      String nextElement = parameterNames.nextElement();
      request.setAttribute(nextElement, request.getParameter(nextElement));
    }
    
    RequestDispatcher dis =
        request.getRequestDispatcher("WEB-INF/views/Members/member/memberDailyInfoInput.jsp");
    dis.forward(request, response);
  }
}
