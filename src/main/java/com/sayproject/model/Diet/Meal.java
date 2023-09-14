package com.sayproject.model.Diet;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Meal {
	
	// 아침 점심 저녁, 간식별 음식 리스트를 나타내는 클래스
	private List<Food> breakfast;
	private List<Food> lunch;
	private List<Food> dinner;
	private List<Food> otherfood;
	
}
