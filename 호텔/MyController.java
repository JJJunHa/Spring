package com.human.springboot;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {

    @Autowired
    private TDAO tdao;


    @GetMapping("/list")
    public String showList() {
        return "list";
    }
    @PostMapping("/empList")
    @ResponseBody
    public String doList() {
        ArrayList < empDTO > alEmp = tdao.getEMP();
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alEmp.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("employee_id", alEmp.get(i).getEmployee_id());
            jo.put("emp_name", alEmp.get(i).getEmp_name());
            jo.put("manager_id", alEmp.get(i).getManager_id());
            ja.put(jo);
        }
        return ja.toString();
    }

    @GetMapping("/insert")
    public String insert() {
        return "insert";
    }

    @PostMapping("doInsert")
    public String doInsert(HttpServletRequest req) {
        String userid = req.getParameter("name");
        String pwd = req.getParameter("price");

        tdao.insert(userid, Integer.parseInt(pwd));

        return "redirect:/insert";
    }



    @GetMapping("/room")
    public String showRoom() {
        return "room";
    }
    @GetMapping("/book")
    public String showBook() {
        return "book";
    }

    @PostMapping("/selectType") //--------------------------------SelectType 
    @ResponseBody
    public String selectType() {
        ArrayList < typeDTO > alList = tdao.typelist();
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("segno", alList.get(i).getTypenumber());
            jo.put("name", alList.get(i).getTypename());


            ja.put(jo);
        }
        return ja.toString();
    }

    @PostMapping("/InsertType")
    @ResponseBody
    public String InsertType(HttpServletRequest req) {
        String retval = "ok";
        String name = req.getParameter("name");



        tdao.type_insert(name);

        return retval;

    }
    @PostMapping("/DeleteType")
    @ResponseBody
    public String doDelete(HttpServletRequest req) {

        String retval = "ok";
        try {
            int s_no = Integer.parseInt(req.getParameter("s_no"));
            tdao.type_delete(s_no);
        } catch (Exception e) {
            retval = "fail";
        }

        return retval;

    }

    @PostMapping("/UpdateType")
    @ResponseBody
    public String doUpdate(HttpServletRequest req) {
        String retval = "ok";
        //			try {
        String name = req.getParameter("name");

        int s_no = Integer.parseInt(req.getParameter("number"));




        tdao.type_update(name, s_no);

        //			} catch(Exception e) {
        //				retval= "fail";
        //			}
        return retval;

    }
    //-------------------------------------------------------------------------------------room
    @PostMapping("/InsertRoom")
    @ResponseBody
    public String InsertRoom(HttpServletRequest req) {
        String retval = "ok";
        String name = req.getParameter("roomname");
        int number = Integer.parseInt(req.getParameter("roomnum"));
        int type = Integer.parseInt(req.getParameter("typenum"));
        int person = Integer.parseInt(req.getParameter("roomperson"));
        int price = Integer.parseInt(req.getParameter("roomprice"));


        tdao.room_insert(number, type, name, person, price);

        return retval;

    }

    @PostMapping("/selectRoom") //--------------------------------SelectRoom 
    @ResponseBody
    public String selectRoom() {
        ArrayList < roomDTO > alList = tdao.roomlist();
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("typenum", alList.get(i).getTypenumber());
            jo.put("roomname", alList.get(i).getRoomname());
            jo.put("roomnum", alList.get(i).getRoomnumber());
            jo.put("person", alList.get(i).getPersonnel());
            jo.put("fee", alList.get(i).getFee());
            jo.put("room_seq", alList.get(i).getRoom_seq());


            ja.put(jo);
        }
        return ja.toString();
    }

    @PostMapping("/selectRoomCh") //--------------------------------SelectType 
    @ResponseBody
    public String selectRoomCh(HttpServletRequest req) {
        int number = Integer.parseInt(req.getParameter("room_seq"));
        roomDTO alList = tdao.roomlistCh(number);
        JSONArray ja = new JSONArray();

        ja.put(alList.getRoomnumber());
        ja.put(alList.getRoomname());
        ja.put(alList.getTypenumber());
        ja.put(alList.getPersonnel());
        ja.put(alList.getFee());
        ja.put(alList.getRoom_seq());
        ja.put(alList.getTypename());


        return ja.toString();
    }

    @PostMapping("/DeleteRoom")
    @ResponseBody
    public String doDeleteRoom(HttpServletRequest req) {

        String retval = "ok";
        try {
            int s_no = Integer.parseInt(req.getParameter("s_no"));
            tdao.room_delete(s_no);
        } catch (Exception e) {
            retval = "fail";
        }

        return retval;

    }

    @PostMapping("/UpdateRoom")
    @ResponseBody
    public String doUpdateRoom(HttpServletRequest req) {
        String retval = "ok";
        String name = req.getParameter("roomname");
        int number = Integer.parseInt(req.getParameter("roomnum"));
        int type = Integer.parseInt(req.getParameter("typenum"));
        int person = Integer.parseInt(req.getParameter("roomperson"));
        int price = Integer.parseInt(req.getParameter("roomprice"));
        int seq_room = Integer.parseInt(req.getParameter("seq_room"));




        tdao.room_update(number, type, name, person, price, seq_room);

        //			} catch(Exception e) {
        //				retval= "fail";
        //			}
        return retval;

    }
    //--------------------------------------------------------------------------------------book



    @PostMapping("/typelistCh") //--------------------------------SelectType 
    @ResponseBody
    public String selectTypelistCh(HttpServletRequest req) {
        int number = Integer.parseInt(req.getParameter("typemnum"));

        typeDTO alList = tdao.typelistCh(number);

        return alList.getTypename().toString();
    }


    @PostMapping("/selectBook") //--------------------------------SelectRoom 
    @ResponseBody
    public String selectBook() {
        ArrayList < bookDTO > alList = tdao.booklist();
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alList.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("ROOMNUMBER", alList.get(i).getROOMNUMBER());
            jo.put("CHECKIN", alList.get(i).getCHECKIN());
            jo.put("CHECKOUT", alList.get(i).getCHECKOUT());
            jo.put("PERSONNEL", alList.get(i).getPERSONNEL());
            jo.put("TOTALFEE", alList.get(i).getTOTALFEE());
            jo.put("REPRESENTATIVE", alList.get(i).getREPRESENTATIVE());
            jo.put("MOBILE", alList.get(i).getMOBILE());
            jo.put("BOOK_SEQ", alList.get(i).getBOOK_SEQ());
            jo.put("typename", alList.get(i).getTypename());
            jo.put("roomname", alList.get(i).getRoomname());


            ja.put(jo);
        }
        return ja.toString();
    }

    @PostMapping("/InsertBook")
    @ResponseBody
    public String InsertBook(HttpServletRequest req) {
        String retval = "ok";
        String chein = req.getParameter("chein");
        String cheo = req.getParameter("cheo");
        int roomnumber = Integer.parseInt(req.getParameter("roomnum"));
        int person = Integer.parseInt(req.getParameter("person"));
        int totalprice = Integer.parseInt(req.getParameter("totalprice"));
        String rep = req.getParameter("rep");
        String pohn = req.getParameter("pohn");

        System.out.println(chein);
        System.out.println(cheo);


        tdao.book_insert(chein, cheo, roomnumber, person, totalprice, rep, pohn);

        return retval;

    }

    @PostMapping("/UpdateBook")
    @ResponseBody
    public String UpdateBook(HttpServletRequest req) {
        String retval = "ok";
        String chein = req.getParameter("chein");
        String cheo = req.getParameter("cheo");
        int roomnumber = Integer.parseInt(req.getParameter("roomnum"));
        int person = Integer.parseInt(req.getParameter("person"));
        int totalprice = Integer.parseInt(req.getParameter("totalprice"));
        String rep = req.getParameter("rep");
        String pohn = req.getParameter("pohn");
        int book_sq = Integer.parseInt(req.getParameter("booksq"));
        System.out.println(chein);
        System.out.println(cheo);


        tdao.book_update(chein, cheo, roomnumber, person, totalprice, rep, pohn, book_sq);

        return retval;

    }

    @PostMapping("/DeleteBook")
    @ResponseBody
    public String DeleteBook(HttpServletRequest req) {

        String retval = "ok";
        try {
            int s_no = Integer.parseInt(req.getParameter("s_no"));
            tdao.book_delete(s_no);
        } catch (Exception e) {
            retval = "fail";
        }

        return retval;

    }

    @PostMapping("/selectRoomUp") //--------------------------------SelectRoom 
    @ResponseBody
    public String selectRoomUp(HttpServletRequest req) {

        ArrayList < roomDTO > alList = tdao.roomlistUp(req.getParameter("chein"), req.getParameter("cheo"));
        System.out.println("chei " + req.getParameter("chein"));
        System.out.println("cheo " + req.getParameter("cheo"));
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alList.size(); i++) {
            JSONObject jo = new JSONObject();

            jo.put("roomname", alList.get(i).getRoomname());
            jo.put("room_seq", alList.get(i).getRoom_seq());


            ja.put(jo);
        }
        return ja.toString();
    }


}
