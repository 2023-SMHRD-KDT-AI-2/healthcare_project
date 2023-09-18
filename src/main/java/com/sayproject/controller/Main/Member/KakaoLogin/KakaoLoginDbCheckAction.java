package com.sayproject.controller.Main.Member.KakaoLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoin;
import com.sayproject.model.Main.GeneralLgoin.GeneralLoginDAO;
import com.sayproject.model.Main.KakaoLogin.KakaoAccount;
import com.sayproject.model.Main.KakaoLogin.KakaoIdDuplicationCheckDAO;
import com.sayproject.model.Main.KakaoLogin.KakaoLoginInfo;
import com.sayproject.model.Main.KakaoLogin.Profile;

public class KakaoLoginDbCheckAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		/**
		 * { "id": 2974722084, "connected_at": "2023-08-21T23:50:19Z", "properties": {
		 * "nickname": "최병훈", "profile_image":
		 * "http://k.kakaocdn.net/dn/1CKig/btsowlnver5/aJmkbGn00QavYcKM5p2Ni1/img_640x640.jpg",
		 * "thumbnail_image":
		 * "http://k.kakaocdn.net/dn/1CKig/btsowlnver5/aJmkbGn00QavYcKM5p2Ni1/img_110x110.jpg"
		 * }, "kakao_account": { "profile_nickname_needs_agreement": false,
		 * "profile_image_needs_agreement": false, "profile": { "nickname": "최병훈",
		 * "thumbnail_image_url":
		 * "http://k.kakaocdn.net/dn/1CKig/btsowlnver5/aJmkbGn00QavYcKM5p2Ni1/img_110x110.jpg",
		 * "profile_image_url":
		 * "http://k.kakaocdn.net/dn/1CKig/btsowlnver5/aJmkbGn00QavYcKM5p2Ni1/img_640x640.jpg",
		 * "is_default_image": false }, "has_email": true, "email_needs_agreement":
		 * false, "is_email_valid": true, "is_email_verified": true, "email":
		 * "sentimentalhoon@gmail.com", "has_age_range": false,
		 * "age_range_needs_agreement": false, "has_birthday": false,
		 * "birthday_needs_agreement": false, "has_gender": false,
		 * "gender_needs_agreement": false } }
		 */

		/******
		 * session check Enumeration<String> enumeration = session.getAttributeNames();
		 * while (enumeration.hasMoreElements()) { String elementString =
		 * enumeration.nextElement(); System.out.printf("%s : %s\n", elementString,
		 * session.getAttribute(elementString)); }
		 ******/
		String kakaoInfo = null;
		if (request.getParameter("kakaoInfo") != null) {
			kakaoInfo = request.getParameter("kakaoInfo");
			Gson gson = new Gson();
			/********* sring to json **************/
			KakaoLoginInfo memberDailyData = gson.fromJson(kakaoInfo, KakaoLoginInfo.class);
			KakaoAccount kakaoAccount = memberDailyData.getKakaoAccount();
			Profile profile = kakaoAccount.getProfile();

			/*
			 * memberDailyData 에서 정보를 가져오는 법 일부의 정보만 가져왔다. 추가로 가져와야 하는 데이터가 더 존재함.
			 */
			// request.setAttribute("memberDailyData", memberDailyData);
			// System.out.println("memberDailyData.getId() : " + memberDailyData.getId());
			// System.out.println("memberDailyData.getConnectedAt() : " +
			// memberDailyData.getConnectedAt());

			// request.setAttribute("memberObjectId", memberDailyData.getId());

			// System.out.println("kakaoAccount.getEmail() : " + kakaoAccount.getEmail());
			// request.setAttribute("emailOrId", kakaoAccount.getEmail());

			// System.out.println("profile.getNickname() : " + profile.getNickname());
			// System.out.println("profile.getIsDefaultImage() : " +
			// profile.getIsDefaultImage());
			// System.out.println("profile.getThumbnailImageUrl() : " +
			// profile.getThumbnailImageUrl());
			// System.out.println("profile.getProfileImageUrl() : " +
			// profile.getProfileImageUrl());
			System.out.println("카카오계쩡 : " +  kakaoAccount.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("memberObjectId", memberDailyData.getId());
			session.setAttribute("emailOrId", kakaoAccount.getEmail());
			session.setAttribute("nickname", profile.getNickname());
			session.setAttribute("isDefaultImage", profile.getIsDefaultImage());
			session.setAttribute("thumbnailImageUrl", profile.getThumbnailImageUrl());
			session.setAttribute("profileImageUrl", profile.getProfileImageUrl());

			/******** json to String ***************/
			// String jSon = gson.toJson(memberDailyData, KakaoLoginInfo.class);
			// System.out.println(jSon);

			/********
			 * Kakao DB 에 접근해 해당 아이디가 존재하는지 확인한다. 존재한다면 /Main.say 페이지로 이동 존재하지 않는다면 추가 정보 입력
			 * 페이지로 이동하게 한다.
			 ********/

			// id중복체크

			KakaoIdDuplicationCheckDAO dao = new KakaoIdDuplicationCheckDAO();

			int cnt = dao.kakaoIdDuplicationCheck(kakaoAccount.getEmail());

			if (cnt > 0) {
				/********** DB 에서 kakao 정보로 가입한 기록이 있는지 확인 ***********/
				/********** DB 에 정보가 존재한다면 디비 정보 업데이트 한 후 메인페이지로 이동 시킨다 ***/
				/********** session 에 기록한다 ************/
				/*
				 * 1. 일반 회원이 카카오를 통해 로그인한다. 2. 카카오에서 code 값을 받아온다. 3. 해당 code 를 이용해 access_token
				 * 값을 구해온다. 4. token 을 이용해 사용자의 카카오 정보를 가져온다. 5. 이후 해당 정보를 DB 에 기록한다. 6. 카카오 정보
				 * 외에 필요한 정보를 받는 페이지로 이동하여 입력 받는다. 7. 만약 추가 정보를 입력하지 않은 상태에서는 추가 정보 입력 페이지로 강제
				 * 이동하게 한다. 8. 추가 정보를 입력하여야만 해당 계정이 활성화 되게 한다.
				 */			System.out.println("카카오계쩡 : " +  kakaoAccount.getEmail());


				// 기존 회원이면!!! input페이지로 session과 함께 넘어간다!!!
				GeneralLoginDAO generallogindao = new GeneralLoginDAO();
				GeneralJoin data = generallogindao.generalSession(kakaoAccount.getEmail());
				System.out.println("data : " + data);
				System.out.println("주소" + data.getAddress());
				
				
				session.setAttribute("address", data.getAddress());
				session.setAttribute("age", data.getAge());
				session.setAttribute("birthday", data.getBirthday());
				session.setAttribute("credit_card", data.getCredit_card());
				session.setAttribute("expiration", data.getExpiration_day());
				session.setAttribute("gender", data.getGender());
				session.setAttribute("height", data.getHeight());
				session.setAttribute("job", data.getJob());
				session.setAttribute("kaka_id", data.getKaka_id());
				session.setAttribute("nickname", data.getName());
				session.setAttribute("no", data.getNo());
				session.setAttribute("phone_number", data.getPhone_number());
				session.setAttribute("regist_day", data.getRegist_day());
				session.setAttribute("trainer", data.getTrainer());
				session.setAttribute("weight", data.getWeight());

				response.sendRedirect("/Members.say?c=input");
			} else {
				/********** DB 에 가입한 정보가 없다면 추가 정보 입력 페이지로 이동. ***********************/
				/********** DB 에 모든 정보를 입력하기 전까지는 session 에 저장하지 않는다. ****************/
				RequestDispatcher dis = request.getRequestDispatcher("/Main.say?c=memberAddInfo&loginType=kakao");
				dis.forward(request, response);
			}
		} else {
			/************* kakaoInfo 없이 해당 페이지 접속시 메인페이지로 이동 시킨다. **********/
			response.sendRedirect("/Main.say");
		}
	}

}
