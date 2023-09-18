package com.sayproject.model.Exercise;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ExerciseMongo {
	
	// MongDB에서 받아온 회원의 운동 정보 클래스
			private int exerciseid;
		    private String kind;
		    private double met;
		    private double time_minute;
		    private double calorie;
		   
}
