package com.donabit.demo.challenge;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("dao2")
public interface ChallengeDAO2 {
	
	public int insertChallenge(ChallengeDTO2 dto);
}
