package com.sayproject.controller.Main.Member;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sayproject.controller.Action;
import com.sayproject.controller.Script;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoin;
import com.sayproject.model.Main.GeneralLgoin.GeneralJoinDAO;
import com.sayproject.model.Main.KakaoLogin.KakaoJoin;
import com.sayproject.model.Main.KakaoLogin.KakaoJoinDAO;

public class PersonalMemberAdd2 implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		Enumeration<String> parameter = request.getParameterNames();

		while (parameter.hasMoreElements()) {
			String element = parameter.nextElement();
			String parameterName = request.getParameter(element);
			System.out.printf("%s : %s", element, parameterName);
		}
		int cnt = 0;

		HttpSession session = request.getSession();

		// 카카오 회원가입
		if (session.getAttribute("memberObjectId") != null) {
			System.out.println("kakao시 넘어감");
			KakaoJoin kjoin = new KakaoJoin();
			// kakao 정보넘기기 kakao_loginDB에 넘기고
			kjoin.setMemberObjectId(String.valueOf(session.getAttribute("memberObjectId"))); // id
			kjoin.setEmailOrId(String.valueOf(session.getAttribute("emailOrId"))); // email
			kjoin.setProfileImageUrl(String.valueOf(session.getAttribute("profileImageUrl"))); //// profileimageurl
			kjoin.setNickname(String.valueOf(session.getAttribute("nickname"))); // nickname
			kjoin.setIsDefaultImage(String.valueOf(session.getAttribute("isDefaultImage"))); // isDefaultImage

			KakaoJoinDAO dao = new KakaoJoinDAO();
			cnt = dao.kakaoJoin(kjoin);
			System.out.println("cnt값 : " + cnt);

			if (cnt > 0) {
				// 추가정보 입력은 members테이블에 넘기기
				GeneralJoin gjoin = new GeneralJoin();

				// 일반회원 login DB에 데이int cnt = 0;
				String saveDir = "/images";
				int size = 10 * 1024 * 1024;

				File currentDir = new File(saveDir);
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setRepository(currentDir);
				factory.setSizeThreshold(size);

				ServletFileUpload upload = new ServletFileUpload(factory);
				try {

					// 일반회원가입 이후 members테이블에 data넘기기

					List<FileItem> items = upload.parseRequest(request);
					for (FileItem fi : items) {
						if (fi.isFormField()) {
							System.out.println(fi.getFieldName() + " = " + fi.getString("utf-8"));
							System.out.println(fi.getFieldName().equals(("password")));
							if (fi.getFieldName().equals(("idOrEmail"))) {// id
								gjoin.setIdOrEmail(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("name"))) {// name
								gjoin.setName(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("password"))) {// password
								gjoin.setPassword(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("weight"))) { // weight
								gjoin.setWeight(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("height"))) { // height
								gjoin.setHeight(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("address"))) {// address
								gjoin.setAddress(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("phone_number"))) {// phone_number
								gjoin.setPhone_number(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("gender"))) {// gender
								gjoin.setGender(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("birthday"))) {// birthday
								gjoin.setBirthday(fi.getString("utf-8"));
							}

						} else {
							System.out.println(fi.getFieldName());

							String origin = fi.getName();
							System.out.println(origin);
							String ext = origin.substring(origin.lastIndexOf("."));

							UUID uuid = UUID.randomUUID();
							String name = uuid + ext;

							System.out.println(fi.getSize());
							File upPath = new File(currentDir + "\\");
							if (!upPath.exists()) {
								upPath.mkdirs();
							}

							// 일반 login profileImageUrl DB에 넘기기
							System.out.println(upPath.getAbsolutePath() + "\\" + name);

							gjoin.setPhotopath(upPath.getAbsolutePath() + "\\" + name);

							fi.write(new File(upPath, name));
						}
					}
					// gjoin 데이터 setter에 값을 다 집어 넌 이후 DAO에서 확인 후 cnt값 확인 후
					GeneralJoinDAO generalJoinDao = new GeneralJoinDAO();
					cnt = generalJoinDao.generalJoin(gjoin);
					if (cnt > 0) {
						Script.href("회원가입 성공!!", "/Main.say?c=login", response);
						// kakao 로그인 세션 삭제
						session.invalidate();

					} else {
						Script.href("회원가입 실패!!", "/Main.say?c=login", response);
						// kakao 로그인 세션 삭제
						session.invalidate();
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			} else {

				// 일반회원 login DB에 데이터 넘기기
				String saveDir = "/images";
				int size = 10 * 1024 * 1024;

				File currentDir = new File(saveDir);
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setRepository(currentDir);
				factory.setSizeThreshold(size);

				ServletFileUpload upload = new ServletFileUpload(factory);
				try {

					// 일반회원가입 이후 members테이블에 data넘기기
					GeneralJoin gjoin = new GeneralJoin();

					List<FileItem> items = upload.parseRequest(request);
					for (FileItem fi : items) {
						if (fi.isFormField()) {

							System.out.println(fi.getFieldName() + " = " + fi.getString("utf-8"));

							if (fi.getFieldName().equals(("idOrEmail"))) {// id
								gjoin.setIdOrEmail(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("name"))) {// name
								gjoin.setName(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("password"))) {// password
								gjoin.setName(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("weight"))) { // weight
								gjoin.setWeight(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("height"))) { // height
								gjoin.setHeight(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("address"))) {// address
								gjoin.setAddress(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("phone_number"))) {// phone_number
								gjoin.setPhone_number(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("gender"))) {// gender
								gjoin.setGender(fi.getString("utf-8"));
							}
							if (fi.getFieldName().equals(("birthday"))) {// birthday
								gjoin.setBirthday(fi.getString("utf-8"));

							}
							if (fi.getFieldName().equals(("password"))) {// password
								gjoin.setPassword(fi.getString("utf-8"));
							}

						} else {
							System.out.println(fi.getFieldName());

							String origin = fi.getName();
							System.out.println(origin);
							String ext = origin.substring(origin.lastIndexOf("."));

							UUID uuid = UUID.randomUUID();
							String name = uuid + ext;

							System.out.println(fi.getSize());
							File upPath = new File(currentDir + "\\");
							if (!upPath.exists()) {
								upPath.mkdirs();
							}

							// 일반 login profileImageUrl DB에 넘기기
							System.out.println(upPath.getAbsolutePath() + "\\" + name);

							gjoin.setPhotopath(upPath.getAbsolutePath() + "\\" + name);

							fi.write(new File(upPath, name));
						}
					}
					// gjoin 데이터 setter에 값을 다 집어 넌 이후 DAO에서 확인 후 cnt값 확인 후
					GeneralJoinDAO generalJoinDao = new GeneralJoinDAO();
					cnt = generalJoinDao.generalJoin(gjoin);
					if (cnt > 0) {
						Script.href("회원가입 성공!!", "/Main.say?c=login", response);
						// kakao 로그인 세션 삭제
						session.invalidate();

					} else {
						Script.href("회원가입 실패!!", "/Main.say?c=login", response);
						// kakao 로그인 세션 삭제
						session.invalidate();
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}

		}

	}
}
