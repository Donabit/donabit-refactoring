package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import joinlogin.PrincipalDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private PrincipalDetailsService principalDetailsService;
	
	 @Bean 
	 public BCryptPasswordEncoder encodePwd(){ 
		 return new BCryptPasswordEncoder(); 
		 
	 }
	 
	 //security가 가로채서 로그인 -> 해쉬 비교 필요
	 @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(principalDetailsService).passwordEncoder(encodePwd());
		//super.configure(auth);
	}
	

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http.csrf().disable(); //csrf토큰 비활성화
		//http.httpBasic().disable();
		
		http.authorizeRequests()
			//.antMatchers("/") //"/login","/insertmember","/main", "/css/**", "/images/**", "/js/**"
			//.permitAll();
				.antMatchers("/mypage/**").authenticated()
				//.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/**").hasRole("ADMIN") //
				.anyRequest().permitAll()			
			.and()
				.formLogin()
				.loginPage("/loginform")
				.usernameParameter("email")
				.passwordParameter("password")
				.loginProcessingUrl("/loginProc") //스프링 시큐리티가 해당 주소로 요청하는 로그인 가로채서 대신 로그인
				.defaultSuccessUrl("/main")
				//.failureUrl("/fail")
			.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/main")
		  		.invalidateHttpSession(true); 
				
			
		
		
	}
	

}
