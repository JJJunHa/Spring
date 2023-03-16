package com.human.springboot;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {
	//localhost:8081/home을 웰브라우저에서 입력하면,
	//WS에서는 game()을 실행한다(test1.jsp를 웹브라우저에게 보낸다)
	
	@GetMapping("/sample")
	public String sample() {
		return "sample";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	@GetMapping("/login")//화면에 뛰어 주는것
	public String login() {
		return "login";
	}
	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}

	@GetMapping("/doLogin")
	public String doLogin(HttpServletRequest req, Model model) {
		String loginid=req.getParameter("idin");
		String passcode=req.getParameter("pasin");
		System.out.println("로긴아이디["+loginid+"] 비밀번호 ["+passcode+"]");
		model.addAttribute("userid",loginid);
		model.addAttribute("pwd",passcode);
		return "result";
		
	}
	
//---------------------------------------------
	@GetMapping("/personal")
	public String personal() {
		return "personal";
	}
	
	@PostMapping("/doPersonal")
	public String doPersonal(HttpServletRequest req, Model model) {
		String name=req.getParameter("namein");
		String birth=req.getParameter("birthin");
		String phon=req.getParameter("phonin");
		
		name="이름:"+name;
		birth="생년월일: "+birth.substring(0,4)+"년"+birth.substring(4,6)+"월"+birth.substring(6,8)+"일";
		phon="모바일번호: "+phon.substring(0,3)+"-"+phon.substring(3,7)+"-"+phon.substring(7,11);
		
		model.addAttribute("name",name);
		model.addAttribute("birth",birth);
		model.addAttribute("phon",phon);
		return "showinfo";
	}
//------------------------------------@PathVariable 방식 클라이언트에서 서버로
	@GetMapping("/showsignon/{arg1}/{arg2}")
	public String showSignon(@PathVariable("arg1") String userid,
			   @PathVariable("arg2") String pwd,
			   Model model) {
		
		if(userid==null||userid.equals("")) {
			userid=" ";
		}
		if(pwd==null||pwd.equals("")) {
			pwd=" ";
		}
		
		model.addAttribute("userid",userid);
		model.addAttribute("pwd",pwd);
		return "signon";
	}
	@GetMapping("/showsignon")
	public String showSigno() {
		
		return "signon";
	}
	
	@GetMapping("/dosignon/{arg1}/{arg2}")
	public String doSignon(@PathVariable("arg1") String userid,
						   @PathVariable("arg2") String pwd,
						   Model model) {
		System.out.println("로긴아이디 ["+userid+"] 비밀번호 ["+pwd+"]");
		
		model.addAttribute("userid",userid);
		model.addAttribute("pwd",pwd);
		return "result";		
	}
	
	
	
	
//	@GetMapping("/")
//	public ModelAndView messi() {
//		ModelAndView mv = new ModelAndView();
//		String nickname = "김준하";
//		mv.addObject("nickname",nickname);
//		
//		return mv;
//	}
	
	@GetMapping("/show")//데이터를 서버에 보내는 방법
	public String show(HttpServletRequest req, Model model) {
		
		String str1 = req.getParameter("mobile");
		String str2 = req.getParameter("city");
		
		model.addAttribute("phone",str1);
		model.addAttribute("region",str2);
		return "show";
	}
	@GetMapping("/common")//데이터를 서버에 보내는 방법
	public String common(HttpServletRequest req, Model model) {
		
		String str1 = req.getParameter("a");
		String str2 = req.getParameter("b");
		int int1=Integer.parseInt(str1);
		int int2=Integer.parseInt(str2);
		int tmp;
		int lcm = int1 * int2;
        while (int2 != 0) {
            tmp = int1 % int2;
            int1 = int2;
            int2 = tmp;
        }
        lcm=lcm/int1;
		model.addAttribute("divisor",int1);
		model.addAttribute("multiple",lcm);
		return "common";
	}
	@GetMapping("/gugu")
	public String gu(HttpServletRequest req, Model model) {
		ArrayList<String> count = new ArrayList<String>();
		String str1 = req.getParameter("dan");
		int str2=Integer.parseInt(str1);
		for(int i=1; i<=9; i++) {
			count.add(str2+"x"+i+"="+(str2*i)+"<br>");
		}
		model.addAttribute("gugu",count);
		return "gugu";
	}
	@GetMapping("/table")
	public String table(HttpServletRequest req, Model model) {
		String str1=req.getParameter("row");
		String str2=req.getParameter("col");
		int tr=Integer.parseInt(str1);
		int td=Integer.parseInt(str2);
		String table="";
		int count =1;
		for(int i=0; i<tr; i++) {
			table=table+"<tr>";
			for(int j=0; j<td; j++) {
				table=table+"<td>"+count+"</td>";
				count++;
			}
			table=table+"</tr>";
		}
		String sol="<table border=1>"+table+"</table>";
		model.addAttribute("table",sol);
		return "table";
	}
	
	
	@GetMapping("/test1")//서버에 데이터를 클라이언트에 보내는 방법
	public String test1(Model model) {
		ArrayList<String> alMenu = new ArrayList<String>();
		alMenu.add("Latte");
		alMenu.add("Mocca");
		alMenu.add("Cappuccino");
		alMenu.add("Espresso");
		model.addAttribute("menu",alMenu);
		return "test1";
	}
	
	@GetMapping("/")
	public String root(Model model) {
		
		for(int i=0; i<=9; i++) {
			model.addAttribute("value"+i,"9x"+i+"="+(9*i));
		}
		
		String nickname = "김준하";
		model.addAttribute("nickname",nickname);
		model.addAttribute("mobile","01030248400");
		model.addAttribute("birth","1997");
//		model.addAttribute("nickname",nickname);
		return "root";
	}
	
	
	
	
	
	@GetMapping("/game")
	public String game() {
		return "game";
	}
	
//	@GetMapping("/table")  // teacher table	>> 이거오류났었음. method 중에 똑같이 /table 가진애 있었음
//	public String doTable(Model model, HttpServletRequest req) {
//		
////		String row = req.getParameter("row");
////		String col = req.getParameter("col");
////		// /table?row=x&col=y 이렇게 input 을 주소창에서 받음
////		
////		// getParameter 는 String data 로 input 되므로, 숫자data로 변환함
////		
////		int x = Integer.parseInt(row); // 이렇게 해두 되고, 애초에 아래처럼 해두됨
//		int row = Integer.parseInt(req.getParameter("row"));
//		int col = Integer.parseInt(req.getParameter("col"));
//		
//		String str = "";
//		str = "<table border=1>";
//		for(int i=0;i<row;i++) {
//			str += "<tr>";
//			for(int j=0;j<col;j++) {
//				str+="<td>" + (i*j) + "</td>";
//			}
//			str+="</tr>";
//		}
//		str+="</table>";
//		
//		model.addAttribute("tbl",str);
//		
//		return "./c0224/table";
//	}
	
	
	
	
	
	//////////////////////////////// 0224 ////////////////////////////////////////
	
	
	// 오늘은 getParameter 말고 client 로부터  data 받는방법을 알아볼거임
	
	
	@GetMapping("/c0224")
	public String c0224(Model model, HttpServletRequest req) {
		
		
		
		
		
		return "./c0224/c0224";
	}
	
	
	
// RequestParam 쓰는법 : RequestParam 을 사용하여 매개변수로 읽어들인다.
/*	
	@GetMapping("/t_table")
	public String doTable(@RequestParam("row") int row,
						@RequestParam("col") int col, Model model) {
		String str = "";
		str = "<table border=1>";
		for(int i=0;i<row;i++) {
			str += "<tr>";
			for(int j=0;j<col;j++) {
				str+="<td>" + (i*j) + "</td>";
			}
			str+="</tr>";
		}
		str+="</table>";
		
		model.addAttribute("tbl",str);
		
		return "./c0224/table";
	}
*/	
	
	
	
	
	// Command class 사용하기 : client 에서 data 가 많이 올 때 사용하기 좋다.
	
	// name, Id, password, gender, birthday, phone_number, interests 
	// 이거를 하나를 그냥 클래스로 만듬
	
	// dosignin(Member member, Model model); 이런식으로 만들기 가능 
	
	@GetMapping("/t_table")
	public String doTable(dim dim, Model model) {	// 이렇게하면 dim class 의 field 개수/종류만큼 
		String str = "";							// QueryString 을 받음 
		str = "<table border=1>";
		for(int i=0;i<dim.getRow();i++) {
			str += "<tr>";
			for(int j=0;j<dim.getRow();j++) {
				str+="<td>" + (i*j) + "</td>";
			}
			str+="</tr>";
		}
		str+="</table>";
		
		model.addAttribute("tbl",str);
		
		return "./c0224/table";
	}
	
	
	
	// Command class 연습해보기
	
	@GetMapping("/signonon")
	public String showSignonon () {
	return "signonon";
	}
	
	
	@PostMapping("/dosignon")
	public String doSignon (HttpServletRequest req, Model model) {
	String loginid=req.getParameter("loginid"); 
	String passcode=req.getParameter("passcode"); 
	String passcode1=req.getParameter("passcode1");  
	String realnam=req.getParameter("realname");
	String gender=req.getParameter("gender"); 
	String[] area = req.getParameterValues("selArea"); 
	String[] interest = req.getParameterValues ("interest");
	
	System.out.println(loginid);
	System.out.println(passcode);
	System.out.println(passcode1);
	System.out.println(realnam);
	System.out.println(gender);
	System.out.println(area.toString());
	System.out.println(interest.toString());
	
	model.addAttribute("loginid", loginid); 
	model.addAttribute("passcode", passcode); 
	model.addAttribute("passcode1", passcode1);
	model.addAttribute("realnam", realnam); 
	model.addAttribute("gender", gender);
	model.addAttribute("area", area); 
	model.addAttribute("interest", interest);
	
	
	return "result2";
	}
	
	
	
	
}
