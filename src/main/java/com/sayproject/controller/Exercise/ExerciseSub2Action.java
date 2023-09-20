package com.sayproject.controller.Exercise;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sayproject.controller.Action;
import com.sayproject.model.Exercise.ExerciseDAO;
import com.sayproject.model.Exercise.MemberInfo;

public class ExerciseSub2Action implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    String memberNo = request.getParameter("no");

    if (memberNo.length() > 0) {
      ExerciseDAO dao = new ExerciseDAO();
      MemberInfo memberinfo = new MemberInfo();// 데이터를 DAO로 보내기
      memberinfo.setName(request.getParameter("name"));
      MemberInfo info = dao.info(memberinfo);
      System.out.println("사진 경로 : " + memberinfo.getPhotopath());
      System.out.println("info : " + info);

      HttpSession session = request.getSession();
      session.setAttribute("info", info); // info 하고 하는 이름으로 info데이터를 보내준다

      int cnt = dao.check(request.getParameter("name"));

      request.setAttribute("check", cnt);

      System.out.println("cnt확인:" + cnt);
      Enumeration<String> parameterNames = request.getParameterNames();
      while (parameterNames.hasMoreElements()) {
        String parameterName = parameterNames.nextElement();
        request.setAttribute(parameterName, request.getParameter(parameterName));
      }
      RequestDispatcher dis =
          request.getRequestDispatcher("WEB-INF/views/Exercise/exercise_sub2.jsp");
      dis.forward(request, response);
    } else {
      response.sendRedirect("/Members.say");
    }
  }
}
