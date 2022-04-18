package donabit.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.donabit.demo.challenge.ChallengeDTO2;


@Mapper
@Repository("challengedao")
public interface ChallengeDAO {
	public List<ChallengeDTO> challengelist();
	public List<ChallengeDTO> challcount();
	public int challnickname(int chnumdetail);
	public List<ChallengeDTO> challengedetaillist(String chnumajax, String nicknameajax);
	public List<ChallengeDTO> challengedetaillist2(String chnumajax);
	int deleteChallengingAjax(String chnumajax, String nicknameajax);
	int insertChallengingAjax(String chnumajax);
}
