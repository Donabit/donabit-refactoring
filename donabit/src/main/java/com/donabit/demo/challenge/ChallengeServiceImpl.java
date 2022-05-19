package com.donabit.demo.challenge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.donabit.demo.Criteria;
import com.donabit.demo.dao.ChallengeDAO;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.ReportDTO;

@Service("challengeservice")
@Transactional
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
	public List<ChallengeDTO> checklist2(String order, String keyword, MoreObject mo) {
		return dao.checklist2(order, keyword, mo);
	}

	@Override
	public List<ChallengeDTO> likeslist() {
		return dao.likeslist();
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

	@Override
	public List<Integer> selectexp(String nickname) {
		return dao.selectexp(nickname);
	}

	@Override
	public List<Integer> selectlevel() {
		return dao.selectlevel();
	}

	@Override
	public List<ChallengeDTO> selectbadge(String nickname) {
		return dao.selectbadge(nickname);
	}

	@Override
	public List<ReportDTO> selectReportCount() {
		return dao.selectReportCount();
	}

	@Override
	public List<ChallengeDTO> commentlist(String checkid) {
		return dao.commentlist(checkid);
	}

	@Override
	public int insertcomment(String checkid, String nickname, String content) {
		return dao.insertcomment(checkid, nickname, content);
	}

	@Override
	public int updatecomment(String cno, String content) {	
		return dao.updatecomment(cno, content);
	}

	@Override
	public int deletecomment(String cno) {
		return dao.deletecomment(cno);
	}
	
	

		
	
	
	//mypage service
	@Override
	public int selectMyChallengeCount(String chnum) {

		return dao.selectMyChallengeCount(chnum);
	}

	@Override
	public int myDonateCount(String nickname) {
		
		return dao.myDonateCount(nickname);
		
	}

	
	@Override
	public int updateViewCount(int chnumint) {
		
		System.out.println(chnumint);
		dao.updateViewCount(chnumint);
		 
		return dao.selectViewCountResult(chnumint);
		
	}

	
}