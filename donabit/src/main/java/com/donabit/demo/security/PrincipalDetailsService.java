package com.donabit.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.donabit.demo.dao.MemberDAO;
import com.donabit.demo.dto.MemberDTO;

@Service // bean 등록
public class PrincipalDetailsService implements UserDetailsService{
	
	@Autowired
	@Qualifier("memberdao")
	private MemberDAO memberdao;
	
	//username : email db에 있는지 확인해서 return
		
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
	
		
		System.out.println("--"+email + ":" );
		MemberDTO principal = memberdao.findByUsername(email);
		
		/*
		System.out.println("--"+email + ":" + principal+"--");
		
		return new PrincipalDetails(principal);
		*/
				
		if(principal == null) {
			 throw new UsernameNotFoundException("username " + email + " not found");
			 			 
		}
		else {
				
		return new PrincipalDetails(principal);
		}
		
		
	/*	PrincipalDetails users = memberdao.getUserById(username);
		if(users == null) {
			 throw new UsernameNotFoundException("username " + username + " not found");
		}
		System.out.println("**************Found user***************");
		System.out.println("id : " + users.getUsername());
		return users;
		
		
		
		
		
		MemberDTO principal = memberdao.findByUsername(email);
		return new PrincipalDetails(principal);
		
		
		*/

	}
	
}
