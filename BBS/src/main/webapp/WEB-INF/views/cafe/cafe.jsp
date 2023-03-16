<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    #typeDlg {
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border: 1px solid black;
    padding: 10px;
    background-color: black;
    z-index: 9999;
  }
    body{
        font-size: 20px;
    }
    select{
        width: 120px;
        height: 200px;
        
    }
    input, button{
        font-size: 20px;
    }
    table{
        color: aliceblue;
        background-color: black;
    }
    .line{
        
        background-color: blueviolet;
    }
    button{
        background-color: rgb(243, 8, 172);
        color: aliceblue;
    }
    .hedsize{
        height: 100px;
        background-color: rgb(65, 21, 52)
    }
    .bodysize{
        width: 250px;
        background-color: rgb(243, 247, 247);
        
    }
    </style>
</head>
<body style="background-color: black;">

<div id="typeDlg" style="display: none;">

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
</div>
	<button class="typebutton" id="typebutton">메뉴관리</button>




    <table style="width: 100%; height: 880px;" align="center" border="1">
        <tr>
            <td colspan="3" style="text-align: center; color: rgb(240, 240, 248); background-color: rgb(75, 40, 201);">
                <h1>카페관리</h1></td>
        </tr>
        <tr>
            <td valign="top" align="center" class="line" valign="middle">
                <table class="line">
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr align="center" valign="middle"  class="hedsize">
                    <td colspan="2"><h3>메뉴목록</h3></td>
                </tr>
                <td colspan=2 valign="bottom">
                    <select size="11" class="bodysize" id=sele>
                    
                    </select>
                </td>
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr></tr>
                    <td>메뉴명</td><td><input type=text id="name2" name="name2" readonly style="width: 120px;"></td>
                </tr>
                <tr>
                    <td>수량</td><td><input type="number" id="qty" name="qty" style="width: 120px;" value="1">잔</td>
                </tr>
                <tr>
                    <td>가격</td><td><input type="number" id="price2" readonly style="width: 120px;">원</td>
                </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><tr><td></td></tr><tr></tr><tr><td></td></tr><tr></tr>
                <tr>
                <tr align="center">
                    <td colspan="2"><button id="btnS">주문</button>
                    <button id="btnR">지우기</button></td>
                </tr>
                </table>
           </td>
           <td valign="top" align="center" class="line">
                <table class="line">
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                    <tr align="center" class="hedsize">
                        <td colspan="2"><h3>주문내역</h3></td></tr>
                    <tr>
                        <td colspan="2" class="bodysize">
                            <select id="orderbox" size="11" class="bodysize">
                            </select>
                        </td>
                    </tr>
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <td>주문금액</td><td><input type="number" id="orderprice" readonly style=" width: 100px;">원</td>
                    </tr>
                    <tr>
                        <td>모바일번호</td><td><input type="text" id="mobile" name="mobile" style="width: 100px;"></td>
                    </tr>
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr>
                    <tr align="center">
                        <td colspan="2"><button id="btnO">주문완료</button>
                        <button id="btnC">취소</button></td>
                    </tr>
                </table>
           </td>
           <td valign="top" align="center" class="line">
                <table class="line">
                    <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                    <tr align="center" class="hedsize">
                        <td><h3>매출내역</h3></td>
                    </tr>
                        <tr>
                            <td>
                                <select  id="final" size="20" class="bodysize">
                                </select>
                            </td>
                        </tr>
                        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr>
                        <tr align="center">
                            <td>매출총액 &nbsp;&nbsp;<input type="text" id="totaldar" name="totaldar" style="width: 100px;"></td>
                        </tr>
                        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr><td></td></tr><tr><td></td></tr>
                        <tr align="center">
                            <td><button id="buttnG">새로고침</button></td>
                        </tr>
                    </table>
           </td>
           </td>
        </tr>
        <tr style="background-color: rgb(10, 2, 2); color: rgb(243, 241, 241); font-size: 2ch;">
            
            <td colspan="3" align="Right">
                Created by 김준하<br>
                @CopRight free
            </td>
        </tr>
    </table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
total=0;
totals=0;
$(document)  //(1)
.on('click','[name=menubox]',function(){
    str=$(this).text();
    ar=str.split(',');
    ar[0]=ar[0].trim();
    ar[1]=ar[1].trim();
    ar[2]=ar[2].trim();
    console.log()
    $('#name2').val(ar[1]);
    $('#price2').val(ar[2]);
}) //(2)
.on('change','#qty',function(){
    count=$('#qty').val();
    $('#price2').val(ar[2]*count);
})
.on('click','#btnR',function(){ //(3)
    $('#name2').val('');
    $('#price2').val('');
    $('#qty').val(1);
})
.on('click','#btnS',function(){//(4)
    if($('#name2').val()==''||$('#price2').val()==''||$('#qty').val()==''){
        return false;
    }
    n=' 메뉴 '+$('#name2').val();
    p=' 가격 '+$('#price2').val();
    q=' 수량 '+$('#qty').val();
    $('#orderbox').append('<option id="menuboxxx" name="menubox">'+n+p+q+'</option>');
    $('#btnR').trigger('click');
    arp=p.split('가격 ');
    arp[1]=parseInt(arp[1]);
    total=total+arp[1];
    console.log(total);
    $('#orderprice').val(total);
})
.on('click','#btnC',function(){
    $('#orderprice').val('');
    $('#mobile').val('');
    $('#totaldar').val(totals);
    while(($('#menuboxxx').length)){
    $('#menuboxxx').remove();
    }
    total=0;
})
.on('click','#btnO',function(){
    if($('#orderprice').val()==''){
        return false;
    }
    let today = new Date();
    year= today.getFullYear()+'년 ';
    month = today.getMonth()+1+'월 ';
    date = today.getDate()+'일 ';
    hour = today.getHours()+'시 ';
    minute = today.getMinutes()+'분 ';
    second = today.getSeconds()+'초 ';
    time=year+month+date+hour+minute+second
    new Date();
    t='주문금액 '+$('#orderprice').val()+'원';
    number='모바일번호 '+$('#mobile').val();
    
    $('#orderprice').val('');
    $('#mobile').val('');

    arp=t.split('주문금액 ');
    arp[1]=parseInt(arp[1]);
    totals=totals+arp[1];
    console.log(totals);
    $('#totaldar').val(totals);
    total=0;
    
    
    
    var optionCount = $("#orderbox option").length;
    console.log(optionCount); // 출력 결과: 5
    
    for(i=0; i<optionCount; i++){
    	var menuString=$("#orderbox option").eq(i).text();
    	var menuInfoArray = menuString.trim().split(' ');
    	var menuName = menuInfoArray[1];
    	var menuPrice = parseInt(menuInfoArray[3]);
    	var menuQuantity = parseInt(menuInfoArray[5]);
    	console.log(menuName); // 귤
    	console.log(menuPrice); // 3000
    	console.log(menuQuantity); // 1
    	
    	$.ajax({url:'/menu_comple',type:'post',data:{name:menuName,price:menuPrice,qty:menuQuantity,num:number,timest:time},dataType:'text',
    		beforeSend:function(){
    			let name=menuName;
    		if(name==''||name==null){
    			alert('주문내역이 없습니다. 입력하시오');
    			 return false; //AJAX호출을 시작도 안함
    		}
    	},
    	success:function(data){
    		if(data=="ok"){
    			loadData();
    		}else{
    			alert("insert 실패")
    		}
    	}
    	})
    	
    	
    }
    loadData2();
    
    $('#btnC').trigger('click');
    
    
	
	
	
	
	
    
    
})
.on('click','#buttnG',function(){
    while($('#menuboxxx').length){
    $('#menuboxxx').remove();
    }
    while($('#menuboxx').length){
        $('#menuboxx').remove();
        }
    $('#orderprice').val('');
    $('#mobile').val('');
    total=0;
    $('#totaldar').val('');
    totals=0;
})

.on('click', '#typebutton', function() {
    console.log('check');
    $('#typeDlg').dialog({
        beforeClose: function() {
            // (1) selRoomType empty
            // (2) selTtpe => selRoomType

            // $('#roomname').val($('#name').val());
            // $('#roomnum').val($('#num').val());
            $('#roomperson').val('');
            $('#roomprice').val('');
        },
        title: '메뉴관리',
        modal: true,
        width: 'auto',
        maxWidth: 5000,
        position: { my: 'center', at: 'center', of: window }
    });
})
.ready(function(){
	loadData();
	loadData2();
	
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
	if($('#s_no').val()!=''){
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
			$('#sele option').remove();
			for(let i=0; i<data.length; i++){
				let menu=data[i];
				let str='<tr>';
				str+='<td>'+menu['s_no']+'</td>';
				str+='<td>'+menu['name']+'</td>';
				str+='<td>'+menu['price']+'</td></tr>';
				sel='<option>'+menu['s_no']+', '+menu['name']+', '+menu['price']+' </option>'
				
				$('#tblMenu').append(str);
				$('#sele').append(sel);
			}
		}})
		
	
	}
	

function loadData2(){	
	$.ajax({url:'/cafe_select',type:'post',dataType:'json',data:{},
		success:function(data){
			

			$('#final option').remove();
			for(let i=0; i<data.length; i++){
				let menu=data[i];
				sel1='<option name="menubox" value="latee">'+menu['created']+'</option>'
				sel2='<option name="menubox" value="latee">'+menu['price']+'</option>'
				sel3='<option name="menubox" value="latee">'+menu['mobile']+'</option>'
			
				$('#final').append(sel1);
				$('#final').append(sel2);
				$('#final').append(sel3);
			}
		}})	
}

</script>

</html>