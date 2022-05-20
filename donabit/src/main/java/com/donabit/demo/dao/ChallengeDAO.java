package com.donabit.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.donabit.demo.challenge.MoreObject;
import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.ReportDTO;

@Mapper
@Repository("challengedao")
public interface ChallengeDAO {
	public List<ChallengeDTO> challengelist(String order, String keyword, MoreObject mo);

	public ChallengeDTO selectChallengeByChnum(String chnum);
	
	public int challcount(String chnum);

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

	List<Integer> selectexp(String nickname);

	List<Integer> selectlevel();

	public List<ChallengeDTO> checklist2(String order, String keyword, MoreObject mo);

	public List<ChallengeDTO> likeslist();

	List<ReportDTO> selectReportCount();

	public List<ChallengeDTO> commentlist(String checkid);

	int insertcomment(String checkid, String nickname, String content);

	int updatecomment(String cno, String content);

	int deletecomment(String cno);

	// mypage service
	int selectMyChallengeCount(String chnum);

	int myDonateCount(String nickname);

	public int updateViewCount(int chnumint);

	public int selectViewCountResult(int chnumint);

}
