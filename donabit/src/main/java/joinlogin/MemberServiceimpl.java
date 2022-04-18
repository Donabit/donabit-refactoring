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

	/*
	@Override
	public PrincipalDetails getUserById(String email) {
		PrincipalDetails users = sqlSession.selectOne(namespace+"getUserById",email);
		return users;
	}
	
	*/
	
	
	

}
