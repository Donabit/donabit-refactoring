package check;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import donabit.challenge.ChallengeDTO;

@Service("checkservice")
public class CheckServiceImpl implements CheckService {
	
	@Autowired
	@Qualifier("checkdao")//이름정함
	CheckDAO dao;

	@Override
	public int insertCheck(CheckDTO dto) {
		String renameFilename = UUID.randomUUID().toString().substring(0, 4) + dto.getCheckimg().getOriginalFilename();
		dto.setCheckimg2(renameFilename);
		fileupload(dto.getCheckimg(),renameFilename);
		return dao.insertCheck(dto);
	}

	private void fileupload(MultipartFile mpf, String renameFilename) {
		String path= "/usr/mydir/donabit/chimages/";
		
		File uploadFile = new File(path + renameFilename);
		try {
			mpf.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<CheckDTO> checklist(String nickname, String chnum) {
		return dao.checklist(nickname, chnum);
	}

	@Override
	public int selectcountcheck(String nickname, String chnum) {
		return dao.selectcountcheck(nickname, chnum);
	}

	@Override
	public int selectchsuccess(String chnum) {
		return dao.selectchsuccess(chnum);
	}

	@Override
	public int updatepersonalpf(String chnum) {
		return dao.updatepersonalpf(chnum);
	}

	@Override
	public int selectchecktime(String nickname, String chnum) {
		return dao.selectchecktime(nickname, chnum);
	}

	@Override
	public String selectcheckname(String chname) {
		return null;
	}

	@Override
	public int deletetoggle(int checkid) {
		return dao.deletetoggle(checkid);
	}

	@Override
	public int deletecheck(int checkid) {
		return dao.deletecheck(checkid);
	}

	@Override
	public int mypagenicknameconn(String nickname) {
		return dao.mypagenicknameconn(nickname);
	}

	@Override
	public List<ChallengeDTO> mypagechnumconn(int chnum) {
		return dao.mypagechnumconn(chnum);
	}

	@Override
	public List<ChallengeDTO> mypagecheck(String nickname) {
		return dao.mypagecheck(nickname);
	}

	






	
}

	
