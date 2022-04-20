package check;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface CheckService {
	int insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist(String nickname, String chnum);
	int selectcountcheck(String nickname, String chnum);
	int selectchsuccess();
	int updatepersonalpf();
	int selectchecktime(String nickname, String chnum);
}
