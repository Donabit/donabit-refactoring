package com.donabit.demo.challenge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ControllerLibrary {
	
	@Autowired
	ChallengeService chservice;
	
	public int sumExp(String nickname) {
		List<Integer> exp = chservice.selectexp(nickname);
		return exp.stream().mapToInt(Integer::intValue).sum();
	}
	
	public int calcLevel(String nickname) {
		List<Integer> level = chservice.selectlevel();
		int levelresult = 1;

		// 경험치가 구간이 level 1초과 일때
		for (int i = 0; i < level.size(); i++) {
			if (level.get(i) < sumExp(nickname) && sumExp(nickname) <= level.get(i+1)) {
				levelresult++;
			}
		}
		return levelresult;
	}
}
