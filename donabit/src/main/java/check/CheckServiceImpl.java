package check;


import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import donabit.challenge.ChallengeDTO;

@Service("checkservice")
public class CheckServiceImpl implements CheckService {
	
	@Autowired
	@Qualifier("checkdao")
	CheckDAO dao;

	@Override
	public int insertCheck(CheckDTO dto) {
		return dao.insertCheck(dto);
	}

	@Override
	public void fileupload(MultipartFile mpf) {
		String path= "C:\\Users\\YooSeungAh\\upload\\";
		File uploadFile = new File(path + mpf.getOriginalFilename());
		try {
			mpf.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<CheckDTO> checklist() {
		return dao.checklist();
	}
}

	
