package com.donabit.demo.member;

import com.donabit.demo.dto.MemberDTO;

public interface MemberService {
	public int insertmember(MemberDTO dto);
	
	public MemberDTO member(String email);

	//PrincipalDetails getUserById(String email);
	
	public String pwcheck(String email)throws Exception;
	
	//회원 수정 탈퇴
	public int updatemember(MemberDTO dto);
	public int passwordmodify(MemberDTO dto);
	public int deletemember(String email);
	
	//가입 검증
	// 이메일 중복체크
	public int emailchk(MemberDTO dto) throws Exception;

	// 닉네임 중복체크
	public int nickchk(MemberDTO dto) throws Exception;
}
