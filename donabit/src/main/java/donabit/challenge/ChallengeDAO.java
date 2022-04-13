package donabit.challenge;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("challengedao")
public interface ChallengeDAO {
	public List<ChallengeDTO> challengelist();
}
