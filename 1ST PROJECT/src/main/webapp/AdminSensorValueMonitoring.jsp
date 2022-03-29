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
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<table>
		<caption>
			<h2>센서값 모니터링</h2>
		</caption>
		<thead>
		<tr>
			<td>센서 값 순번</td>
			<td>센서 순번</td>
			<td>센서 값</td>
			<td>측정 일자</td>
			<td>게이트 번호</td>
		</tr>
		</thead>
		
		<tbody align="center">
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
			String sql = "select * from t_sensor_value";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			//반복문 안에서 rs객체의 요소들을 tr태그에 넣기
			while (rs.next()) {
				String sv_seq = rs.getString(1);
				String sensor_seq = rs.getString(2);
				String sv_data = rs.getString(3);
				String sv_date = rs.getString(4);
				String gate_num = rs.getString(5);

				// String enMem_name = URLEncoder.encode(mem_name, "utf-8");

				out.print("<tr>");
				out.print("<td>" + sv_seq + "</td>");
				out.print("<td>" + sensor_seq + "</td>");
				out.print("<td>" + sv_data + "</td>");
				out.print("<td>" + sv_date + "</td>");
				out.print("<td>" + gate_num + "</td>");
				// out.print("<td><a href='MemberUpdateServiceCon.do?'>정보 수정</a></td>");
				// out.print("<td><a href='DeleteServiceCon.do?mem_id="+ mem_id +"'>삭제</a></td>");
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
		</tbody>
	</table>
	
	<table text-align="center" border="1">
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
		</table>



</body>
</html>