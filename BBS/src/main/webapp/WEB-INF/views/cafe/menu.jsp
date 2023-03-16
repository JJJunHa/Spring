<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 스타일 시트 적용 */
body {
  background-color: lightgray;
}
table {
  width: 50%;
  margin: auto;
  border-collapse: collapse;
  border: 2px solid black;
}
th, td {
  padding: 8px;
  text-align: center;
  border: 1px solid black;
}
th {
  background-color: #4CAF50;
  color: white;
}
tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>
<body>
<table id="tblMenu">
  <tr>
    <th>번호</th>
    <th>메뉴명</th>
    <th>가격</th>
  </tr>
  </table>
  <table>
<tr><td>메뉴명</td><td><input type=text id=name></td></tr>
<tr><td>가격</td><td><input type=number id=price></td></tr>
    <tr><td><input type=number id=s_no></td></tr>
<tr><td colspan=2 align=center>

	<button id=btnAdd>등록</button>
	<button id=btnDel>삭제</button>
	<button id=btnEmty>취소</button>
	<button id=btnrevice>수정</button>
	</td></tr>
	
</table>
	


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	loadData();
})
.on('click','#btnEmty',function(){
	$('#name').val('');
	$('#price').val('');
	$('#s_no').val('');
})
.on('click','#tblMenu tr',function(){
	let s_no = $(this).find('td:eq(0)').text();
	let name = $(this).find('td:eq(1)').text();
	let price = $(this).find('td:eq(2)').text();
	$('#name').val(name);
	$('#price').val(price);
	$('#s_no').val(s_no);
	
})
.on('click','#btnDel',function(){
	$.ajax({url:'/menu_delete',type:'post',data:{s_no:$('#s_no').val()},dataType:'text',
		beforeSend:function(){
			console.log($('#s_no').val());
		if($('#s_no').val()==''){
			alert('선택하세요');
			 return false; //AJAX호출을 시작도 안함
		}
	},
	success:function(data){
		if(data=="ok"){
			loadData();
			$('#btnEmty').trigger('click');
		}else{
			alert("delete 실패")
		}
	}
	})
})

.on('click','#btnAdd',function(){
	if($('#s_no').val!=''){
		$.ajax({url:'/menu_update',type:'post',data:{name:$('#name').val(),price:$('#price').val(),s_no:$('#s_no').val()},dataType:'text',
			beforeSend:function(){
			let name=$.trim($('#name').val());
			if(name==''||name==null){
				alert('메뉴명을 입력하시오');
				 return false; //AJAX호출을 시작도 안함
			}
			if($('#price').val()==''){
				alert('가격을 입력하시오');
				return false;
			}
		},
		success:function(data){
			if(data=="ok"){
				loadData();
				$('#btnEmty').trigger('click');
			}else{
				alert("메뉴명과 가격이 갔습니다.")
			}
		}
		})
	}
	else{
	$.ajax({url:'/menu_insert',type:'post',data:{name:$('#name').val(),price:$('#price').val()},dataType:'text',
		beforeSend:function(){
		let name=$.trim($('#name').val());
		if(name==''||name==null){
			alert('메뉴명을 입력하시오');
			 return false; //AJAX호출을 시작도 안함
		}
		if($('#price').val()==''){
			alert('가격을 입력하시오');
			return false;
		}
	},
	success:function(data){
		if(data=="ok"){
			loadData();
			$('#btnEmty').trigger('click');
		}else{
			alert("insert 실패")
		}
	}
	})
	}
})
.on('click','#btnrevice',function(){
	$.ajax({url:'/menu_update',type:'post',data:{name:$('#name').val(),price:$('#price').val(),s_no:$('#s_no').val()},dataType:'text',
		beforeSend:function(){
		let name=$.trim($('#name').val());
		if(name==''||name==null){
			alert('메뉴명을 입력하시오');
			 return false; //AJAX호출을 시작도 안함
		}
		if($('#price').val()==''){
			alert('가격을 입력하시오');
			return false;
		}
	},
	success:function(data){
		if(data=="ok"){
			loadData();
			$('#btnEmty').trigger('click');
		}else{
			alert("메뉴명과 가격이 갔습니다.")
		}
	}
	})
})





function loadData(){
	$.ajax({url:'/menu_select',type:'post',dataType:'json',data:{},
		success:function(data){
			$('#tblMenu tr:gt(0)').remove();
			for(let i=0; i<data.length; i++){
				let menu=data[i];
				let str='<tr>';
				str+='<td>'+menu['s_no']+'</td>';
				str+='<td>'+menu['name']+'</td>';
				str+='<td>'+menu['price']+'</td></tr>';
				
				$('#tblMenu').append(str);
			}
		}})
	
}
</script>
</html>