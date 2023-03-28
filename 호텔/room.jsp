<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <title>호텔객실예약관리 -객실관리</title>
</head>
<style>
    input {
        width: 200px;
        height: 30px;
    }

    button {
        width: 100px;
        height: 30px;
        font-weight: bolder;
        font-size: 1.7ch;
    }

    .typebutton {
        width: 110px;
        background-color: crimson;
        color: aliceblue;
    }
</style>

<body style="background-color: rgb(11, 12, 11); color: aliceblue;">
    <table align="center">
        <tr>
            <td style="width: 33%;">객실관리&nbsp;<a href="/book">예약관리</a></td>
            <td style="width: 33%;">
                <h1 style="text-align: center; font-size: 50px; ">호텔객실예약관리</h1>
            </td>
            <td align="right" valign="top">Created by 김준하<br>
                @CopRight free</td>
        <tr>
        <tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        </tr>
        </tr>
        </tr>
    </table>
    <table style="height: 600px;" align="center" border="1">
        <tc>
            <tr valign="top">


                <td rowspan="6">
                    <tc colspan="3">
                        <table border="1">
                            <tr>
                                <td>
                                    <select id="roomdb" size="20" style="width: 240px; font-size: 2ch;">

                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 150px;">
                                <td valign="middle" align="center"><button class="typebutton" id="typebutton">객실타입관리</button>&nbsp;</td>
                            </tr>
                        </table>

                    </tc>
                </td>
                <td rowspan="6">
                    <tc colspan="3">


                    </tc>
                </td>



        </tc>
        <tc>
            <td style="font-size: 2ch; font-weight: bolder;">
                <input type=number id="seq_room" name="seq_room" style="width: 120px;">
                &nbsp;&nbsp;객실번호&nbsp;&nbsp;<input type=number id="roomnum" name="name" style="width: 120px;">
            </td>
            <tr valign="top">
                <td style="font-size: 2ch; font-weight: bolder;">
                    &nbsp;&nbsp;객실명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text id="roomname" name="name" style="width: 120px;">
                </td>
            </tr>
            <tr valign="top">
                <td style="font-size: 2ch; font-weight: bolder;">
                    &nbsp;&nbsp;객실타입&nbsp;&nbsp;
                    <select id="roombo" size="1" style="width: 130px; height: 30px;">

                    </select><br>
                </td>
            </tr>
            <tr valign="top">
                <td style="font-size: 2ch; font-weight: bolder;">
                    &nbsp;&nbsp;숙박인원&nbsp;&nbsp;<input type=number id="roomperson" name="name" style="width: 120px;">명
                </td>
            </tr>
            <tr valign="top">
                <td style="font-size: 2ch; font-weight: bolder;">
                    &nbsp;&nbsp;1박요금&nbsp;&nbsp;&nbsp;<input type=number id="roomprice" name="name" style="width: 120px;">원
                </td>
            </tr>

            <tr align="center" valign="top">
                <td colspan="">
                    <button id="roombtnS">추가</button>&nbsp;
                    <button id="roombtnR">삭제</button>&nbsp;
                    <button id="roombtnO">비우기</button></td>&nbsp;
            </tr>

        </tc>


        </tr>
    </table>
    <!---------------------------------------------------------- 객실타입관리 -->

    <div id="typeDlg" style="display: none;">
        <input type=hidden id="checknumber">
        <table style="height: 600px;" align="center">
            <tc>
                <tr>
                    <td rowspan="3">
                        <tc colspan="3">
                            <select size="20" style="width: 240px; font-size: 2ch;" id="box">

                            </select>
                        </tc>
                    </td>
            </tc>
            <tc>
                <td valign="bottom" style="font-size: 3ch; font-weight: bolder;">

                    &nbsp;&nbsp;객실타입번호&nbsp;<input type=text id="num" name="number" readonly><br><br>
                </td>
                <tr>
                    <td valign="top" style="font-size: 3ch;  font-weight: bolder;">
                        &nbsp;&nbsp;객실타입명&nbsp;&nbsp;&nbsp;&nbsp;<input type=text id="name" name="name">
                    </td>
                </tr>

                <tr align="center" valign="top">
                    <td colspan="3">
                        <button id="btnS">추가</button>&nbsp;
                        <button id="btnR">삭제</button>&nbsp;
                        <button id="btnO">취소</button>&nbsp;
                    </td>
                </tr>


            </tc>
            </tr>
        </table>
        <div id="alertDlg" style="size: 70; display: none; background-color: red; color: rgb(13, 14, 13);border: 1 solid white;">
            <label id="lblMessage"></label>
            <!-- <button id="btnClose">닫기</button> -->
        </div>
    </div>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
    $(document)
        .ready(function() {
            showRoom();
            showType();
        })

        .on('click', '#btnS', function() {

            if ($('#checknumber').val() != '') {
                $.ajax({
                    url: '/UpdateType',
                    type: 'post',
                    data: {
                        name: $('#name').val(),
                        number: $('#num').val()
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#name').val());
                        if (name == '' || name == null) {
                            alert('객실이름을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }

                    },
                    success: function(data) {
                        if (data == "ok") {
                            alert("업데이트성공")
                            showType();
                        } else {
                            alert("업데이트실패")
                        }
                        $('#btnO').trigger('click');
                    }
                })

            } else {
                $.ajax({
                    url: '/InsertType',
                    type: 'post',
                    data: {
                        name: $('#name').val()
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#name').val());
                        if (name == '' || name == null) {
                            alert('객실이름을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }

                    },
                    success: function(data) {
                        if (data == "ok") {
                            showType();
                        } else {
                            alert("타입번호가 이미있습니다.")
                        }
                        $('#btnO').trigger('click');
                    }
                })
            }
        })

        .on('click', '#btnR', function() {
            if (!confirm('정말로 지우시겠습니까?')) return false;
            $.ajax({
                url: '/DeleteType',
                type: 'post',
                data: {
                    s_no: $('#num').val()
                },
                dataType: 'text',
                beforeSend: function() {
                    if ($('#num').val() == '') {
                        alert('선택하세요');
                        return false; //AJAX호출을 시작도 안함
                    }
                },
                success: function(data) {
                    if (data == "ok") {
                        showType();
                        $('#btnO').trigger('click');
                    } else {
                        alert("delete 실패")
                    }
                }
            })
        })



        //객실관리  
        .on('click', '#roombtnS', function() {
            id = $('#roomname').val();
            ps = $('#roomnum').val();
            person = $('#roomperson').val();
            price = $('#roomprice').val();



            type = $('#roombo option:selected').text();
            let y = type.split(".");
            typenum = y[0]

            console.log(id);
            console.log(ps);
            console.log(type);
            console.log(person);
            console.log(price);
            console.log(typenum);
            console.log($('#seq_room').val());

            if ($('#seq_room').val() != '') {
                $.ajax({
                    url: '/UpdateRoom',
                    type: 'post',
                    data: {
                        roomnum: ps,
                        roomname: id,
                        typenum: typenum,
                        roomperson: person,
                        roomprice: price,
                        seq_room: $('#seq_room').val()
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#roomname').val());
                        if (name == '' || name == null) {
                            alert('객실이름을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }
                    },
                    success: function(data) {
                        if (data == "ok") {
                            showRoom();
                        } else {
                            alert("update 실패.")
                        }
                        $('#roombtnO').trigger('click');
                    }
                })
            } else {
                $.ajax({
                    url: '/InsertRoom',
                    type: 'post',
                    data: {
                        roomnum: ps,
                        roomname: id,
                        typenum: typenum,
                        roomperson: person,
                        roomprice: price
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#roomname').val());
                        if (name == '' || name == null) {
                            alert('객실이름을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }
                        if ($('#roomnum').val() == '') {
                            alert('객실번호를 입력하시오');
                            return false;
                        }
                    },
                    success: function(data) {
                        if (data == "ok") {
                            showRoom();
                        } else {
                            alert("객실번호가 이미있습니다.")
                        }
                        $('#roombtnO').trigger('click');
                    }
                })



            }


        })







        .on('click', '#realroombox option:selected', function() {
            str = $(roombox).text();
            console.log(str);
            $('#roomname').val(str);
            $('#roomnum').val($(roombox).val());
            $('#roomperson').val('');
            $('#roomprice').val('');
        })

        .on('click', '#roomdb option:selected', function() {

            $.ajax({
                url: '/selectRoomCh',
                type: 'post',
                data: {
                    room_seq: $(this).val()
                },
                dataType: 'json',
                beforeSend: function() {},
                success: function(data) {

                    $('#roomname').val(data[1]);
                    $('#roomnum').val(data[0]);
                    $('#roomperson').val(data[3]);
                    $('#roomprice').val(data[4]);
                    $('#roombo').val(data[2]);
                    $('#seq_room').val(data[5]);

                }
            })


        })

        // .on('change','#roombo',function(){
        //     strr=$("#roombo option:selected").text();
        //     console.log(strr);
        // })
        .on('click', '#roombtnR', function() {
            if (!confirm('정말로 지우시겠습니까?')) return false;
            $.ajax({
                url: '/DeleteRoom',
                type: 'post',
                data: {
                    s_no: $('#seq_room').val()
                },
                dataType: 'text',
                beforeSend: function() {
                    if ($('#seq_room').val() == '') {
                        alert('선택하세요');
                        return false; //AJAX호출을 시작도 안함
                    }
                },
                success: function(data) {
                    if (data == "ok") {
                        showRoom();
                        $('#roombtnO').trigger('click');
                    } else {
                        alert("delete 실패")
                    }
                }
            })



        })
        .on('click', '#roombtnO', function() {
            id = $('#roomnum').val('');
            ps = $('#roomname').val('');
            $('#roomperson').val('');
            $('#roomprice').val('');
            $('#seq_room').val('');

        })


        //////////////////////////////////////////////////객실타입


        .on('click', '#btnO', function() {
            id = $('#num').val('');
            ps = $('#name').val('');
            $('#checknumber').val('');

        })
        .on('click', '#roombox', function() {
            typename = $(this).text();
            typenamear = typename.split('.');
            $('#num').prop('readonly', true);
            $('#name').val(typenamear[1]);
            $('#num').val($(this).val());
            $('#checknumber').val($(this).val());
        })
        .on('click', '#typebutton', function() {
            $('#typeDlg').dialog({
                beforeClose: function() {
                    // (1) selRoomType empty
                    // (2) selTtpe => selRoomType

                    // $('#roomname').val($('#name').val());
                    // $('#roomnum').val($('#num').val());
                    $('#roomperson').val('');
                    $('#roomprice').val('');

                },

                title: '객실타입관리',
                modal: true,
                width: 700
            });
        })
    // $(window)
    // .unload(function(){
    //     console.log('hi')
    // })
    // .on('click','#btnClose',function(){
    //     $('#alertDlg').dialog('close');
    // })
    function showDlg(str) {
        $('#lblMessage').text(str);
        $('#alertDlg').dialog({
            'title': '알림창',
            'position': {
                'my': "left bottom",
                at: "left top",
                of: $('#num')
            },
            modal: true,
            buttons: [{
                    text: 'OK',
                    click: function() {
                        $(this).dialog('close');
                    }
                },
                {
                    text: 'Close',
                    click: function() {
                        alert('안닫힘');
                    }
                }
            ],

        });


    }

    function showType() {
        $.ajax({
            url: '/selectType',
            type: 'post',
            data: {},
            dataType: 'json',
            beforeSend: function() {},
            success: function(data) {
                $('#roombo option').remove();
                $('#box option').remove();
                for (let i = 0; i < data.length; i++) {
                    name1 = '<option id="roombox" name="' + data[i]['segno'] + '" value="' + data[i]['segno'] + '"">' + data[i]['segno'] + '.' + data[i]['name'] + '</option>';
                    name = '<option id="roombox" name="' + data[i]['segno'] + '" value="' + data[i]['segno'] + '"">' + data[i]['segno'] + '.' + data[i]['name'] + '</option>';
                    $('#box').append(name1);
                    $('#roombo').append(name);
                }
            }
        })
    }

    function showRoom() {
        $.ajax({
            url: '/selectRoom',
            type: 'post',
            data: {},
            dataType: 'json',
            beforeSend: function() {},
            success: function(data) {
                $('#roomdb option').remove();

                for (let i = 0; i < data.length; i++) {

                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > 객실번호: ' + data[i]['roomnum'] + '</option>');
                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > 객실명: ' + data[i]['roomname'] + '</option>');
                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > 타입: ' + data[i]['typenum'] + '</option>');
                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > 숙박인원: ' + data[i]['person'] + '</option>');
                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > 1박요금: ' + data[i]['fee'] + '</option>');
                    $('#roomdb').append('<option value="' + data[i]['room_seq'] + '"" > </option>');

                }
            }
        })
    }
</script>

</html>