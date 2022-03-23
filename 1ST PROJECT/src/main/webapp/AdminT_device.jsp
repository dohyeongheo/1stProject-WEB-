<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T device</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>T Device 정보 입력</h1>
	<form action="" method="post">
		<table>
			<thead>
				<tr>
					<td>센서종류</td>
					<td>측정단위</td>
					<td>디바이스 설치일자</td>
				</tr>
			</thead>
			<tbody>
				<tr id = "addTr">
					<td><select name="sensor_type">
							<option value="mag">마그네틱 도어센서</option>
							<option value="pir">적외선 모션감지센서</option>
							<option value="temphum">온습도 감지센서</option>
							<option value="co">일산화탄소감지센서</option>
					</select></td>
					<td><select name="sensor_unit">
							<option value="temㄹ">온도 °C</option>
							<option value="tem">온도 °C</option>
							<option value="hum">습도 g/m3</option>
							<option value="">온습도 감지센서</option>
							<option value="co">일산화탄소감지센서</option>
					</select></td>
					<td><input type ="date" name="sensor_inst_date">
					
					</td>
				</tr>

			</tbody>
		</table>
					<button id="btn_AddSensor">센서 추가</button>
	</form> 
	
	<script>
        // 자바스크립트 작성
        // addeventlistenr(내가할행동, 작동될로직(){
        // 로직의 내용 })

        
        
        $('.btn_AddSensor').click(function() {
        $('#addTr').append('');
        )};
        

    </script>

</body>
</html>