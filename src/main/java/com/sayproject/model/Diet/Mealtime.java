package com.sayproject.model.Diet;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mealtime {
	
	private List<Diet> breakfast;
	private List<Diet> lunch;
	private List<Diet> dinner;
	private List<Diet> otherfood;
	
}
