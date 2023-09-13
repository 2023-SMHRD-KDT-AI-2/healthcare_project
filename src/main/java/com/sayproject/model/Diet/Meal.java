package com.sayproject.model.Diet;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Meal {
	
	private List<Food> breakfast;
	private List<Food> lunch;
	private List<Food> dinner;
	private List<Food> otherfood;
	
}
