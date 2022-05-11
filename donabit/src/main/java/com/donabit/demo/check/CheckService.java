package com.donabit.demo.check;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.donabit.demo.dto.ChallengeDTO;
import com.donabit.demo.dto.CheckDTO;

public interface CheckService {
	int insertCheck(CheckDTO dto);
	public List<CheckDTO> checklist(String nickname, String chnum);
	int selectcountcheck(String nickname, String chnum);
	int selectchsuccess(String chnum);
	int updatepersonalpf(String chnum);
	int selectchecktime(String nickname, String chnum);
	String selectcheckname(String chname);
	int deletetoggle(int checkid);
	 int deletecheck(int checkid);
	 int mypagenicknameconn(String nickname);
	 List<ChallengeDTO> mypagechnumconn(int chnum);
	 List<ChallengeDTO> mypagecheck(String nickname);
}
