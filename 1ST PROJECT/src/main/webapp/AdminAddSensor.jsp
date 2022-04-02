<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>센서 정보 추가</title>
</head>
<body>

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

<form action="#" method="post">
    
  <h1 class="text-center">창고 정보 입력</h1>
  
   <div class="row">
    <div class="col">
   디바이스 아이디 입력
   <input type="text" class="form-control" name="mem_id" placeholder="디바이스 아이디">
    </div>
    <div class="col">
   디바이스 설치장소 입력
   <input type="text" class="form-control" name="mem_id" placeholder="디바이스 설치장소">
    </div>
    <div class="col">
   디바이스 설치일자 입력
   <input type="date" class="form-control" name="mem_id" placeholder="디바이스 설치일자">
    </div>
    <div class="col">
   창고 소유회원 아이디 입력
   <input type="text" class="form-control" name="mem_id" placeholder="창고 소유회원 아이디">
    </div>
    </div>
    
    
    <!-- 센서 종류 추가 -->
    <div class="d-none row" id="hidden">
    <div class="col">
   센서 종류
  <select name = "sensorType" class="form-select" aria-label="센서 종류 선택">
  <option selected>센서 종류 선택</option>
  <option value="MG">마그네틱 도어 센서</option>
  <option value="PI">모션감지 적외선 센서</option>
  <option value="TM">온도 센서</option>
  <option value="HM">습도 센서</option>
  <option value="CO">일산화탄소 센서</option>
</select>
    </div>
    <div class="col">
   측정 단위
  <select name = "sensorUnit" class="form-select" aria-label="측정 단위 선택">
  <option selected>측정 단위 선택</option>
  <option value="B">마그네틱, 적외선 센서</option>
  <option value="C">C</option>
  <option value="%">%</option>
  <option value="P">PPM</option>
</select>
    </div>
    <div class="col">
   센서 설치일자
   <input type="date" class="form-control" name="sensorDate" placeholder="센서 설치일자">
    </div>
    <div class="col">
   센서 기준값
   <input type="text" class="form-control" name="sensorStandardValue" placeholder="센서 기준값">
    </div>
    </div>
    
    <p class="hidden1"></p>
    
    

  
  <div class="container" style="margin-top:50px">
  <button type="submit" class="btn btn-primary">창고 정보 입력</button>
  <button type="reset" class="btn btn-primary">초기화</button>
</form>
  <button type="button" class="btn btn-primary" id="addSensor">센서 추가</button>
  </div>
	
	



<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">

	// 아이디 찾기
//		$('#addSensor').on('click', function() {
//		$('#hidden').append("");
//			});
	

		$('#addSensor').click(function() {
			
		

		var hidden = $('#hidden').html();
		var sensorType = $()
		
			$('.hidden1').append('<div class="row">' + hidden + '</div>');
		});
	
	
</script>

</body>
</html>