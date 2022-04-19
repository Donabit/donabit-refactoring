package joinlogin;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	public int insertmember(MemberDTO dto);
	public MemberDTO member(String email);
	
	//select * from member where email= 1?;
	MemberDTO findByUsername(String email);
	
	//public MemberDTO getUserById(String email);
	
	//회원정보 수정 탈퇴
	public int updatemember(MemberDTO dto);
	public int passwordmodify(MemberDTO dto);
	public int deletemember(String email);

}
