package com.donabit.demo.challenge;

import java.util.List;

public interface ChallengeService2 {
	int insertChallenge(ChallengeDTO2 dto);
	List<ChallengeDTO2> selectChallenge();
}
