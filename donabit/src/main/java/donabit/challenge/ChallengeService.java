package donabit.challenge;

import java.util.List;

public interface ChallengeService {
	public List<ChallengeDTO> challengelist();
	public List<ChallengeDTO> challcount();
	public int challnickname(String nickname, int chnumdetail);
	public List<ChallengeDTO> challengedetaillist(String chnumajax, String nicknameajax);
	public List<ChallengeDTO> challengedetaillist2(String chnumajax);
	public int deleteChallengingAjax(String chnumajax, String nicknameajax);
	public int insertChallengingAjax(String chnumajax);
	int selecttoggle(String nickname, String checkid);
	int selectsingo(String nickname, String checkid);
	int insertlikes(String nickname, String checkid);
	int insertsingo(String nickname, String checkid);
	public List<ChallengeDTO> checklist2();
	int deletelikes(String nickname, String checkid);
	int deletesingo(String nickname, String checkid);
	int totallike(String checkid);
	int totalsingo(String checkid);
}
