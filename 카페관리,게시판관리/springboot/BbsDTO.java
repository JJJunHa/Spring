package com.human.springboot;

import lombok.Data;

@Data
public class BbsDTO {

	int segno;
	String title;
	String created;
	String updated;
	int readcount;
	String writer;
	String nickname;
	String content;
}
