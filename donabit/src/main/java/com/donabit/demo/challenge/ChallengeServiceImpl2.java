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
	public List<ChallengeDTO2> selectChallenge(int index, int count) {
		return dao.selectChallenge(index, count);
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
}
