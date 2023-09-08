package com.sayproject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sayproject.controller.Members.MemberMainAction;
import com.sayproject.controller.Members.MembersListAction;
import com.sayproject.controller.Members.MembersListJsonAction;
import com.sayproject.controller.Members.member.MemberDailyInfoAjaxForMongoDBAction;

public class MembersPageController {
  protected void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String cmd = "default";
    if (request.getParameter("c") != null) {
      cmd = request.getParameter("c");
      Action action = router(cmd, response);
      action.execute(request, response);
    } else {
      Action action = router(cmd, response);
      action.execute(request, response);
    }
  }

  public Action router(String cmd, HttpServletResponse response) {
    if (cmd.equals("main")) {
      return new MemberMainAction();
    }
    if (cmd.equals("list")) {
      return new MembersListAction();
    }
    if (cmd.equals("json")) {
      return new MembersListJsonAction();
    }
    if (cmd.equals("member")) {
      return new MemberDailyInfoAjaxForMongoDBAction();
    }
    return new MemberMainAction();
  }
}
