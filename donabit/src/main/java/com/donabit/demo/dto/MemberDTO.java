package com.donabit.demo.dto;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String email, nickname, password, phone, auth, avatar;
	private int enabled;

	public MemberDTO(){}

	public MemberDTO(String email, String nickname, String password, String phone, String auth, int enabled) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.phone = phone;
		this.auth = auth;
		this.enabled = enabled;
	}

}
