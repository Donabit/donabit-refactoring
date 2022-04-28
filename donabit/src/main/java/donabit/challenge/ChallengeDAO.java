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
	public int challnickname(String nickname, int chnumdetail);
	public List<ChallengeDTO> challengedetaillist(String chnumajax, String nickname);
	public List<ChallengeDTO> challengedetaillist2(String chnumajax);
	public List<ChallengeDTO> selectbadge(String nickname);
	int selecttoggle(String nickname, String checkid);
	int selectsingo(String nickname, String checkid);
	int deleteChallengingAjax(String chnumajax, String nickname);
	int insertChallengingAjax(String chnumajax, String nickname);
	int insertlikes(String nickname, String checkid);
	int insertsingo(String nickname, String checkid);
	int deletelikes(String nickname, String checkid);
	int deletesingo(String nickname, String checkid);
	int totallike(String checkid);
	int totalsingo(String checkid);
	int[] selectexp(String nickname);
	int[] selectlevel();
	public List<ChallengeDTO> checklist2();
}
