package com.donabit.demo.dao;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donabit.demo.dto.MemberDTO;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	public int insertmember(MemberDTO dto);
	public MemberDTO member(String email);
	
	//select * from member where email= 1?;
	MemberDTO findByUsername(String email);
	
	//public MemberDTO getUserById(String email);
	
	public String pwcheck(String email)throws Exception;	
	
	//회원정보 수정 탈퇴
	public int updatemember(MemberDTO dto);	
	public int passwordmodify(MemberDTO dto);
	public int deletemember(String email);
	
	//가입 검증
	// 이메일 중복체크
	public int emailchk(MemberDTO dto) throws Exception;

	// 닉네임 중복체크
	public int nickchk(MemberDTO dto) throws Exception;
	
	

}
