package joinlogin;

public interface MemberService {
	public int insertmember(MemberDTO dto);
	
	public MemberDTO member(String email);

	//PrincipalDetails getUserById(String email);
}
