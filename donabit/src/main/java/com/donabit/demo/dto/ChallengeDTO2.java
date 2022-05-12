package com.donabit.demo.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChallengeDTO2 {
	int chnum, chsuccess, chdonate, chexp, chmaxp, donatepay;
	String chname, chdesc, chsdate, chedate, donateco, chimgname, nickname;
	MultipartFile chimg;
	
}
