package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	/*
	 * @Bean public BCryptPasswordEncoder encodePWD() { return new
	 * BCryptPasswordEncoder(); }
	 */

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http.csrf().disable(); //csrf토큰 비활성화
		
		http.authorizeRequests()
			.antMatchers("/**") //"/login","/insertmember","/main", "/css/**", "/images/**", "/js/**"
			.permitAll();
				//.antMatchers("/mypage/**").authenticated()
				//.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
				//.antMatchers("/admin/**").hasRole("ADMIN") //
				//.anyRequest().permitAll()				
			//.and()
			//	.formLogin()
			//	.loginPage("/loginform");
	}
	

}
