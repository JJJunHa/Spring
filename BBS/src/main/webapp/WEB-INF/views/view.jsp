<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>게시글 작성 예제</title>
    <style>
      label {
        display: block;
        margin-bottom: 8px;
      }
      input[type="text"],
      textarea {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: none;
      }
      input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        float: right;
      }
      input[type="submit"]:hover {
        background-color: #45a049;
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
		hidden {
  display: none;
}
    </style>
  </head>
  <body>
    <h1>게시글 확인</h1>
    <div id=nicknamefile></div>
    <form action="/update" method="post">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" value="${one.title}" readonly>
      <label for="views">조회수</label>
      <input type="text" id="views" name="views" value="${one.readcount}" readonly>
      <label for="content">내용</label>
      <textarea id="content" name="content" value="${one.content}" rows="10" readonly>${one.content}</textarea>
      <label for="created">작성일</label>
      <input type="text" id="created" value="${one.created}" name="created" readonly>
      <label for="modified">수정일</label>
      <input type="text" id="modified" value="${one.updated}" name="modified" readonly>
      
      <input type="hidden" id="writer" value="${one.writer}" name="writer" readonly>
      <div class="hidden">
      <input type="hidden"  id=seqnum value="${one.segno}" name="seq">
      <input type="hidden"  id=seqnum value="${one.segno}" name="seq">
      </div>
<input type=hidden name=nickch id=nickch value="<%=session.getAttribute("userid") %>">

      <div id=deletediv></div>
      <div><a class="add-link" href='/list'>목록보기</a></div>
    </form>
  </body>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	$.ajax({url:'/nick',type:'post',data:{name:$('#nickch').val()},dataType:'text',
		beforeSend:function(){
		
		},
		success:function(data){
			$('#nicknamefile').append('<label for="title">작성자</label>');
			$('#nicknamefile').append('<input id="de" type="text" value="'+data+'">');
			
		},
			complete:function(){
				console.log($('#de').val())
				console.log($('#writer').val())
				
					if($('#de').val()==$('#writer').val()){
					$('#deletediv').append('<input type="submit" id="del" type="button" value="삭제">');
					$('#deletediv').append('<input type="submit" value="수정">');
					}
			}
		})
		
	
	

	console.log('<%=session.getAttribute("userid") %>');
	let check='<%=session.getAttribute("userid") %>';
})
.on('click','#del',function(){
	
	let s_no = $('#seqnum').val();
	document.location = '/del/'+s_no;
	
})
</script>
</html>







