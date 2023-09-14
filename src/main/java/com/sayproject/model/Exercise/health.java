package com.sayproject.model.Exercise;

import java.util.List;

import com.sayproject.model.Diet.Food;
import com.sayproject.model.Diet.Meal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class health {

	// MongDB에서 받아온 회원의 운동 정보 클래스
		private int exerciseid;
	    private String kind;
	    private int time_minute;
	    private int calorie;
	
}
