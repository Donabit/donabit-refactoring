package com.donabit.demo.challenge;

import org.springframework.web.multipart.MultipartFile;

public interface ChallengeService2 {
	int insertChallenge(ChallengeDTO2 dto);
	void fileUpload(MultipartFile mpf);
}
