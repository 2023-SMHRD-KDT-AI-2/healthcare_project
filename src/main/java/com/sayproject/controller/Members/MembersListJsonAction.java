package com.sayproject.controller.Members;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

public class MembersListJsonAction implements Action {
  private static final String CHARSET = "utf-8";

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding(CHARSET);

    /*
     * HttpSession session = request.getSession(); Object sayAdmin = session.getAttribute("say"); if
     * (sayAdmin == null) { RequestDispatcher dis = request.getRequestDispatcher("/Main.say");
     * dis.forward(request, response); } else { MembersDAO dao = new MembersDAO(); List<Member>
     * memberList = dao.memberList(); if (request.getParameter("dataType") != null &&
     * request.getParameter("dataType").equals("json")) { try (PrintWriter out =
     * response.getWriter()) { Gson gson = new Gson(); out.write(gson.toJson(memberList)); } } else
     * { request.setAttribute("memberList", memberList); RequestDispatcher dis =
     * request.getRequestDispatcher("WEB-INF/views/Members/members_main.jsp"); dis.forward(request,
     * response); } }
     */
    MembersDAO dao = new MembersDAO();
    List<Member> memberList = dao.memberList();
    try (PrintWriter out = response.getWriter()) {
      Gson gson = new Gson();
      out.write(gson.toJson(memberList));
    }
  }
}
