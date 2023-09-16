package com.sayproject.model.Exercise;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ExerciseMongo {
	
	//mongoDB
		private String exerciseid;
		private String kind;
		private String met;
		private int time_minute;
		private double calorie;
}
