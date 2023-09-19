package com.sayproject.controller.Members;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;
import jdk.internal.org.jline.utils.Log;

public class MemberMainAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    int page = 1;

    if (request.getParameter("page") != null) {
      try {
        page = Integer.parseInt(request.getParameter("page"));
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
    }

    MembersDAO dao = new MembersDAO();
    List<Member> memberList = dao.memberList();

    LocalDate currentDate = LocalDate.now();
    // 날짜를 원하는 형식으로 출력하기 위해 DateTimeFormatter를 사용합니다.
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    // 현재 날짜를 지정한 형식으로 출력합니다.
    String formattedDate = currentDate.format(formatter);

    for (Member member : memberList) {
      // id 하고 날짜를 쿼리로 날려서 1 이면 출석 true
      // false
      Member checkMember = new Member();
      checkMember.setNo(member.getNo());
      checkMember.setRegist_day(formattedDate);
      int cnt = dao.duplicateAttendence(checkMember);
      if (cnt > 0) {
        member.setAttendence(true);
      } else {
        member.setAttendence(false);
      }
    }
    request.setAttribute("page", page);
    request.setAttribute("memberList", memberList);
    RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Members/members_main.jsp");
    dis.forward(request, response);
  }
}
