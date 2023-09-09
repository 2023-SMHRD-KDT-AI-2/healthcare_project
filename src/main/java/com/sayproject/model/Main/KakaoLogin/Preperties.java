package com.sayproject.model.Main.KakaoLogin;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Preperties {
	@SerializedName("nickname")
	@Expose
	private String nickname;
	@SerializedName("profile_image")
	@Expose
	private String profileImage;
	@SerializedName("thumbnail_image")
	@Expose
	private String thumbnailImage;
}
