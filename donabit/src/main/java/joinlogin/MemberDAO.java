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

}
