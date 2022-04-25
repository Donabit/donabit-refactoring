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
	public int challnickname(String nickname, int chnumdetail) {
		
		return dao.challnickname(nickname, chnumdetail);
	}

	@Override
	public int insertChallengingAjax(String chnumajax, String nickname) {
		return dao.insertChallengingAjax(chnumajax, nickname);
	}

	@Override
	public List<ChallengeDTO> challengedetaillist(String chnumajax , String nickname) {
		return 	dao.challengedetaillist(chnumajax, nickname);
	}

	@Override
	public int deleteChallengingAjax(String chnumajax, String nickname) {
		return dao.deleteChallengingAjax(chnumajax, nickname);
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
	public int selectsingo(String nickname, String checkid) {
		return dao.selectsingo(nickname, checkid);
	}

	@Override
	public int insertlikes(String nickname, String checkid) {
		return dao.insertlikes(nickname, checkid);
	}
	
	@Override
	public int insertsingo(String nickname, String checkid) {
		return dao.insertsingo(nickname, checkid);
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
	public int deletesingo(String nickname, String checkid) {
		return dao.deletesingo(nickname, checkid);
	}

	@Override
	public int totallike(String checkid) {
		return dao.totallike(checkid);
	}

	@Override
	public int totalsingo(String checkid) {
		return dao.totalsingo(checkid);
	}

	

	
	
	

}