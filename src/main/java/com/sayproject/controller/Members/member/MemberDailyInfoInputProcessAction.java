package com.sayproject.controller.Members.member;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bson.Document;
import org.bson.conversions.Bson;
import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.UpdateResult;
import com.sayproject.Utils.Utils;
import com.sayproject.controller.Action;
import com.sayproject.database.mongodb.MongoDBManager;

public class MemberDailyInfoInputProcessAction implements Action {
	private static final String CHARSET = "utf-8";

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding(CHARSET);

		/*
		 * 회원의 식단 정보 입력시 넘어올 정보 { 회원 번호 _id 회원 이름 name 트레이너 번호 trainer
		 * 
		 * == dailyInfo === [ { breakfast [ {foodname : value, gram : value, calorie :
		 * value }] 아침 내용 ( 음식이름, 그램수, 칼로리 ) lunch [ {foodname : value, gram : value,
		 * calorie : value }] 점심 내용 ( 음식이름, 그램수, 칼로리 ) dinner [ {foodname : value, gram
		 * : value, calorie : value }] 저녁 내용 ( 음식이름, 그램수, 칼로리 ) otherfood [ {foodname :
		 * value, gram : value, calorie : value }] 그외 내용 ( 음식이름, 그램수, 칼로리 )
		 * 
		 * 
		 * day 날짜
		 * 
		 * status.weight 몸무게 status.height 신장
		 * 
		 * ======================================== 회원의 운동 정보 입력시 넘어오는 정보
		 * 
		 * 회원 번호 _id 회원 이름 name 트레이너 번호 trainer exercise [ {kind:value,
		 * time_minute:value, calorie:value}] 운동 내용 ( 운동이름, 운동시간, 소모한 칼로리 )
		 * 
		 * 날짜 day 몸무게 status.weight 신장 status.height } ] }
		 */
		Enumeration<String> names = request.getParameterNames();
		Map<String, String[]> parameterMap = request.getParameterMap();
		while (names.hasMoreElements()) {
			String parameterName = names.nextElement();
			String[] str = parameterMap.get(parameterName);
			for (String s : str) {
				System.out.printf("%s : %s\n", parameterName, s);
			}
		}

		// collection=202308&fieldName=_id&value=1&valueType=int
		String collection = request.getParameter("collection");
		String fieldName = request.getParameter("fieldName");
		String _id = request.getParameter("_id");
		String name = request.getParameter("name");
		String day = request.getParameter("day");
		String trainer = request.getParameter("trainer");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");

		if (collection != null) {
			MongoDBManager dbManager = null;
			try {
				dbManager = MongoDBManager.getInstance();
				MongoDatabase db = dbManager.dbManager();
				MongoCollection<Document> docuCollection = db.getCollection(collection);

				/*********** find Query : _id 와 day 를 입력하여 처리한다. ***********/
				Document query = new Document().append(fieldName, (Utils.isInteger(_id) ? Integer.parseInt(_id) : _id))
						.append("dailyInfo.day", day);

				/******* 해당 쿼리 문을 json 형태로 변환 ***************/
				Bson updates = Updates.combine(
						/****** 멤버의 고유 ObjectID ***************/
						Updates.set(fieldName, (Utils.isInteger(_id) ? Integer.parseInt(_id) : _id)),
						/****** 멤버의 이름 **************/
						Updates.set("name", name),
						/****** 해당 멤버의 담당 트레이너 ****************/
						Updates.set("trainer", trainer),
						/****** 입력해야할 날짜 *********/
						Updates.set("dailyInfo.day", day),
						/****** 식단 정보 입력 *********/
						Updates.set("dailyInfo.$.diet.sum_calorie", 1234),
						/****** 운동 정보 입력 **********/
						Updates.set("dailyInfo.$.excercise.sum_calorie", 1234),
						/****** 회원의 체중 입력 ***************/
						Updates.set("dailyInfo.$.status.weight",
								(Utils.isInteger(weight) ? Integer.parseInt(weight) : weight)),
						/****** 회원의 신장 입력 *************/
						Updates.set("dailyInfo.$.status.height",
								(Utils.isInteger(height) ? Integer.parseInt(height) : height)),
						Updates.set("dailyInfo.$.status.length",
								(Utils.isInteger(height) ? Integer.parseInt(height) : height)));
				UpdateOptions options = new UpdateOptions().upsert(true);

				try {
					UpdateResult result = docuCollection.updateOne(query, updates, options);
					System.out.println("Modified document count: " + result.getModifiedCount());
					System.out.println("Upserted id: " + result.getUpsertedId()); // only contains a value when
																					// an upsert is performed
				} catch (MongoException me) {
					System.err.println("Unable to update due to an error: " + me);
				}
			} finally {
				if (dbManager != null) {
					dbManager.close();
				}
			}

		}
	}
}
