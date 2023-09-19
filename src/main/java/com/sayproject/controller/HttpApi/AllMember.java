package com.sayproject.controller.HttpApi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Members.Member;
import com.sayproject.model.Members.MembersDAO;

public class AllMember implements Action{

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    MembersDAO memberDAO = new MembersDAO();
    List<Member> arrayListAllMembersAccount = memberDAO.memberList();
    
    Gson gson = new Gson();
    
    String returnJson = gson.toJson(arrayListAllMembersAccount);
    
    try (PrintWriter outPrinter = response.getWriter()) {
      outPrinter.print(returnJson);
    }
  }
}
