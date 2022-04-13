package donabit.challenge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("challengeservice")
public class ChallengeServiceImpl implements ChallengeService {
	@Autowired
	ChallengeDAO dao;

	@Override
	public List<ChallengeDTO> challengelist() {
		return dao.challengelist();
	}

}