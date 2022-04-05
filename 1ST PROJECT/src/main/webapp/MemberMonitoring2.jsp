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
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>Safe Zone</title>
</head>
<body class="text-center">
<!-- 상단바 시작  -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Safe-Zone</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">FAQ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Board</a>
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
            <li><a class="dropdown-item" href="#">내 창고 모니터링</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex">
        
<!--         <button class="btn btn-success" type="submit">로그인</button>
        <button class="btn btn-success" type="submit">회원가입</button> -->
        <button type="button" class="btn btn-primary me-md-2">로그인</button>
        <button type="button" class="btn btn-primary me-md-2">회원가입</button>
      </form>
    </div>
  </div>
</nav>

<!-- 상단바 끝  -->

<!-- 본문 시작  -->

<!-- 테이블 시작 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<td colspan="8">
					<h1>내 창고 모니터링</h1>
				</td>

			</tr>
		</thead>
		<tr>
		<td>구분</td>
			<td>마그네틱 도어센서</td>
			<td>적외선 모션감지센서</td>
			<td>온도 센서</td>
			<td>습도 센서</td>
			<td>일산화탄소 센서</td>
		</tr>
		
		<tr>
		<td>현재</td>
<!-- 현재 센서값 받아오기 스크립틀릿 시작 -->		
		
		<%
		PreparedStatement psmt = null;
		Connection conn = null;
		ResultSet rs = null;
		String MG = "";
		String PI = "";
		String TM = "";
		String HM = "";
		String CO = "";
		
		
		//db연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_0310_5";
			String dbpw = "smhrd5";

			// 1-3. Connection객체 사용해서 DB연결!
			conn = DriverManager.getConnection(url, dbid, dbpw);
		
			//sql준비 및 실행
			String sql = "SELECT * FROM t_sensor_value where member_id = 'test'";
		
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			
			MG = rs.getString(1);
			PI = rs.getString(1);
			TM = rs.getString(1);
			HM = rs.getString(1);
			CO = rs.getString(1);

			
			out.print("<td>" + MG + "</td>");			
			out.print("<td>" + PI + "</td>");			
			out.print("<td>" + TM + "</td>");			
			out.print("<td>" + HM + "</td>");			
			out.print("<td>" + CO + "</td>");			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
			rs.close();
				if (psmt != null)
			psmt.close();
				if (conn != null)
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}			
%>		
<!-- 현재 센서값 받아오기 스크립틀릿 끝 --> 
</tr>
</table>



<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
<script type="text/javascript">

$('#btn').on('click', function() {
	// 1. 입력한 email 가져오기
	let email = $('input[name=email]').val();
	console.log(email);

	// 2. ajax로 email 보내기(IdCheckServiceCon)
	$.ajax({
		url : 'IdCheckServiceCon.do', /* 어디로 보낼지 */
		type : 'post',
		data : { /* 입력한 email data보내기 */
			email : email
		},
		dataType : "text", /* 중복체크 결과값 text로 받아오기 */
		success : function(result){
			alert('성공', result);
			if(result=='false'){
				// 중복X
				$('#idcheck').html('중복되는 아이디가 없습니다.');
			}else{
				// 중복O
				$('#idcheck').html('아이디가 중복됩니다.');
			}
		},
		error:function(){
			alert('실패');
		}
	});
});

</script>
    
    
</body>
</html>