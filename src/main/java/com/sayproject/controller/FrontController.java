package com.sayproject.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

@WebServlet(urlPatterns = "*.say")
public class FrontController extends HttpServlet {

  private static final long serialVersionUID = 4059632197844714506L;
  private static final String CHARSET = "utf-8";

  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    String requestURI = request.getRequestURI();
    String contextPath = request.getContextPath();
    String subStringRequestURI = requestURI.substring(contextPath.length());

    System.out.println(subStringRequestURI);

    MembersDAO dao = new MembersDAO();
    List<Member> memberList = dao.memberList();

    request.setAttribute("memberList", memberList);
    if (subStringRequestURI.equals("/Main.say")) {
      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/main.jsp");
      rd.forward(request, response);
    }
  }
}
