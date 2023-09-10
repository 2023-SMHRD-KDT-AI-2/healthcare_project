package com.sayproject.controller.Main.KakaoLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sayproject.controller.Action;
import com.sayproject.model.Main.KakaoLogin.KakaoAccount;
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
		
		/***** parameter 값으로 로그인 후 카카오 등록 정보를 받아온 후 json 형태로 변환한다 */
		String kakaoInfo = null;
		if (request.getParameter("kakaoInfo") != null) {
			kakaoInfo = request.getParameter("kakaoInfo");
			Gson gson = new Gson();
			/********* sring to json **************/
			KakaoLoginInfo memberDailyData = gson.fromJson(kakaoInfo, KakaoLoginInfo.class);

			/*********
			 * memberDailyData 에서 정보를 가져오는 법 일부의 정보만 가져왔다. 추가로 가져와야 하는 데이터가 더 존재함.
			 */
			System.out.println(memberDailyData.getId());
			System.out.println(memberDailyData.getConnectedAt());

			KakaoAccount kakaoAccount = memberDailyData.getKakaoAccount();
			System.out.println(kakaoAccount.getEmail());

			Profile profile = kakaoAccount.getProfile();
			System.out.println(profile.getNickname());
			System.out.println(profile.getIsDefaultImage());
			System.out.println(profile.getThumbnailImageUrl());
			System.out.println(profile.getProfileImageUrl());
			/******** json to String ***************/
			// String jSon = gson.toJson(memberDailyData, KakaoLoginInfo.class);
			// System.out.println(jSon);

			/********
			 * Kakao DB 에 접근해 해당 아이디가 존재하는지 확인한다. 존재한다면 /Main.say 페이지로 이동 존재하지 않는다면 추가 정보 입력
			 * 페이지로 이동하게 한다.
			 ********/

			/********** DB 에서 kakao 정보로 가입한 기록이 있는지 확인 ***********/
			/********** DB 에 정보가 존재한다면 디비 정보 업데이트 한 후 메인페이지로 이동 시킨다 ***/
			/********** session 에 기록한다 ************/
			// RequestDispatcher dis = request.getRequestDispatcher("/Main.say");
			// dis.forward(request, response);
			/********** DB 에 가입한 정보가 없다면 추가 정보 입력 페이지로 이동. ***********************/
			/********** DB 에 모든 정보를 입력하기 전까지는 session 에 저장하지 않는다. ****************/
			response.sendRedirect("/Main.say");
		} else {
			/************* kakaoInfo 없이 해당 페이지 접속시 메인페이지로 이동 시킨다. **********/
			response.sendRedirect("/Main.say");
		}
	}
}
