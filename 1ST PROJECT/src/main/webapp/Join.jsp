<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join.jsp</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="JoinServiceCon.do" method="post">
		아이디 입력 : <input id="inputid" type="text" name="mem_id"
			placeholder="ID를 입력하세요">
			<button type="button" id="btn">
				<p id="idcheck">아이디 중복체크</p>
			</button>
			<br>
			
		비밀번호 입력 : <input type="password" name="mem_pw"
			placeholder="PW를 입력하세요">
			<br>
		비밀번호 재입력 : <input type="password" name=""
			placeholder="PW를 입력하세요">
			<br>
		이름 입력 : <input type="text" name="mem_name"
			placeholder="성함을 입력하세요">
			<br>
		전화번호 입력 : <input type="text" name="mem_phone"
			placeholder="전화번호를 입력하세요">
			<br>
		<input type="submit" value="회원가입" class="button fit">
			<input type="reset" value="초기화">
	</form>
	
	
	
	
	
</body>
</html>
