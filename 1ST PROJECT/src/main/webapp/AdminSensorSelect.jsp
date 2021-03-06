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

	<table class="table table-hover">
		<thead>
			<tr>
				<td colspan="8">
					<h1>센서 정보 확인</h1>
				</td>

			</tr>
		</thead>
		<tr>
			<td>센서 순번</td>
			<td>센서 종류</td>
			<td>기준 값</td>
			<td>설치 일자</td>
			<td>센서 정보 수정</td>
			<td>센서 정보 삭제</td>
		</tr>
		
		
		<%
		String device_seq = request.getParameter("device_seq");
		
		PreparedStatement psmt = null;
		Connection conn = null;
		ResultSet rs = null;
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
			// String sql = "SELECT C.w_seq, A.mem_id, B.device_uid, B.device_loc, B.device_inst_date FROM t_member A, t_device B, t_warehouse C where A.mem_id = B.mem_id And B.mem_id = C.mem_id";
			
			
			String sql = "SELECT distinct A.sensor_seq, A.device_seq, A.sensor_type, B.st_value, A.sensor_inst_date FROM t_sensor A, t_standard_valuse B, t_device C, t_member D, t_warehouse E where A.device_seq = ? And A.device_seq = C.device_seq And C.mem_id = D.mem_id And D.mem_id = E.mem_id And E.w_seq = B.w_seq order by A.sensor_seq";
			
			
			/* SELECT sv_seq, sensor_seq, sv_data, sv_date, gate_num
			FROM t_sensor_value */
			/* WHERE sv_date BETWEEN 
			TO_DATE('2015-10-01 23:59:59','yyyy/mm/dd hh24:mi:ss') AND 
			TO_DATE('2015-11-30 23:59:59','yyyy/mm/dd hh24:mi:ss'); */
			/* -- 또는 WHERE sv_date BETWEEN '2015-10-01' AND '2015-11-30'; */

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, device_seq);

			rs = psmt.executeQuery();

			//반복문 안에서 rs객체의 요소들을 tr태그에 넣기
			for(int i = 1; rs.next(); i++) {
					String sensor_seq = rs.getString(1);
					device_seq = rs.getString(2);
					String sensor_type = rs.getString(3);
					String st_value = rs.getString(4);
					String device_inst_date = rs.getString(5);

					/* String enMem_name = URLEncoder.encode(mem_name, "utf-8"); */

					out.print("<tr>");
					out.print("<td>" + sensor_seq + "</td>");
					out.print("<td>" + sensor_type + "</td>");
					out.print("<td>" + st_value + "</td>");
					out.print("<td>" + device_inst_date + "</td>");
					out.print("<td><a href='#'>센서 정보 수정</a></td>");
					out.print("<td><a href='DeleteSensor.do?sensor_seq="+sensor_seq+"&sensor_type="+sensor_type+"'>센서 정보 삭제</a></td>");
					
					// String enmem_name = URLEncoder.encode(mem_name, "utf-8");
// 					out.print("<td><a href='AdminMemberUpdate.jsp?mem_id="+ mem_id +"&mem_name="+enmem_name+"&mem_phone="+mem_phone+"'>정보 수정</a></td>");
					// out.print("<td><a href='AdminMemberUpdate.jsp?mem_num=1'>정보 수정</a></td>");
// 					out.print("<td><a href='DeleteServiceCon.do?mem_id="+ mem_id +"'>삭제</a></td>");
					out.print("</tr>");

					// out.print("<td><a href='DeleteServiceCon.do?email="+ enMem_name +"'>삭제</a></td>");
				}

			//db 연결 해제
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
	</table>
	
<!-- 푸터 시작 -->
<footer class="bg-dark text-white pt-5 pb-4" style="height:auto; margin-top:50px" >
<!-- <div class="container-fluid d-block fixed-bottom" style="margin-top:50px"> -->
		<div class="row" style="margin : 0px">
			<div class="col-md-2 align-self-center">
			</div>
			<div class="col-md-1 align-self-center">
				<p class="text-center">(주) 세이프존</p>
			</div>
			<div class="col-md-3 align-self-center">
				<p class="text-left">대표자 : 박지형<br>
개인정보책임관리자 : 박지형 / 사업자번호 : 178-82-00065<br>
본점 : 광주 동구 예술길 31-15 3, 4, 7층 / E-Mail : smhrd@smhrd.or.kr</p>
			</div>
			<div class="col-md-1 align-self-center">
				<p class="text-center">고객센터</p>
			</div>
			<div class="col-md-3 align-self-center">
				<p class="text-left">전화상담 : 062-655-3506, 9 / <br>전화 및 홈페이지상담 : 09시 ~ 19시 (월-금)<br>
- 카카오톡 : 09시 ~ 22시 (연중무휴)</p>
			</div>
			<div class="col-md-2 align-self-center">
			</div>
			
		</div>

<!-- </div> -->
 </footer>
 <!-- 푸터 끝 -->
	
	
	



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