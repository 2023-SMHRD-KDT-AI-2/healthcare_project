package com.sayproject.controller.Members;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Action;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

public class MemberMainAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    MembersDAO dao = new MembersDAO();
    List<Member> memberList = dao.memberList();
    request.setAttribute("memberList", memberList);
    RequestDispatcher dis = request.getRequestDispatcher("WEB-INF/views/Members/members_main.jsp");
    dis.forward(request, response);
  }
}
