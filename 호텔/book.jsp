<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <title>호텔객실예약관리 -예약관리</title>
</head>
<style>
    body {
        background-color: rgb(5, 7, 5);
        color: aliceblue;
    }

    input {
        width: 120px;
    }

    td {
        font-weight: bolder;
    }

    button {
        width: 70px;
        height: 30px;
        font-weight: bolder;
        font-size: 1.7ch;
    }
</style>

<body>
	
    <input id="book_sq" type="text" style="width: 5pc;">
    <table align="center">
        <tr>
            <td style="width: 33%;"><a href='/room'>객실관리</a>&nbsp;예약관리</td>
            <td style="width: 33%;">
                <h1 style="text-align: center; font-size: 50px;">호텔객실예약관리</h1>
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
    <table align="center" style="width: 70%; height: 600px;">
        <td style="width: 34%;" align="center" valign="top">
            <table>
                <tr align="center">
                    <td>
                        체크인&nbsp;&nbsp;&nbsp;<input id="time" type="datetime-local">~<br>
                    </td>
                </tr>
                <tr>
                    <td>
                        체크아웃&nbsp;&nbsp;&nbsp;&nbsp;<input id="timeout" type="datetime-local"><br>
                    </td>
                </tr>
                <tr>

                </tr>
                <tr>
                    <td align="center">
                        <button size="3" id="btnR">찾기</button><br>
                    </td>

                </tr>
                <tr>
                    <td>
                        <select id="roombox" size="15" style="width: 240px; font-size: 2ch;">
                            <option value="100">백두산</option><br>
                            <option value="101">한라산</option><br>
                            <option value="102">광덕산</option><br>
                            <option value="103">태조산</option><br>
                            <option value="104">봉서산</option><br>
                        </select>
                    </td>
                </tr>


            </table>
        </td>
        <td style="width: 34%;" align="center" valign="top">
            <table>
                <tr>
                    <td>체크인<br><br></td>
                    <td><input id="chein" type="text" placeholder="체크인" style="width: 10pc;">~<br><br></td>
                </tr>
                <tr>
                    <td>체크아웃<br><br></td>
                    <td><input id="cheo" type="text" placeholder="체크아웃" style="width: 10pc;"><br><br></td>
                </tr>
                <tr>
                    <td>객실번호<br><br></td>
                    <td><input id="num" type="text" placeholder="객실번호" style="width: 5pc;"><br><br></td>
                </tr>
                <tr>
                    <td>객실시퀀스<br><br></td>
                    <td><input id="sqnum" type="text" placeholder="객실번호" style="width: 5pc;"><br><br></td>
                </tr>
                <tr>
                    <td>객실명<br><br></td>
                    <td><input id="name" placeholder="객실명" type="text"><br><br></td>
                </tr>
                <tr>
                    <td>타입명<br><br></td>
                    <td><input id="typename" placeholder="타입명" type="text"><br><br></td>
                </tr>
                <tr>
                    <td>최대숙박인원<br><br></td>
                    <td><input id="per" placeholder="선택하시오" type="text" style="width: 5pc;" readonly>명<br><br></td>
                </tr>
                <tr>
                    <td>숙박인원<br><br></td>
                    <td><input id="person" placeholder="숙박인원" type="number" style="width: 5pc;">명<br><br></td>
                </tr>
                <tr>
                    <td>대표자명<br><br></td>
                    <td><input id="rep" placeholder="대표자명" type="text" style="width: 4pc;"><br><br></td>
                </tr>
                <tr>
                    <td>연락처<br><br></td>
                    <td><input id="pohn" placeholder="연락처" type="text" style="width: 4pc;"><br><br></td>
                </tr>
                <tr>
                    <td>1박요금<br><br></td>
                    <td><input id="price" placeholder="선택하시오" type="text" readonly style="width: 5pc;">원<br><br></td>
                </tr>
                <tr>
                    <td>총숙박요금<br><br></td>
                    <td><input id="pric" placeholder="총숙박요금" type="text" style="width: 5pc;">원<br><br></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <br><br><br><br>
                        <button id="btnR">완료</button>&nbsp;&nbsp;
                        <button id="btnC">취소</button>&nbsp;&nbsp;
                        <button id="btnO">비우기</button>&nbsp;&nbsp;

                    </td>
                </tr>


            </table>
        </td>
        <td style="width: 33%;" align="center">
            <table>
                <tr>
                    <td>
                        예약된 객실목록
                    </td>
                </tr>
                <tr>
                    <td>
                        <select id="db" size="30" style="width: 240px; font-size: 2ch;">

                        </select>
                        </tc>
                    </td>
                    </tc>

            </table>
        </td>
    </table>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
    //현재 날짜 객체 생성
    var currentDate = new Date();

    // 현재 날짜 이전을 선택할 수 없도록 `min` 속성 설정
    $('#time').attr('min', currentDate.toISOString().slice(0, 16));
    $('#timeout').attr('min', currentDate.toISOString().slice(0, 16));

    // 체크인 시간은 체크아웃 시간 이전의 시간만 선택할 수 있도록 설정
    $('#time').on('change', function() {
        // 체크인 시간
        var checkin = new Date($(this).val());
        var currentDateTime = new Date($(this).val());
        // 체크아웃 시간
        var checkout = new Date($('#timeout').val());
        currentDateTime.setDate(currentDateTime.getDate() + 1);
        var outputFormat = currentDateTime.toISOString();
        // 체크인 시간 이후, 체크아웃 시간 이전의 날짜를 `min`과 `max` 속성으로 설정
        console.log($(this).val());
        console.log(outputFormat.slice(0, 16));
        $('#timeout').attr('min', outputFormat.slice(0, 16));
        if (checkin >= checkout) {
            $('#timeout').val('');
        }

        var checkin = $('#time').val();
        var checkout = $('#timeout').val();

        if (checkin && checkout) {
            showRoomUp();
        }


    });

    // 체크아웃 시간은 체크인 시간 이후의 시간만 선택할 수 있도록 설정
    $('#timeout').on('change', function() {
        // 체크인 시간
        var checkin = new Date($('#time').val());
        // 체크아웃 시간
        var currentDateTime = new Date($(this).val());
        currentDateTime.setDate(currentDateTime.getDate() - 1);
        var outputFormat = currentDateTime.toISOString();
        var checkout = new Date($(this).val());
        // 체크인 시간 이후, 체크아웃 시간 이전의 날짜를 `min`과 `max` 속성으로 설정
        $('#time').attr('max', outputFormat.slice(0, 16));
        if (checkin >= checkout) {
            $('#time').val('');
        }

        var checkin = $('#time').val();
        var checkout = $('#timeout').val();

        if (checkin && checkout) {
            showRoomUp();
        }


    });
    $(document)
        .ready(function() {
            showBook();
            showRoom();

        })
        .on('click', '#roombox option:selected', function() {
            let str = $(this).text();

            $('#name').val(str.substring(6));
            $('#num').val($(this).val());

            // 체크인 시간
            var checkin = new Date($('#time').val());
            var checkout = new Date($('#timeout').val());
            var diffTime = Math.abs(checkout - checkin);
            var diffHours = Math.ceil(diffTime / (1000 * 60 * 60));
            var ondayPrice = diffHours / 24 + 1



            $.ajax({
                url: '/selectRoomCh',
                type: 'post',
                data: {
                    room_seq: $(this).val()
                },
                dataType: 'json',
                beforeSend: function() {
                    // 요청 전에 처리할 내용
                },
                success: function(data) {
                    // 서버로부터 응답을 받았을 때 처리할 내용

                    // 숙박인원 값이 변경될 때마다 실행
                    var maxPerson = parseInt(data[3]);
                    $('#per').val(data[3])

                    $('#person').on('change', function() {

                        // 숙박인원이 최대숙박인원보다 클 경우, 최대숙박인원 값으로 제한
                        if ($(this).val() > $('#per').val()) {
                            $(this).val(maxPerson);
                        } else if ($(this).val() < 1) { // 숙박인원이 1보다 작을 경우, 1로 설정
                            $(this).val(1);
                        }
                    });

                    // max 값 설정
                    $('#per').val(data[3]); // 총 숙박인원을 per 필드에 저장
                    $('#person').attr('max', data[3]); // 입력란의 max 속성에 총 숙박인원을 설정


                    $('#tye').val(data[2]);
                    $('#num').val(data[0]);
                    $('#per').val(data[3]);
                    $('#price').val(data[4]);
                    $('#pric').val(data[4] * ondayPrice);
                    $('#sqnum').val(data[5]);

                    $('#typename').val(data[6]);
                },
                error: function(xhr, textStatus, errorThrown) {
                    // 요청 실패 시 처리할 내용
                    console.log('Error: ' + textStatus + ' ' + errorThrown);
                }
            });

            // 입력란 초기화
            $('#person').val('');
            $('#price').val('');
        })
        .on('change', '#bo', function() {
            let str = $("#bo option:selected").text();
            console.log(str);
            $('#tye').val(str);
        })
        .on('click', '#db option:selected', function() {
            $('#book_sq').val($(this).val());
        })
        .on('change', '#time', function() {
            let str = $("#time").val();
            console.log(str);
            $('#chein').val(str);
        })
        .on('change', '#timeout', function() {
            let str = $("#timeout").val();
            console.log(str);
            $('#cheo').val(str);
        })
        .on('click', '#btnC', function() {
            id = $('#name').val('');
            ps = $('#num').val('');
            type = $('#tye').val('');;
            person = $('#per').val('');
            price = $('#pric').val('');
            name = $('#rep').val('');
            timei = $('#chein').val('');
            timeo = $('#cheo').val('');
            ponh = $('#pohn').val('');
            $('#book_sq').val('');
            $('#person').val('');
            $('#price').val('');


        })
        .on('click', '#btnO', function() {
            if (!confirm('정말로 지우시겠습니까?')) return false;
            $.ajax({
                url: '/DeleteBook',
                type: 'post',
                data: {
                    s_no: $('#book_sq').val()
                },
                dataType: 'text',
                beforeSend: function() {
                    if ($('#book_sq').val() == '') {
                        alert('선택하세요');
                        return false; //AJAX호출을 시작도 안함
                    }
                },
                success: function(data) {
                    if (data == "ok") {
                        showBook();
                        $('#btnC').trigger('click');
                    } else {
                        alert("delete 실패")
                    }
                }
            })


        })
        .on('click', '#btnR', function() {

            console.log($('#chein').val());
            console.log($('#cheo').val());
            console.log($('#sqnum').val());
            console.log($('#person').val());
            console.log($('#pric').val());
            console.log($('#rep').val());
            console.log($('#pohn').val());
            if ($('#book_sq').val() != '') {
                $.ajax({
                    url: '/UpdateBook',
                    type: 'post',
                    data: {
                        chein: $('#chein').val().replace("T", " "),
                        cheo: $('#cheo').val().replace("T", " "),
                        roomnum: $('#sqnum').val(),
                        person: $('#person').val(),
                        totalprice: $('#pric').val(),
                        rep: $('#rep').val(),
                        pohn: $('#pohn').val(),
                        booksq: $('#book_sq').val()
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#rep').val());
                        if (name == '' || name == null) {
                            alert('예약자명을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }
                        if ($('#pohn').val() == '') {
                            alert('연락처를 입력하시오');
                            return false;
                        }
                    },
                    success: function(data) {
                        if (data == "ok") {
                            showBook();
                        } else {
                            alert("예약이 이미있습니다.")
                        }
                        $('#btnC').trigger('click');
                    }
                })

            } else {
                alert("확인");
                $.ajax({
                    url: '/InsertBook',
                    type: 'post',
                    data: {
                        chein: $('#chein').val().replace("T", " "),
                        cheo: $('#cheo').val().replace("T", " "),
                        roomnum: $('#sqnum').val(),
                        person: $('#person').val(),
                        totalprice: $('#pric').val(),
                        rep: $('#rep').val(),
                        pohn: $('#pohn').val()
                    },
                    dataType: 'text',
                    beforeSend: function() {
                        let name = $.trim($('#rep').val());
                        if (name == '' || name == null) {
                            alert('예약자명을 입력하시오');
                            return false; //AJAX호출을 시작도 안함
                        }
                        if ($('#pohn').val() == '') {
                            alert('연락처를 입력하시오');
                            return false;
                        }
                    },
                    success: function(data) {
                        if (data == "ok") {
                            showBook();
                        } else {
                            alert("예약이 이미있습니다.")
                        }
                        $('#btnC').trigger('click');
                    }
                })

            }









        })

    function showRoom() {
        $.ajax({
            url: '/selectRoom',
            type: 'post',
            data: {},
            dataType: 'json',
            beforeSend: function() {},
            success: function(data) {
                $('#roombox option').remove();

                for (let i = 0; i < data.length; i++) {

                    $('#roombox').append('<option value="' + data[i]['room_seq'] + '"" > 객실명: ' + data[i]['roomname'] + '</option>');

                }
            }
        })
    }

    function showRoomUp() {
        $.ajax({
            url: '/selectRoomUp',
            type: 'post',
            data: {
                chein: $('#time').val().replace("T", " "),
                cheo: $('#timeout').val().replace("T", " ")
            },
            dataType: 'json',
            beforeSend: function() {
                console.log($('#time').val().replace("T", " "));
                console.log($('#timeout').val().replace("T", " "));
            },
            success: function(data) {
                $('#roombox option').remove();

                for (let i = 0; i < data.length; i++) {

                    $('#roombox').append('<option value="' + data[i]['room_seq'] + '"" > 객실명: ' + data[i]['roomname'] + '</option>');

                }
            }
        })
    }

    function showBook() {
        $.ajax({
            url: '/selectBook',
            type: 'post',
            data: {},
            dataType: 'json',
            beforeSend: function() {},
            success: function(data) {
                $('#db option').remove();

                for (let i = 0; i < data.length; i++) {
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 체크인: ' + data[i]['CHECKIN'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 체크아웃: ' + data[i]['CHECKOUT'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 객실번호: ' + data[i]['ROOMNUMBER'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 객실명: ' + data[i]['roomname'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 타입: ' + data[i]['typename'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 숙박인원: ' + data[i]['PERSONNEL'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 총금액: ' + data[i]['TOTALFEE'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 대표자: ' + data[i]['REPRESENTATIVE'] + '</option>');
                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > 모바일: ' + data[i]['MOBILE'] + '</option>');


                    $('#db').append('<option value="' + data[i]['BOOK_SEQ'] + '"" > </option>');

                }
            }
        })
    }
</script>

</html>