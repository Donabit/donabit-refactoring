package com.donabit.demo.challenge;

import java.util.List;

import com.donabit.demo.Criteria;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.ReportDTO;

public interface ChallengeService {
	public List<ChallengeDTO> challengelist();
	public List<ChallengeDTO> challcount();
	public int challnickname(String nickname, int chnumdetail);
	public List<ChallengeDTO> challengedetaillist(String chnumajax, String nickname);
	public List<ChallengeDTO> challengedetaillist2(String chnumajax);
	public int deleteChallengingAjax(String chnumajax, String nickname);
	public int insertChallengingAjax(String chnumajax, String nickname);
	int selecttoggle(String nickname, String checkid);
	int selectsingo(String nickname, String checkid);
	int insertlikes(String nickname, String checkid);
	int insertsingo(String nickname, String checkid);
	public List<ChallengeDTO> checklist2(String order, String keyword, MoreObject mo);
	public List<ChallengeDTO> likeslist();
	int deletelikes(String nickname, String checkid);
	int deletesingo(String nickname, String checkid);
	int totallike(String checkid);
	int totalsingo(String checkid);
	List<Integer> selectexp(String nickname);
	List<Integer> selectlevel();
	public List<ChallengeDTO> selectbadge(String nickname);
	List<ReportDTO> selectReportCount(); 
	
	//mypage service
	int selectMyChallengeCount(String chnum);
	int myDonateCount(String nickname);
	
}
