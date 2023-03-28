<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<c:forEach items="${employees}" var="worker">
   <tr><td>${worker.employee_id}</td>
      <td>${worker.emp_name}</td>
      <td>${worker.manager_id}</td></tr>
</c:forEach>
</table>
<br><br><br>
ajax
<table id=tblFind border=1>
   <tr><th>사번</th>
      <th>직원명</th>
      <th>매니저id</th></tr>

</table>
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
   $.ajax({url:'/empList',type:'post',dataType:'json',
      data:{},
      success:function(data){
         $('#tblFind tr:gt(0)').empty();
      for(i=0; i<data.length; i++){
         let str ='<tr>';
         str+='<td>'+data[i]['employee_id']+'</td>';
         str+='<td>'+data[i]['emp_name']+'</td>';
         str+='<td>'+data[i]['manager_id']+'</td></tr>';
         $('#tblFind').append(str);
      }   
   }})
   
})

</script>
</html>