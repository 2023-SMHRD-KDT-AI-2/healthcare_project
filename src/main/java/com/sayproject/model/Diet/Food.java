package com.sayproject.model.Diet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Food {
	
    private String code;
    private String foodname;
    private int gram;
    private int calorie;
    
}
