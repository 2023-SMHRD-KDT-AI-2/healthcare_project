package com.sayproject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sayproject.controller.Diet.GetFoodNameAction;
import com.sayproject.controller.Exercise.ExerciseMainAction;
import com.sayproject.controller.Exercise.ExerciseSub1Action;
import com.sayproject.controller.Exercise.ExerciseSub2Action;
import com.sayproject.controller.Exercise.GetMETAction;
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
      return new ExerciseMainAction();

    } else if (cmd.equals("sub1")) {
      return new ExerciseSub1Action();
    } else if (cmd.equals("sub2")) {
      return new ExerciseSub2Action();
    } else if (cmd.equals("inputInfo")) {
      return new MemberExerciseInformationInput();
    }
    // MariaDB와 MonggoDB에서 데이터 주기 위한 Action
    // 해당 로직이 실행되도 GetexerciseIDAction()을 실행하면
    // ajax를 통해 Diet.say를 요청하기 때문에 Diet.say로 페이지가 넘어감
    else if (cmd.equals("exerciseID")){
		return new GetMETAction();
	}
    return new ExerciseMainAction();
  }
}
