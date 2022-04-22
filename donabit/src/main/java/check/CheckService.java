package check;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface CheckService {
	int insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist(String nickname, String chnum);
	int selectcountcheck(String nickname, String chnum);
	int selectchsuccess(String chnum);
	int updatepersonalpf(String chnum);
	int selectchecktime(String nickname, String chnum);
	String selectcheckname(String chname);
	 int deletecheck(CheckDTO dto);
}
