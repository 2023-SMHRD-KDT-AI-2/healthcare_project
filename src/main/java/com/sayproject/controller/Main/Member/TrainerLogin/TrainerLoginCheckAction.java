package com.sayproject.controller.Main.Member.TrainerLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.TrainerLogin.TrainerAccount;
import com.sayproject.model.Main.TrainerLogin.TrainerLoginDAO;

public class TrainerLoginCheckAction implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);

        // parameter 에서 email 와 password 를 가져오기.
        // null 일 경우 다시 login page 로 이동
        final String email = request.getParameter("email");
        // email 이 null 이라면 바로 전 페이지로 보낸다.
        if (stringNullCheck(email)) {
            Script.back("E-Mail 주소가 입력되지 않았습니다.", response);
        } // password 가 null 이라면 바로 전 페이지로 보낸다.
        final String password = request.getParameter("password");
        if (stringNullCheck(password)) {
            Script.back("비밀번호가 입력되지 않았습니다.", response);
        }
        TrainerLoginDAO trainerLoginDAO = new TrainerLoginDAO();
        TrainerAccount trainerAccount = new TrainerAccount();
        trainerAccount.setId(email);
        trainerAccount.setPassword(password);
        // DB 접근해 id, password 확인해 해당 정보가 존재하는지 확인한다.
        TrainerAccount returnTrainerAccount = trainerLoginDAO.trainerLoginCheck(trainerAccount);

        // 존재하는 정보를 세션에 저장시킨다.
        if (returnTrainerAccount != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginType", "trainer");
            session.setAttribute("memberObjectId", returnTrainerAccount.getNo());
            session.setAttribute("emailOrId", returnTrainerAccount.getId());
            session.setAttribute("name", returnTrainerAccount.getName());
            session.setAttribute("nickname", returnTrainerAccount.getNickname());
            session.setAttribute("profileImageUrl", returnTrainerAccount.getPhotopath());
            response.sendRedirect("/Main.say?c=main");
        } else {
            Script.back("입력하신 계정 정보가 틀립니다.", response);
        }
    }

    private Boolean stringNullCheck(String str) {
        if (str == null) {
            return true;
        }
        return false;
    }
}