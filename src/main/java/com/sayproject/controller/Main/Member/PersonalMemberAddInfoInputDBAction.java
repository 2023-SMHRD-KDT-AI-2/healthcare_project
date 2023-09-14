package com.sayproject.controller.Main.Member;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoin;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoinDAO;
import com.sayproject.model.Main.KakaoLogin.KakaoJoin;
import com.sayproject.model.Main.KakaoLogin.KakaoJoinDAO;

public class PersonalMemberAddInfoInputDBAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);
		
		
		
		HttpSession session = request.getSession();
		
		Enumeration<String> sessionAttributeNames = session.getAttributeNames();	
		
		System.out.println(sessionAttributeNames.asIterator().hasNext());
		
		while (sessionAttributeNames.asIterator().hasNext()) {
			System.out.println("이름 : " + sessionAttributeNames.asIterator().next());
			String sessionName = sessionAttributeNames.asIterator().next();
			System.out.printf("%s : %s", sessionName, session.getAttribute(sessionName));
		}
		
		System.out.println(session.getAttribute("profileImageUrl"));
		
	System.out.println(request.getParameter("height"));
	System.out.println(request.getParameter("phone_number"));
	System.out.println(request.getParameter("birthday"));
		
		

	
		//카카오 memberObjectId가 있으면 카카오 회원가입
		if(session.getAttribute("memberObjectId")!=null) {
			
			KakaoJoin kjoin = new KakaoJoin();
			//kakao 정보넘기기 kakao_loginDB에 넘기고
			kjoin.setMemberObjectId(String.valueOf(session.getAttribute("memberObjectId"))); //id
			kjoin.setEmailOrId(String.valueOf(session.getAttribute("emailOrId")));			//email
			kjoin.setProfileImageUrl(String.valueOf(session.getAttribute("profileImageUrl"))); ////profileimageurl
			kjoin.setNickname(String.valueOf(session.getAttribute("nickname")));	//nickname
			kjoin.setIsDefaultImage(String.valueOf(session.getAttribute("isDefaultImage")));	//isDefaultImage
			kjoin.setIsDefaultImage(String.valueOf(session.getAttribute("thumbnailImageUrl")));		//thumbnailImageUrl
			
			KakaoJoinDAO dao = new KakaoJoinDAO();
			int cnt = dao.kakaoJoin(kjoin);
			
			if(cnt>0) {
				// 추가정보 입력은 members테이블에 넘기기
				GeneralJoin gjoin = new GeneralJoin();
				
				gjoin.setIdOrEmail(String.valueOf(session.getAttribute("emailOrId"))); //id
				gjoin.setName(request.getParameter("name"));	//name
				gjoin.setWeight(request.getParameter("weight"));	//weight
				gjoin.setHeight(request.getParameter("height"));	//height
				gjoin.setAddress(request.getParameter("address"));	//address
				gjoin.setPhone_number(request.getParameter("phone_number"));	//phone_number
				gjoin.setGender(request.getParameter("gender"));	//gender
				gjoin.setBirthday(request.getParameter("birthday"));	//birthday
				GeneralJoinDAO generalJoinDao = new GeneralJoinDAO();
				
				GeneralJoinDAO dao1 = new GeneralJoinDAO();
				cnt = dao1.generalJoin(gjoin);
				
				Script.href("로그인 성공!!", "/Main.say?c=login", response);
				// kakao 로그인 세션 삭제
				session.invalidate();
				
			}else {
				Script.href("로그인 실패!!", "/Main.say?c=login", response);
				// kakao 로그인 세션 삭제
				session.invalidate();
			}
			
			
		}else {
			//일반회원가입 이후 members테이블에 data넘기기
			GeneralJoin gjoin = new GeneralJoin();
			gjoin.setIdOrEmail(request.getParameter("idOrEmail")); //id
			gjoin.setName(request.getParameter("name"));	//name
			gjoin.setWeight(request.getParameter("weight"));	//weight
			gjoin.setHeight(request.getParameter("height"));	//height
			gjoin.setAddress(request.getParameter("address"));	//address
			gjoin.setPhone_number(request.getParameter("phone_number"));	//phone_number
			gjoin.setGender(request.getParameter("gender"));	//gender
			gjoin.setBirthday(request.getParameter("birthday"));	//birthday
			GeneralJoinDAO generalJoinDao = new GeneralJoinDAO();
			
			GeneralJoinDAO dao1 = new GeneralJoinDAO();
			int cnt = dao1.generalJoin(gjoin);
			
			if(cnt>0) {
				Script.href("로그인 성공!!", "/Main.say?c=login", response);
				// kakao 로그인 세션 삭제
				session.invalidate();
				
			}else {
				Script.href("로그인 실패!!", "/Main.say?c=login", response);
				// kakao 로그인 세션 삭제
				session.invalidate();
			}
		}
		
		
		
	

		

		/************* DATA 를 받아 DB 에 저장한다 ************/
	}
}
