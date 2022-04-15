package donabit.challenge;

import java.util.List;

public interface ChallengeService {
	public List<ChallengeDTO> challengelist();
	public List<ChallengeDTO> challcount();
	int insertChallengingAjax(String chnumajax);
}
