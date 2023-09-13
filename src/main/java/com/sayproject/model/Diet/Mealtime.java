package com.sayproject.model.Diet;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mealtime {
	
	// 하루 섭치 음식 정보를 아침 점심, 저녁, 간식마다 리스트로 묶은 음식 정보를 나타내는 클래스
	private List<Diet> breakfast;
	private List<Diet> lunch;
	private List<Diet> dinner;
	private List<Diet> otherfood;
	
}
