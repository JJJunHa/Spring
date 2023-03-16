<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.hidden {
  display: none;
}
    </style>
  </head>
  <body>
    <h1>게시글 작성</h1>
    <form id="frmAdd" action="/AddContent" method="post">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" required>
      <label for="content">내용</label>
      <textarea id="content" name="content" rows="10" required></textarea>
      <input type="submit" value="작성">
      <div><a class="add-link" href='/list'>취소</a></div>
    </form>
  </body>
</html>