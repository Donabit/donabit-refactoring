package check;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import donabit.challenge.ChallengeDTO;

@Mapper //dao 인식 어노테이션
@Repository("checkdao")
public interface CheckDAO {
	 int insertCheck(CheckDTO dto);
	 List<CheckDTO> checklist(String nickname, String chnum);
	 int selectcountcheck(String nickname, String chnum);
	 int selectchsuccess(String chnum);
	 int updatepersonalpf(String chnum);
	 int selectchecktime(String nickname, String chnum);
	 int deletetoggle(int checkid);
	 int deletecheck(int checkid);
	 int mypagenicknameconn(String nickname);
	 List<ChallengeDTO> mypagechnumconn(int chnum);
	 List<ChallengeDTO> mypagecheck(String nickname);
}
