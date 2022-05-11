package com.donabit.demo.dto;

import lombok.Data;

@Data
public class BoardDTO {
	
	private int bno;
	private String title, content, writer, regdate;
	
}
