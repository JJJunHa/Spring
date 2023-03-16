package com.human.springboot;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	
	@Autowired
	private BDAO bdao;
	
	@PostMapping("/nick")
	@ResponseBody
	public String nick(HttpServletRequest req) {
		String nick1="";
		String id=req.getParameter("name");
		
		try {
		BbsDTO nick= bdao.nick(id);
		nick1=nick.getNickname();
		System.out.println("nick    "+nick1);
		}catch(Exception e) {
			return nick1;
		}
		return nick1;
	}
	
	
	
	@PostMapping("/checklog")
	@ResponseBody
	public String docheck(HttpServletRequest req) {
		String guide="유효한 아이디 입니다.";
		String id=req.getParameter("name");
		ArrayList<MDTO> users = bdao.getUsers();
		for(int i=0;i<users.size();i++) {
			if(users.get(i).memberId.equals(id)) {
				
				guide = "아이디가 중복됩니다.";
	
			}
		}
		return guide;
	}
	
	
	
	@GetMapping("/list")
	public String doListMenu(/*Model model*/) {
		//ArrayList<BbsDTO> alMenu = bdao.bbslist();
		//model.addAttribute("menus",alMenu);
		return "list";
	}
	
	@GetMapping("/getList")
	@ResponseBody
	public String doGetList() {
		ArrayList<BbsDTO> alList = bdao.bbslist();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alList.size(); i++) {
			System.out.println(alList.get(i));
			System.out.println(alList.get(i).getSegno());
			JSONObject jo = new JSONObject();
			jo.put("segno", alList.get(i).getSegno());
			jo.put("title", alList.get(i).getTitle());
			jo.put("content", alList.get(i).getContent());
			jo.put("created", alList.get(i).getCreated());
			jo.put("updated", alList.get(i).getUpdated());
			jo.put("readcount", alList.get(i).getReadcount());
			jo.put("writer", alList.get(i).getWriter());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	
	@GetMapping("/new")
	public String doView() {
		
		return "new";
	}
	@GetMapping("/view")
	public String showView() {
		
		return "view";
	}
	@PostMapping("/update")
	public String goupdate(HttpServletRequest req,Model model) {
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		model.addAttribute("sequen",req.getParameter("seq"));
		model.addAttribute("title",title);
		model.addAttribute("content",content);
		return "update";
	}
	@PostMapping("/updatePost")
	public String doupdate(HttpServletRequest req,Model model) {
		int sq=Integer.parseInt(req.getParameter("seq"));
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		bdao.updatecontent(title,content,sq);
		return "redirect:/list";
	}
	
	
	@GetMapping("/view/{bid}")
	public String getWorker(@PathVariable("bid") int bid,
							Model model) {
		
		
	    bdao.addCount(bid);
	    model.addAttribute("one",bdao.getBbs(bid));
		return "view";
	}
	
	@GetMapping("/del/{bid}")
	public String delete(@PathVariable("bid")int bid, 
			Model model) {
		bdao.deletcontent(bid);
		
		
		return "redirect:/list";
	}
	@PostMapping("/AddContent")
	public String addNew(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content=req.getParameter("content");
		HttpSession session = req.getSession();
		String writer=(String)session.getAttribute("userid");
		BbsDTO nick= bdao.nick(writer);
		String nick1=nick.getNickname();
		bdao.addcontent(title,content,nick1);
		
		return "redirect:/list";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@GetMapping("/sign")
	public String sign() {
		
		return "sign";
	}

	@PostMapping("/doLogin") //로그인
	public String doLogin(HttpServletRequest req, Model model) {
		
		String id = req.getParameter("username");
		String ps = req.getParameter("password");
		
		ArrayList<MDTO> users = bdao.getUsers();
		
		System.out.println(id);
		System.out.println(ps);
		for(int i=0;i<users.size();i++) {
			if(users.get(i).memberId.equals(id) 
			&& users.get(i).memberPass.equals(ps)) {
				HttpSession session = req.getSession();
				session.setAttribute("userid", id);
				return "redirect:/list";
			}
		}
		String guide = "<script>alert('아이디나 비밀번호가 옳지 않습니다')</script>";
		model.addAttribute("guide", guide);
		return "login";
	}
	
	@PostMapping("/doSign") //회원가입
	public String dosign(HttpServletRequest req, Model model) {
		
		String id = req.getParameter("username");
		String ps = req.getParameter("password");
		String em = req.getParameter("email");
		String inter = req.getParameter("interb").substring(1);
		String rMale = req.getParameter("rMale");
		String nick= req.getParameter("nick");
		System.out.println(inter);
		System.out.println(rMale);
		
		ArrayList<MDTO> users = bdao.getUsers();
		
		System.out.println(id);
		System.out.println(ps);
		for(int i=0;i<users.size();i++) {
			if(users.get(i).memberId.equals(id)) {
				
				
				return "sign";
			}
		}
		bdao.signin(id, ps, em, inter, rMale, nick);
		return "redirect:/login";
	}
	
	@GetMapping("/logout/")
	public String delete(HttpServletRequest req) {
	
		HttpSession sinfo = req.getSession();
		sinfo.invalidate();
		
		return "redirect:/list";
	}
	
//-----------------------------------------------------------------------------------------
	
	@GetMapping("/menu")
	public String Menu(/*Model model*/) {
		//ArrayList<BbsDTO> alMenu = bdao.bbslist();
		//model.addAttribute("menus",alMenu);
		return "cafe/menu";
	}
	
	@PostMapping("/menu_select")
	@ResponseBody
	public String doSelect() {
		ArrayList<menuDTO> mdto = bdao.menu_select();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<mdto.size(); i++) {
			JSONObject jo = new JSONObject();
			menuDTO mo=new menuDTO();
			mo=mdto.get(i);
			jo.put("s_no", mo.getS_no());
			jo.put("name", mo.getMenu());
			jo.put("price", mo.getPrice());
			
			ja.put(jo);
		}
		return ja.toString();
	}
	@PostMapping("/menu_insert")
	@ResponseBody
	public String doInsert(HttpServletRequest req) {
		String retval="ok";
		System.out.println(req.getParameter(1+"name"));
		System.out.println(req.getParameter("price"));
//		try {
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		bdao.menu_insert(name,price);

//		} catch(Exception e) {
//			retval= "fail";
//		}
		System.out.println(retval);
		return retval;
		
	}
	@PostMapping("/menu_delete")
	@ResponseBody
	public String doDelete(HttpServletRequest req) {

		String retval="ok";
		try {
		int s_no=Integer.parseInt(req.getParameter("s_no"));
		System.out.println(s_no);
		bdao.menu_delete(s_no);
		} catch(Exception e) {
			retval= "fail";
		}
	
		return retval;
		
	}
	
	@PostMapping("/menu_update")
	@ResponseBody
	public String doUpdate(HttpServletRequest req) {
		String retval="ok";
		System.out.println(2+req.getParameter("name"));
		System.out.println(req.getParameter("price"));
		try {
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		int s_no=Integer.parseInt(req.getParameter("s_no")); 
		menuDTO mdto = bdao.menu_select_check(s_no);
		if(name.equals(mdto.getMenu())&&req.getParameter("price").equals(""+mdto.getPrice())) {
			retval= "fail";
		}
		System.out.println(mdto.getMenu());
		System.out.println(mdto.getPrice());
		bdao.menu_update(name,price,s_no);

		} catch(Exception e) {
			retval= "fail";
		}
		System.out.println(retval);
		return retval;
		
	}
	@GetMapping("/cafe")
	public String Cafe() {

		return "cafe/cafe";
	}
	
	//name:menuName,price:menuPrice,qty:menuQuantity
	@PostMapping("/menu_comple")
	@ResponseBody
	public String doComle(HttpServletRequest req) {
		String retval="ok";
		System.out.println("hi");
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("price"));
		System.out.println(req.getParameter("qty"));
		
//		try {
		String name=req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		String num=req.getParameter("num");
		String timestem=req.getParameter("timest");
		bdao.menu_comple(name,price,qty,num,timestem);

//		} catch(Exception e) {
//			retval= "fail";
//		}
		System.out.println(retval);
		return retval;
		
	}
	
	@PostMapping("/cafe_select")
	@ResponseBody
	public String doCafeSelect() {
		ArrayList<cafeDTO>  cdto = bdao.cafe_select();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<cdto.size(); i++) {
			JSONObject jo = new JSONObject();
			cafeDTO mo=new cafeDTO();
			mo=cdto.get(i);
			jo.put("created", mo.getCreated());
			jo.put("name", mo.getMenu_name());
			jo.put("price", mo.getPrice());
			jo.put("mobile", mo.getMobile());
			jo.put("gty", mo.getGty());

			
			ja.put(jo);
		}
		return ja.toString();
	}
	
	
	
	
}
