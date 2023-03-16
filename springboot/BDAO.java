package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface BDAO {
	
	ArrayList<BbsDTO> bbslist();
	BbsDTO getBbs(int segno);
	BbsDTO nick(String id);
	void addCount(int segno);
	void addcontent(String x1, String x2, String x3);
	void revcontent(int segno);
	void updatecontent(String title, String content, int segno);
	void deletcontent(int segno);
	ArrayList<MDTO> getUsers();
	void signin(String id, String pass, String email, String inter, String rMale, String nick);
	menuDTO menu_select_check(int seg);
	ArrayList<menuDTO> menu_select();
	ArrayList<cafeDTO> cafe_select();
	void menu_insert(String x1, int x2);
	void menu_delete(int x1);
	
	void menu_update(String x1, int x2, int x3);
	
	void menu_comple(String x1, int x2, int x3, String x4, String x5);
}
