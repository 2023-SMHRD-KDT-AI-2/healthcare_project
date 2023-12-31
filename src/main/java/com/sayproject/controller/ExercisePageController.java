package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Exercise.ExerciseMainAction;
import com.sayproject.controller.Exercise.ExerciseMetAction;
import com.sayproject.controller.Exercise.ExerciseSub1Action;
import com.sayproject.controller.Exercise.ExerciseSub2Action;
import com.sayproject.controller.Exercise.MemberExerciseInformationInput;
import com.sayproject.controller.Main.LoginAction;
import com.sayproject.controller.Main.MainAction;

public class ExercisePageController {
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
      return new ExerciseSub2Action();
    }
    if (cmd.equals("exerciseID")) {
      return new ExerciseMetAction();
    }
    return new ExerciseSub2Action();
  }
}
