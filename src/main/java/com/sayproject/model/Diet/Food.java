package com.sayproject.model.Diet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Food {
	
	// MongDB에서 받아온 회원의 섭취 음식 정보 클래스
    private String code;
    private String foodname;
    private double gram;
    private double calorie;
    
}
