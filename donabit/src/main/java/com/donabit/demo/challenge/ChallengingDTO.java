package com.donabit.demo.challenge;

public class ChallengingDTO {
	String personalpf, nickname, email;
	int level;
	
	public String getPersonalpf() {
		return personalpf;
	}



	public void setPersonalpf(String personalpf) {
		this.personalpf = personalpf;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}



	@Override
	public String toString() {
		return "ChallengingDTO [personalpf=" + personalpf + ", nickname=" + nickname + ", email=" + email + ", level="
				+ level + "]";
	}

	

	
	
}
