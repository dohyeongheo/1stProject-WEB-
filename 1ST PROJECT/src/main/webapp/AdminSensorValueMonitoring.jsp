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
				<td colspan="10">
					<h1>전체 창고 모니터링</h1>
				</td>

			</tr>
		</thead>
		<tr>
			<td>순번</td>
			<td>창고 번호</td>
			<td>소유 회원</td>
			<td>디바이스 아이디</td>
			<td>센서 번호</td>
			<td>센서 종류</td>
			<td>센서 현재값</td>
			<td>센서 기준값</td>
			<td>설치 장소</td>
			<td>설치 일자</td>
		</tr>
		<%
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
			String sql = "SELECT distinct F.sv_data, E.w_seq, D.mem_id, C.device_uid, A.sensor_seq, A.sensor_type, B.st_value, C.device_loc, C.device_inst_date FROM t_sensor A, t_standard_valuse B, t_device C, t_member D, t_warehouse E, t_sensor_value F where A.device_seq = C.device_seq And C.mem_id = D.mem_id And D.mem_id = E.mem_id And E.w_seq = B.w_seq And A.sensor_seq = F.sensor_seq order by A.sensor_seq";
			
			
			/* SELECT sv_seq, sensor_seq, sv_data, sv_date, gate_num
			FROM t_sensor_value */
			/* WHERE sv_date BETWEEN 
			TO_DATE('2015-10-01 23:59:59','yyyy/mm/dd hh24:mi:ss') AND 
			TO_DATE('2015-11-30 23:59:59','yyyy/mm/dd hh24:mi:ss'); */
			/* -- 또는 WHERE sv_date BETWEEN '2015-10-01' AND '2015-11-30'; */

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			//반복문 안에서 rs객체의 요소들을 tr태그에 넣기
			for(int i = 1; rs.next(); i++) {
					String sv_data = rs.getString(1);
					String w_seq = rs.getString(2);
					String mem_id = rs.getString(3);
					String device_uid = rs.getString(4);
					String sensor_seq = rs.getString(5);
					String sensor_type = rs.getString(6);
					String st_value = rs.getString(7);
					String device_loc = rs.getString(8);
					String device_inst_date = rs.getString(9);
							
					

					/* String enMem_name = URLEncoder.encode(mem_name, "utf-8"); */

					out.print("<tr>");
					out.print("<td>" + i + "</td>");
					out.print("<td>" + w_seq + "</td>");
					out.print("<td>" + mem_id + "</td>");
					out.print("<td>" + device_uid + "</td>");
					out.print("<td>" + sensor_seq + "</td>");
					out.print("<td>" + sensor_type + "</td>");
					out.print("<td>" + sv_data + "</td>");
					out.print("<td>" + st_value + "</td>");
					out.print("<td>" + device_loc + "</td>");
					out.print("<td>" + device_inst_date + "</td>");
					
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

<!-- <table text-align="center" border="1">
			<thead>
			<tr>
				<td colspan="2">창고 번호</td>
				
				<td colspan="2">경비 ON / OFF</td>
				<td colspan="2">사이렌 ON / OFF</td>
				<td> 제어 </td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="2">
				<select name = "">
				<option> 1 </option>
				<option> 2 </option>
				<option> 3 </option>
				</select>
				</td>
				<td colspan="2">
				ON <input type="radio" name="led" value="0">
				OFF <input type="radio" name="led" value="1">
				</td>
				<td colspan="2">
				ON <input type="radio" name="led" value="0">
				OFF <input type="radio" name="led" value="1">
				</td>
				<td>
				<input type="submit" value="전송">
				</td>
			</tr>
			</tbody>
		</table> -->
	
<!-- 푸터 시작 -->
<footer class="bg-dark text-white pt-5 pb-4 fixed-bottom" style="height:130px; margin-top:50px" >
<div class="container-fluid d-block fixed-bottom" style="margin-top:50px">
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

</div>
 </footer>
<!-- 푸터 끝 -->
	
	



</body>
</html>