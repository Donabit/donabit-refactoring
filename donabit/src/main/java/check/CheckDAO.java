package check;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper //dao 인식 어노테이션
@Repository("checkdao")
public interface CheckDAO {
	public int insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist();
}
