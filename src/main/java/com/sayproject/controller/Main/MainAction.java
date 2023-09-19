package com.sayproject.controller.Main;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sayproject.controller.Action;
import com.sayproject.model.Main.TrainerLogin.TrainerLoginDAO;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

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

        // 남녀 비율
        MembersDAO allDao = new MembersDAO();

        int mCnt = allDao.male("m");
        int fCnt = allDao.female("f");

        request.setAttribute("male", mCnt);
        request.setAttribute("female", fCnt);

        System.out.println("남자확인:" + mCnt);
        System.out.println("여자확인:" + fCnt);

        // 나이별비율

        // 10대
        int teenCnt = allDao.teenage();

        request.setAttribute("teenage", teenCnt);

        // 20대
        int twoCnt = allDao.twenty();

        request.setAttribute("twenty", twoCnt);

        // 30대
        int thirCnt = allDao.thirty();

        request.setAttribute("thirty", thirCnt);

        // 40대
        int forCnt = allDao.forty();

        request.setAttribute("forty", forCnt);

        // 50대
        int fifCnt = allDao.fifty();

        request.setAttribute("fifty", fifCnt);

        // 60대
        int sixCnt = allDao.sixty();

        request.setAttribute("sixty", sixCnt);

        // 70대
        int sevenCnt = allDao.seventy();

        request.setAttribute("seventy", sevenCnt);



        RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/main.jsp");
        dis.forward(request, response);
      }
    }
  }
}
