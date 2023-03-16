<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>게시판 예제</title>
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }
      th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
      }
      th {
        background-color: #f2f2f2;
      }
      tr:hover {
        background-color: #f5f5f5;
      }
      .add-link {
		  display: block;
		  text-align: center;
		  margin-top: 10px;
		  background-color: #4CAF50;
		  color: white;
		  font-size: 16px;
		  padding: 10px 20px;
		  border-radius: 5px;
		  text-decoration: none;
		  transition: background-color 0.3s;
		  
		  /* 수정된 부분 */
		  max-width: 100px; /* 버튼의 최대 너비를 200px로 제한 */
		  margin: 0 auto; /* 가운데 정렬을 위해 margin을 수정 */
		}
		.add-link2 {
		  display: block;
		  text-align: center;
		  margin-top: 10px;
		  background-color: #4CAF50;
		  color: white;
		  font-size: 16px;
		  padding: 10px 20px;
		  border-radius: 5px;
		  text-decoration: none;
		  transition: background-color 0.3s;

		  
		  /* 수정된 부분 */
		  max-width: 100px; /* 버튼의 최대 너비를 200px로 제한 */
		  margin-left: 1100px; /* 가운데 정렬을 위해 margin을 수정 */
		}
		
    </style>
  </head>
  <body id="#bob">
   <div id=nicknamefile></div>
    <table id="tbl">
      <thead>
        <tr>
          <th>일련번호</th>
          <th>제목</th>
          <th>작성일</th>
          <th>수정일</th>
          <th>조회수</th>
          <th>작성자</th>
        </tr>
      </thead>
      <tbody id="tblMenu">
        
        <c:forEach var="menu" items="${menus}">
        
        <tr> 
        	<td>${menu.segno}</td>
			<td>${menu.title}</td> 
			<td>${menu.created}</td> 
			<td>${menu.updated}</td>
			<td>${menu.readcount}</td> 
			<td>${menu.writer}</td>
		</tr>
		
        </c:forEach>
      </tbody>
    </table>
    <input type=hidden name=nickch id=nickch value="<%=session.getAttribute("userid") %>">
    
    
    <br>
    <div id="logO"></div>
    <div><button id="btnList">새로고침</button></div>
  </body>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document)
.ready(function() {
	$.ajax({url:'/nick',type:'post',data:{name:$('#nickch').val()},dataType:'text',
		beforeSend:function(){
		
		},
		success:function(data){
			$('#nicknamefile').append("실명: "+data);

		}})
	
	
	
	
	
	  $("#btnList").click(); // 버튼 클릭 이벤트 실행
	  let check='<%=session.getAttribute("userid") %>';

	  if(check=='null'){
	  console.log("hi");
	  console.log(check);
		  $('#tbl').before('<a href="/login" class="add-link2">로그인</a>');
			$('#tbl').before('<a href="/sign" class="add-link2">회원가입</a>');
			
	  }else{
		  $('#logO').append('<input id="logout" type="button" value="로그아웃">');
		  $('#logO').append('<a class="add-link" href="/new">새글쓰기</a>');
		  
	  }
})
.on('click','#tblMenu tr',function(){
	let s_no = $(this).find('td:eq(0)').text();
	let s_name = $(this).find('td:eq(5)').text();
	console.log(s_name);
	document.location = '/view/'+s_no;
})
.on('click','#logout',function(){
	document.location = '/logout/';
})
.on('click','#btnList',function(){

	$.ajax({url:'/getList',type:'get',data:{},dataType:'json',
		beforeSend:function(){

		},
		success:function(data){
			$('#tblMenu tr').remove();
			for(let i=0; i<data.length; i++){
				let str='<tr>';
				str+='<td>'+data[i]['segno']+'</td>';
				str+='<td>'+data[i]['title']+'</td>';
				str+='<td>'+data[i]['created']+'</td>';
				str+='<td>'+data[i]['updated']+'</td>'
				str+='<td>'+data[i]['readcount']+'</td>';
				str+='<td>'+data[i]['writer']+'</td></tr>';
				$('#tblMenu').append(str);
			}	
		}})
})
</script>
</html>