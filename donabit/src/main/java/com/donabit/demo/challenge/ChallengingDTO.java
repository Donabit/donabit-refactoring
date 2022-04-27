package com.donabit.demo.challenge;

import joinlogin.MemberDTO;

public class ChallengingDTO {
	String personalpf;
	int level;
	MemberDTO memberDTO;

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public String getPersonalpf() {
		return personalpf;
	}

	public void setPersonalpf(String personalpf) {
		this.personalpf = personalpf;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	
	
}
