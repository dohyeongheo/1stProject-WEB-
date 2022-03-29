<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title></title>
</head>
<body class="text-center">
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<h3>디바이스 아이디</h3>
			</div>
			<div class="col">
				<h3>설치장소</h3>
			</div>
			<div class="col">
				<h3>설치일자</h3>
			</div>
			<div class="col">
				<h3></h3>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<input type="text" class="form-control"
					id="exampleFormControlInput1">
			</div>
			<div class="col">
				<input type="text" class="form-control"
					id="exampleFormControlInput1">
			</div>
			<div class="col">
				<input type="date" class="form-control"
					id="exampleFormControlInput1">
			</div>
			<div class="col">
				<button type="button" class="btn btn-primary" id="add_device">전송</button>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<h3>센서 타입</h3>
			</div>
			<div class="col">
				<h3>센서 측정 단위</h3>
			</div>
			<div class="col">
				<h3>센서 설치일자</h3>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<select class="form-select" aria-label="Default select example"
					name="sensor_type" id="sensor_type">
					<option selected>센서 타입 선택</option>
					<option value="MG">마그네틱 도어센서</option>
					<option value="PI">적외선 모션감지센서</option>
					<option value="TM">온도 센서</option>
					<option value="HM">습도 센서</option>
					<option value="CO">일산화탄소 감지 센서</option>
				</select>
			</div>

			<div class="col">
				<select class="form-select" aria-label="Default select example"
					name="sensor_unit" id="sensor_unit">
					<option selected>측정 단위 선택</option>
					<option value="C">도</option>
					<option value="%">%</option>
					<option value="ppm">ppm</option>
				</select>
			</div>

			<div class="col">
				<input type="date" class="form-control" id="sensor_inst_date">
			</div>
		</div>
	</div>
	<br>
	<br>
	<button type="button" class="btn btn-primary" id="add_sensor">센서
		추가</button>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	$('#add_sensor').on('click', function() {
		let sensor_type_value = $('#sensor_type option:selected').val();
		console.log(sensor_type_value);
		let sensor_unit_value = $('#sensor_unit option:selected').val();
		console.log(sensor_unit_value);
		let sensor_inst_date_value = $('#sensor_inst_date').val();
		console.log(sensor_inst_date_value);
		
        $.ajax({
            url: 'AddSensorServicecon.do',
            type: 'post',
            data: {
            	sensor_type_value : sensor_type_value,
            	sensor_unit_value: sensor_unit_value,
            	sensor_inst_date_value : sensor_inst_date_value
            },
            dataType: "text ",
            success: function(changephoneresult) {
            $('.changephoneresult').html('<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 변경하신 전화번호는 <br>' + changephoneresult + '입니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
            },
            error: function() {
            /* alert('전화번호 변경 실패'); */
            $('.changephoneresult').html('<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 전화번호 변경에 실패하였습니다.<br> 재시도해주세요 </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
            }

        });
		
	});
	
		/* async function add_sensor() {
			let formData = new Formdata();
			formData.append("sensor_type", "sensor_type.value");
			formData.append("sensor_unit", "sensor_unit.value");
			formData.append("sensor_inst_date", "sensor_inst_date.value");
			console.log(sensor_type.value)
			
			const response = await fetch("/AddSensorServicecon.do" ,{
			method : "post",
			body : formData
				
			});
			
			const msg = await response.test();
			msg_id.value = msg;
			alert(msg);

		} */
	</script>
</body>
</html>