package joinlogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service // bean 등록
public class PrincipalDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberDAO memberdao;
	
	//username : email db에 있는지 확인해서 return
		
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		MemberDTO principal = memberdao.findByUsername(email);				
		return new PrincipalDetails(principal);
		
	/*	PrincipalDetails users = memberdao.getUserById(username);
		if(users == null) {
			 throw new UsernameNotFoundException("username " + username + " not found");
		}
		System.out.println("**************Found user***************");
		System.out.println("id : " + users.getUsername());
		return users;
		
		*/

	}
	
}
