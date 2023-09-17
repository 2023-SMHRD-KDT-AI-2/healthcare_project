package com.sayproject.controller.Main.Member.GeneralLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoin;
import com.sayproject.model.Main.GeneralLgoin.GeneralLoginDAO;

public class GeneralLoginCheckAction implements Action {
    private static final String CHARSET = "utf-8";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        request.setCharacterEncoding(CHARSET);
        /******** 일반, 카카오 회원이 처음 가입하였을 경우 추가 정보 입력 페이지로 이동하게 한다. *******/

        HttpSession session = request.getSession();

        // loginMain페이지의 id값 가져오기
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // ID중복체크
        GeneralLoginDAO dao = new GeneralLoginDAO();
        GeneralJoin login = dao.generalSession(id);

        System.out.println("id :" + id);
        System.out.println("password :" + password);

        if (login == null) {
            request.setAttribute("loginError", "회원 정보가 존재하지 않습니다.");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Main.say?c=generalLogin");
            requestDispatcher.forward(request, response);
        } else {
            System.out.println("넘어온 password :" + login.getPassword());

            if (password.equals(login.getPassword())) {
                // 로그인 성공
                String loginType = request.getParameter("loginType");
                session.setAttribute("loginType", loginType);
                session.setAttribute("idOrEmail", id);

                // 로그인 이후 members테이블에 있는 모든 data 세션화!
                GeneralJoin data = dao.generalSession(id);
                session.setAttribute("address", data.getAddress()); // address
                session.setAttribute("age", data.getAge()); // 나이
                session.setAttribute("birthday", data.getBirthday()); // 생일
                session.setAttribute("gredit_card", data.getCredit_card()); // 회원번호
                session.setAttribute("expiration", data.getExpiration_day()); // 만료일
                session.setAttribute("gender", data.getGender());
                session.setAttribute("height", data.getHeight());
                session.setAttribute("job", data.getJob());
                session.setAttribute("kaka_id", data.getKaka_id());
                session.setAttribute("nickname", data.getName());
                session.setAttribute("no", data.getNo());
                session.setAttribute("phone", data.getPhone_number());
                session.setAttribute("regist", data.getRegist_day());
                session.setAttribute("trainer", data.getTrainer());
                session.setAttribute("weight", data.getWeight());
                session.setAttribute("profileImageUrl", data.getPhotopath()); // 이미지
                session.setAttribute("trainer", data.getTrainer());
                session.setAttribute("expiration_date", data.getExpiration_day());

                System.out.println("프로필 이미지 체크 :" + data.getPhotopath());
                System.out.println("아이디 체크 :" + data.getIdOrEmail());
                System.out.println("나이 체크 :" + data.getAge());
                System.out.println("생일 체크 :" + data.getBirthday());
                System.out.println("회원번호 체크 :" + data.getCredit_card());
                System.out.println("만료일 체크 :" + data.getExpiration_day());
                System.out.println("성별 체크 :" + data.getGender());
                System.out.println("키 체크 :" + data.getHeight());
                System.out.println("직업 체크 :" + data.getJob());
                System.out.println("이름 체크 :" + data.getName());
                System.out.println("일련번호 체크 :" + data.getNo());
                System.out.println("휴대혼번호 체크 :" + data.getPhone_number());
                System.out.println("트레이너번호 :" + data.getTrainer());
                System.out.println("체중 체크 :" + data.getWeight());
                System.out.println("등록일 체크 :" + data.getRegist_day());
                System.out.println("등록일 체크 :" + data.getExpiration_day());

                Script.href("로그인 성공", "/Members.say?c=input", response);

            } else {
                request.setAttribute("loginError", "비밀번호가 틀렸습니다.");
                request.setAttribute("email", id);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Main.say?c=generalLogin");
                requestDispatcher.forward(request, response);
            }
        }

        System.out.println(id);
    }
}
