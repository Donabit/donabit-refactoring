package check;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface CheckService {
	void insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist();
}
