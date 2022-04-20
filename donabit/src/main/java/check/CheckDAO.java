package check;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper //dao 인식 어노테이션
@Repository("checkdao")
public interface CheckDAO {
	 int insertCheck(CheckDTO dto);
	 List<CheckDTO> checklist(String nickname, String chnum);
	 int selectcountcheck(String nickname, String chnum);
	 int selectchsuccess();
	 int updatepersonalpf();
	 int selectchecktime(String nickname, String chnum);
}
