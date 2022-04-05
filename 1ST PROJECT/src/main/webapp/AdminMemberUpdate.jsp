<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Safe Zone</title>

<!-- <style>
#top {
margin-top : 100px;
}
</style> -->
</head>

<body class="text-center">

<!-- 상단바 시작 -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AboutUs.jsp">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FAQ.jsp">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BoardMain.jsp">Board</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            AdminPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="AdminMemberSelect.jsp">회원조회/수정/삭제</a></li>
            <li><a class="dropdown-item" href="#">창고 정보조회/수정/삭제</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="AdminMemberSelect.jsp">내 정보 수정</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">내 창고 모니터링</a></li>
          </ul>
        </li>
      </ul>
        <a href="Login.jsp" class="btn btn-primary me-md-2" role="button">로그인</a>
        <a href="Join.jsp" class="btn btn-primary me-md-2" role="button">회원가입</a>
    </div>
  </div>
</nav>

<!-- 상단바 끝 -->

<!-- 스크립틀릿 시작 -->
  <%
  String mem_id = request.getParameter("mem_id");
  String mem_name = request.getParameter("mem_name");
  String mem_phone = request.getParameter("mem_phone");
  %>
  
  <!-- 스크립틀릿 끝 -->
  
   <div class="container" style="margin-top: 100px;"></div>

<form>
  <h1 class="text-center">회원정보 수정하기</h1>
    
  <div class="form-floating mb-3 mx-auto w-25" style="margin-top:50px">
    <input type="text" class="form-control" name="mem_id" placeholder="회원 아이디 <%= mem_id %>" disabled value="<%=mem_id%>">
    <label for="exampleInputPassword1" class="form-label">회원 아이디 : <%= mem_id %></label>
    </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="text" class="form-control" name="mem_name" placeholder="회원 이름 <%= mem_name %>">
    <label for="exampleInputPassword1" class="form-label">기존 이름 : <%= mem_name %></label>
  </div>
  <div class="form-floating mb-3 mx-auto w-25">
    <input type="text" class="form-control" name="mem_phone" placeholder="회원 전화번호 <%= mem_phone %>">
    <label for="exampleInputPassword1" class="form-label">기존 전화번호 : <%= mem_phone %></label>
  </div>
  
  <div class="container" style="margin-top:50px">
  <button type="button" id="update" class="btn btn-primary">정보수정</button>
  <button type="reset" class="btn btn-primary">초기화</button>
  </div>
</form>
<p class="updateresult"></p>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

// 정보 변경 시작
	$('#update').on('click', function() {
		let mem_id = $('input[name=mem_id]').val();
		let mem_name = $('input[name=mem_name]').val();
		let mem_phone = $('input[name=mem_phone]').val();
		
		console.log(mem_id);
		console.log(mem_name);
		console.log(mem_phone);
		
		$.ajax({
		url : 'AdminMemberUpdateServiceCon.do',
		type : 'post',
		data : {
		mem_id : mem_id,
		mem_name : mem_name,
		mem_phone : mem_phone,
		},
		dataType : "text",
		success : function(result) {
			if (result == 'success') {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-success" role="alert" style="margin-top:40px;"> 정보 변경에 성공하였습니다. </div> ');
			} else {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="danger" style="margin-top:40px;"> 정보 변경에 실패하였습니다. </div> ');
			}
		},
		error : function() {
			$('.updateresult').html('<div class="mx-auto w-25 p-3 alert alert-danger" role="danger" style="margin-top:40px;"> 정보 변경에 실패하였습니다. </div> ');
		}
		});
	});
// 정보 변경 끝


</script>

</body>

</html>