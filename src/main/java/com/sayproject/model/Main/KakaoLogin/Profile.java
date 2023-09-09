package com.sayproject.model.Main.KakaoLogin;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Profile {
	@SerializedName("nickname")
	@Expose
	private String nickname;
	@SerializedName("thumbnail_image_url")
	@Expose
	private String thumbnailImageUrl;
	@SerializedName("profile_image_url")
	@Expose
	private String profileImageUrl;
	@SerializedName("is_default_image")
	@Expose
	private Boolean isDefaultImage;
}
