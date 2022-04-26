package com.donabit.demo.challenge;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import joinlogin.MemberDTO;

@Service("ChallengeService2")
public class ChallengeServiceImpl2 implements ChallengeService2 {
	
	@Autowired
	@Qualifier("dao2")
	ChallengeDAO2 dao;
	
	@Override
	public int insertChallenge(ChallengeDTO2 dto) {
		String renameFilename = UUID.randomUUID().toString().substring(0, 4) + dto.getChimg().getOriginalFilename();
		dto.setChimgname(renameFilename);
		fileUpload(dto.getChimg(), renameFilename);
		return dao.insertChallenge(dto);
	}

	
	private void fileUpload(MultipartFile mpf, String renameFilename) {
		String path = "/Users/bigchan/upload/";
		String path2 = "D:\\donabitimage/";
		File uploadFile = new File(path + renameFilename);
		try {
			mpf.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<ChallengeDTO2> selectChallengePage(int index, int count) {
		return dao.selectChallengePage(index, count);
	}


	@Override
	public int selectChallengeCount() {
		return dao.selectChallengeCount();
	}


	@Override
	public List<MemberDTO> selectMember() {
		return dao.selectMember();
	}


	@Override
	public int selectChallengingMemberCount(int chnum) {
		return dao.selectChallengingMemberCount(chnum);
	}


	@Override
	public int selectSuccessMemberCount(int chnum) {
		return dao.selectSuccessMemberCount(chnum);
	}


	@Override
	public int selectCheckCount(int chnum) {
		return dao.selectCheckCount(chnum);
	}


	@Override
	public int deleteChallenge(int chnum) {
		return dao.deleteChallenge(chnum);
	}


	@Override
	public int selectMemberCount() {
		return dao.selectMemberCount();
	}


	@Override
	public List<ChallengeDTO2> selectChallengeName() {
		return dao.selectChallengeName();
	}


	@Override
	public int selectChallengingCountByNickname(String nickname) {
		return dao.selectChallengingCountByNickname(nickname);
	}


	@Override
	public int selectSuccessCountByNickname(String nickname) {
		return dao.selectSuccessCountByNickname(nickname);
	}


	@Override
	public int selectCheckCountByNickname(String nickname) {
		return dao.selectCheckCountByNickname(nickname);
	}


	@Override
	public int selectReportCountByNickname(String nickname) {
		return dao.selectReportCountByNickname(nickname);
	}


	@Override
	public String selectChallengeNameByNumber(int chnum) {
		return dao.selectChallengeNameByNumber(chnum);
	}


	@Override
	public List<ChallengingDTO> selectMemberInfoByNumber(int chnum) {
		return dao.selectMemberInfoByNumber(chnum);
	}


	@Override
	public int selectEachReportCountByNumber(String chnum, String nickname) {
		return dao.selectEachReportCountByNumber(chnum, nickname);
	}


	@Override
	public int selectEachCheckCountByNumber(String chnum, String nickname) {
		return dao.selectEachCheckCountByNumber(chnum, nickname);
	}


	@Override
	public List<ReportDTO> selectReportDto() {
		return dao.selectReportDto();
	}


	@Override
	public int selectReportCount() {
		return dao.selectReportCount();
	}
}
