package com.sayproject.controller.Main;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sayproject.controller.Action;
import com.sayproject.model.Main.TrainerLogin.TrainerLoginDAO;

public class MainAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    HttpSession httpSession = request.getSession();
    TrainerLoginDAO dao = new TrainerLoginDAO();
    if (httpSession.getAttribute("memberObjectId") != null) {
      int trainerObjectId = (Integer) httpSession.getAttribute("memberObjectId");
      System.out.println(trainerObjectId);
      if (trainerObjectId > 0) {
        String avgGrade = String.format("%.2f", dao.getTrainerAvgGrade(trainerObjectId));
        httpSession.setAttribute("avgGrade", avgGrade);

        int trainerMemberCount = dao.getTrainerMemberCount(trainerObjectId);
        httpSession.setAttribute("trainerMemberCount", trainerMemberCount);

        int attendenceCountForTriner = dao.getMembersAttendenceCountForTrainer(trainerObjectId);
        httpSession.setAttribute("attendenceCountForTriner", attendenceCountForTriner);
      }
      RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/main.jsp");
      dis.forward(request, response);
    } else {
      response.sendRedirect("/Main.say?c=login");
    }
  }
}
