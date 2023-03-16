<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
      /* 스타일링 */
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
      }
      .signup-box {
        max-width: 360px;
        margin: 100px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }
      .signup-box h1 {
        font-size: 24px;
        text-align: center;
        margin-bottom: 30px;
      }
      .signup-box label {
        display: block;
        margin-bottom: 10px;
        font-size: 16px;
        font-weight: bold;
      }
      
      .signup-box input[type="text"],
      .signup-box input[type="email"],
      .signup-box input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 3px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
      }
      .add-link{
      background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.2s;
        text-decoration: none;

        
        }
      .signup-box input[type="submit"] {
        background-color: #4CAF50;
        height: 37px;
        color: #fff;
        padding: 7px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.2s;
      }
      
      .signup-box input[type="submit"]:hover {
        background-color: #3e8e41;
      }
      		table {
			border-collapse: collapse;
			margin: 20px auto;
			font-size: 16px;
			width: 80%;
			text-align: center;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
		}
		th, td {
			padding: 10px;
			border-bottom: 1px solid #ddd;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		input[type="checkbox"] {
			transform: scale(1.5);
			margin-right: 5px;
		}
		td{
			font-weight: bold;
		}
		h1 {
			text-align: center;
			margin: 50px 0;
			font-size: 36px;
			color: #333;
			text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
		}
    </style>
  </head>
  <body>
    <div class="signup-box">
      <h1>회원가입</h1>
      <form action='doSign' method='post' id=frmSignin>
        <label for="username">아이디</label>
        <input type="text" id="username" name="username" >
        <label for="email">이메일</label>
        <input type="email" id="email" name="email">
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password">
        <label for="confirm-password">비밀번호 확인</label>
        <input type="password" id="confirm-password" name="confirm-password">
        <label for="nick">닉네임</label>
        <input type="text" id="nick" name="nick">
        <label for="gender">성별</label>
        <input type="radio" id="rMale" name="rMale" value="남성">남성</in ><input type="radio" id="rFemale" name="rMale" value="여성">여성
        <br>
        <br>
        <br>
        <label for="inter">관심분야</label>
        <table>
		<tr>
			<td><input type="checkbox" name="interest" value="정치">정치</td>
			<td><input type="checkbox" name="interest" value="경제">경제</td>
			<td><input type="checkbox" name="interest" value="사회">사회</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="interest" value="문화">문화</td>
			<td><input type="checkbox" name="interest" value="종교">종교</td>
			<td><input type="checkbox" name="interest" value="스포츠">스포츠</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="interest" value="제테크">제테크</td>
			<td><input type="checkbox" name="interest" value="IT">IT</td>
			<td><input type="checkbox" name="interest" value="연예">연예</td>
			
		</tr>
	</table>
			<input type="text" id="interb" name="interb">
		<br>
		<br>
        <input type="submit" value="가입">
        <a class="add-link" href='/list'>취소</a>
      </form>
    </div>
    ${guide}
  </body>
  <script src='https://code.jquery.com/jquery-latest.js'></script>

<script>
$(document)
.on('blur','#username',function(){

	$.ajax({url:'/checklog',type:'post',data:{name:$('#username').val()},dataType:'text',
		beforeSend:function(){
		
		},
		success:function(data){
			if($('#username').val()==''||$('#username').val()==null){
				alert("아이디를 입력하세요");
			}else{
			alert(data);
				
			}
		}})
	
	
	
})


		
		
.on('submit','#frmSignin',function(){
	if($('input[name=password]').val()!=$('input[name=confirm-password]').val()){
		alert('비밀번호와 비밀번호 확인이 서로 다릅니다.');
		return false; //submit을 중단
	}
	if($('#username').val()==''||$('#username').val()==null){
		alert("아이디를 입력하세요");
		return false;
	}
	
	
	return true;// submit계속진행(데이트를 컨트롤러에 전송)
})
.on('click','[name=interest]',function(){
        str='';
        for(i=0; i<$('[name=interest]').length; i++){
            let ptr = '[name=interest]:eq('+i+')';
            if($(ptr).prop('checked')){
               str+=','+ $(ptr).val();
            }
        }
        $('#interb').val(str)
        
    })
</script>
</html>