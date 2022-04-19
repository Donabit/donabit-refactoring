package check;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface CheckService {
	int insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist();
	int selectcountchallenge();
	int selectchsuccess();
	int updatepersonalpf();
	int selectchecktime();
}
