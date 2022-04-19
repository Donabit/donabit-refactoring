package joinlogin;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



public class PrincipalDetails implements UserDetails{
	
	private MemberDTO memberdto; //composition
	
	public PrincipalDetails(MemberDTO memberdto) {
		this.memberdto = memberdto;
	}
	
	
	

	public MemberDTO getMemberdto() {
		return memberdto;
	}




	public void setMemberdto(MemberDTO memberdto) {
		this.memberdto = memberdto;
	}




	@Override
	public String getPassword() {		
		return memberdto.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return memberdto.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true; 
	}
	
	//계정이 가진 권한 목록 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
	//	Collection<GrantedAuthority> collectors = new ArrayList<>();	
	//	collectors.add(()->{return memberdto.getAuth();}); //이따 또 확인	
	//	return collectors;
		
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(memberdto.getAuth()));
		return authList;
		
	}

}
