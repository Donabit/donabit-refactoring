package donabit.challenge;

import java.util.List;

public interface ChallengeService {
	public List<ChallengeDTO> challengelist();
	public List<ChallengeDTO> challcount();
	public List<ChallengeDTO> challengedetaillist(String chnumajax, String nicknameajax);
	public List<ChallengeDTO> challengedetaillist2(String chnumajax);
	public int deleteChallengingAjax(String chnumajax, String nicknameajax);
	public int insertChallengingAjax(String chnumajax);
}
