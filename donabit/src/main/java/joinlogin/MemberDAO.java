package joinlogin;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	public int insertmember(MemberDTO dto);
	public MemberDTO member(String email);
}
