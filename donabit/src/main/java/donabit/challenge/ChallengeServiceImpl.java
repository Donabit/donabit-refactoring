package donabit.challenge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("challengeservice")
public class ChallengeServiceImpl implements ChallengeService {
	@Autowired
	ChallengeDAO dao;

	@Override
	public List<ChallengeDTO> challengelist() {
		return dao.challengelist();
	}

	@Override
	public List<ChallengeDTO> challcount() {
		return dao.challcount();
	}

	@Override
	public int challnickname(int chnumdetail) {
		
		return dao.challnickname(chnumdetail);
	}

	@Override
	public int insertChallengingAjax(String chnumajax) {
		return dao.insertChallengingAjax(chnumajax);
	}

	@Override
	public List<ChallengeDTO> challengedetaillist(String chnumajax , String nicknameajax) {
		return 	dao.challengedetaillist(chnumajax, nicknameajax);
	}

	@Override
	public int deleteChallengingAjax(String chnumajax, String nicknameajax) {
		return dao.deleteChallengingAjax(chnumajax, nicknameajax);
	}

	@Override
	public List<ChallengeDTO> challengedetaillist2(String chnumajax) {
		return 	dao.challengedetaillist2(chnumajax);
	}

	

	@Override
	public int selecttoggle(String nickname, String checkid) {
		return dao.selecttoggle(nickname, checkid);
	}

	@Override
	public int insertlikes(String nickname, String checkid) {
		return dao.insertlikes(nickname, checkid);
	}

	@Override
	public List<ChallengeDTO> checklist2() {
		return dao.checklist2();
	}

	@Override
	public int deletelikes(String nickname, String checkid) {
		return dao.deletelikes(nickname, checkid);
	}

	@Override
	public int totallike(String checkid) {
		return dao.totallike(checkid);
	}
	
	

}