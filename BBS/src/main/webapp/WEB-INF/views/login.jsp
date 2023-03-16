<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
      /* 스타일링 */
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
      }
      .login-box {
        max-width: 360px;
        margin: 100px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
      }
      .login-box h1 {
        font-size: 24px;
        text-align: center;
        margin-bottom: 30px;
      }
      .login-box label {
        display: block;
        margin-bottom: 10px;
        font-size: 16px;
        font-weight: bold;
      }
      .login-box input[type="text"],
      .login-box input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 3px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
      }
      
      .login-box input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.2s;
      }
      .login-box a {
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.2s;
      }
      
      .login-box input[type="submit"]:hover {
        background-color: #3e8e41;
      }
    </style>
  </head>
  <body>
    <div class="login-box">
      <h1>로그인</h1>
      <form action='doLogin' method='post'>
        <label for="username">아이디</label>
        <input type="text" id="username" name="username" required>
        <label for="password">비밀번호</label>
        <input type="text" id="password" name="password" required>
        <input type="submit" value="로그인">
        <a href="/sign">회원가입</a>
      </form>
    </div>
      ${guide}
  </body>
  
</html>