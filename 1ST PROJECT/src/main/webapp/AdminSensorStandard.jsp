<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AdminSensorStandard</title>
</head>
<body>
<h1>센서 기준 입력</h1>
<form action ="SensorStandardSetSerivce.do" method="get">
창고 순번 <input type = "number" name ="w_seq">
<!-- 센서 종류 <input type = "text" name ="sensor_type"> -->
센서 종류
<select name = "sensor_type">
<option value ="tem">온도</option>
<option value ="hum">습도</option>
</select>
<!-- <input type = "text" name ="sensor_type"> -->
기준 값 <input type = "number" name ="st_value">
<input type ="submit" value ="정보 입력">
</form>


</body>
</html>