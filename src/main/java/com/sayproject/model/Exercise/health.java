package com.sayproject.model.Exercise;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Health {
	private List<ExerciseMongo> exercise;
}
