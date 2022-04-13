package com.donabit.demo.challenge;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("ChallengeService2")
public class ChallengeServiceImpl2 implements ChallengeService2 {
	
	@Autowired
	@Qualifier("dao2")
	ChallengeDAO2 dao;
	
	@Override
	public int insertChallenge(ChallengeDTO2 dto) {
		return dao.insertChallenge(dto);
	}

	@Override
	public void fileUpload(MultipartFile mpf) {
		String path = "/Users/bigchan/upload/";
		String path2 = "D:\\donabitimage/";
		File uploadFile = new File(path2 + mpf.getOriginalFilename());
		try {
			mpf.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}
}
