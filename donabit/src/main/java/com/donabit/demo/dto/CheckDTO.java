package com.donabit.demo.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CheckDTO {
	
	String nickname, checktime, checktitle, checkdesc, checkimg2, checkid;
	int chnum, checknum ;
	MultipartFile checkimg;
		
}
