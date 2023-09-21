package com.sayproject.controller.Main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        // 총 회원 중 오늘 출근한 회원수
        int attendenceCountForTriner = dao.getMembersAttendenceCountForTrainer(trainerObjectId);
        httpSession.setAttribute("attendenceCountForTriner", attendenceCountForTriner);

        // 해당 트레이너에 속한 총 회원 수
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
        // 베스트 트레이너
        String TrainerName = allDao.bestTrainer();

        request.setAttribute("TrainerName", TrainerName);

        ArrayList<Integer> ageList = allDao.age();

        // 연령대별 리스트 초기화
        List<Integer> teenage = new ArrayList<>();
        List<Integer> twenty = new ArrayList<>();
        List<Integer> thirty = new ArrayList<>();
        List<Integer> forty = new ArrayList<>();
        List<Integer> fifty = new ArrayList<>();
        List<Integer> sixty = new ArrayList<>();
        List<Integer> seventy = new ArrayList<>();

        for (int age : ageList) {
          if (age >= 10 && age < 20) {
            teenage.add(age);
          } else if (age >= 20 && age < 30) {
            twenty.add(age);
          } else if (age >= 30 && age < 40) {
            thirty.add(age);
          } else if (age >= 40 && age < 50) {
            forty.add(age);
          } else if (age >= 50 && age < 60) {
            fifty.add(age);
          } else if (age >= 60 && age < 70) {
            sixty.add(age);
          } else if (age >= 70 && age < 80) {
            seventy.add(age);
          }
        }

        // 각 연령대별 리스트를 request에 설정
        request.setAttribute("teenage", teenage.size());
        request.setAttribute("twenty", twenty.size());
        request.setAttribute("thirty", thirty.size());
        request.setAttribute("forty", forty.size());
        request.setAttribute("fifty", fifty.size());
        request.setAttribute("sixty", sixty.size());
        request.setAttribute("seventy", seventy.size());

        RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Main/main.jsp");
        dis.forward(request, response);
      } else {
        response.sendRedirect("/Main.say?c=login");
      }
    } else {
      response.sendRedirect("/Main.say?c=login");
    }
  }
}
