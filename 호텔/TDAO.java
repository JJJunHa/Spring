package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TDAO {

	ArrayList<typeDTO> typelist();
	void type_insert(String x1);
	void type_update(String x1, int x2);
	void type_delete(int x2);
	
	void room_insert(int x2, int x3, String x1, int x4, int x5);
	void room_update(int x2, int x3, String x1, int x4, int x5, int x6);
	void room_delete(int x2);
	ArrayList<roomDTO> roomlist();
	ArrayList<roomDTO> roomlistUp(String x1, String x2);
	ArrayList<empDTO> getEMP();
	
	typeDTO typelistCh(int x);
	void insert(String x1, int price);
	
	roomDTO roomlistCh(int x);
	void book_insert(String x1, String x2, int x3, int x4, int x5, String x6, String x7);
	void book_update(String x1, String x2, int x3, int x4, int x5, String x6, String x7, int x8);
	void book_delete(int x);
	ArrayList<bookDTO> booklist();
}
