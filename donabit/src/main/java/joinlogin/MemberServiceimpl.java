package joinlogin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberservice")
public class MemberServiceimpl implements MemberService {
	@Autowired
	@Qualifier("memberdao")
	MemberDAO dao;
	
	//@Autowired
	//private BCryptPasswordEncoder encoder;
	
	@Override
	public int insertmember(MemberDTO dto) {
		//String rawPassword = dto.getPassword();
		//String encPassword = encoder.encode(rawPassword);
		//dto.setPassword(encPassword);
		//dto.setAuth(RoleType.USER);
		//dtoRepository.save(user);
		return dao.insertmember(dto);
	}

	@Override
	public MemberDTO member(String email) {
		
		return dao.member(email);
	}
	
	
	
	@Override
	public String pwcheck(String email) throws Exception {
		return dao.pwcheck(email);
	}
	
	
	
	
	//회원 수정 탈퇴

	@Override
	public int updatemember(MemberDTO dto) {
		return  dao.updatemember(dto);
	}

	@Override
	public int passwordmodify(MemberDTO dto) {
		return dao.passwordmodify(dto);
	}
	

	@Override
	public int deletemember(String email) {
		return dao.deletemember(email);
	}
	
	
	//검증

	@Override
	public int emailchk(MemberDTO dto) throws Exception {		
		return dao.emailchk(dto);
	}

	@Override
	public int nickchk(MemberDTO dto) throws Exception {
		return dao.nickchk(dto);
	}

	

	/*
	@Override
	public PrincipalDetails getUserById(String email) {
		PrincipalDetails users = sqlSession.selectOne(namespace+"getUserById",email);
		return users;
	}
	
	*/
	
	
	
	

}
