package joinlogin;

public interface MemberService {
	public int insertmember(MemberDTO dto);
	
	public MemberDTO member(String email);

	//PrincipalDetails getUserById(String email);
	
	//회원 수정 탈퇴
	public int updatemember(MemberDTO dto);
	public int passwordmodify(MemberDTO dto);
	public int deletemember(String email);
}
