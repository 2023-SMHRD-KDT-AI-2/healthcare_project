package com.sayproject.model.Main.KakaoLogin;

import java.util.Properties;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoLoginInfo {
	@SerializedName("id")
	@Expose
	private Long id;
	@SerializedName("connected_at")
	@Expose
	private String connectedAt;
	@SerializedName("properties")
	@Expose
	private Properties properties;
	@SerializedName("kakao_account")
	@Expose
	private KakaoAccount kakaoAccount;
}
