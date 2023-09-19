package com.sayproject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sayproject.controller.Error.Error500Action;
import com.sayproject.controller.HttpApi.AllMember;
import com.sayproject.controller.HttpApi.AllTrainer;

public class HttpApiController {
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
    // 전체 트레이너 정보 use mariadb    
    if (cmd.equals("getAllTrainer")) {
      return new AllTrainer();
    }
    // 전체 멤버 정보 use mariadb
    if (cmd.equals("getAllMember")) {
      return new AllMember();
    }
    // 한명의 트레이너 정보 use mariadb
    
    // 한명의 회원 정보 use mariadb
    
    // 한명의 회원 식단 정보 use mongodb
    
    // 한명의 회원 운동 정보 use mongodb
    
    
    
    
    
    
    
    
    
    
    
    // cmd is null
    return new Error500Action();
  }
}
