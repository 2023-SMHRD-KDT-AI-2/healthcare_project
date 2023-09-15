package com.sayproject.model.Exercise;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // 매개 변수를 입력 받는 생성자 메소드 지정
@NoArgsConstructor // 기본 생성자 메소드 지정
public class ExerciseMaria {

	private int exercise_id;
	private String exercise_name;
	private float met;
	private String exercise_picture;
	
}
