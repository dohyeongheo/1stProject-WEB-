<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>아이디 비밀번호 찾기 페이지</title>


</head>


<body>

	<!-- 상단바 시작 -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="Index.jsp">Safe-Zone</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About
							us</a></li>
					<li class="nav-item"><a class="nav-link" href="FAQ.jsp">FAQ</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="BoardMain.jsp">Board</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							AdminPage </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="AdminMemberSelect.jsp">회원조회/수정/삭제</a></li>
							<li><a class="dropdown-item" href="#">창고 정보조회/수정/삭제</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							MyPage </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="AdminMemberSelect.jsp">내
									정보 수정</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">내 창고 모니터링</a></li>
						</ul></li>
				</ul>
				<a href="Login.jsp" class="btn btn-primary me-md-2" role="button">로그인</a>
				<a href="Join.jsp" class="btn btn-primary me-md-2" role="button">회원가입</a>
			</div>
		</div>
	</nav>

	<!-- 상단바 끝 -->

	<!-- 본문 시작 -->

	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-md-6">
				<h1 class="text-center">아이디 찾기</h1>
			</div>
			<div class="col-md-6">
				<h1 class="text-center">비밀번호 찾기</h1>
			</div>
		</div>

		<div class="row mx-auto text-center" style="height: 500px; margin-top : 20px">
			<div class="col-md-6">
			<form>
					<div class="mx-auto w-50 p-3">
						<!-- <label for="floatingInput">아이디 입력</label> -->
						<input type="text" class="form-control" name="mem_name" placeholder="이름 입력">
					</div>
					
					
					<div class="mx-auto w-50 p-3">
						<!-- <label for="exampleInputPassword1" class="form-label">전화번호 입력 </label>-->
						 <input type="text" class="form-control" name="mem_phone" placeholder="비밀번호 입력">
					</div>

					<button type="button" id="findid" class="btn btn-primary" style="margin-top:25px;">전송</button>
					<button type="reset" class="btn btn-primary" style="margin-top:25px;">입력창 초기화</button>
					</form>
				<p class="findidresult"></p>
			</div>

			<div class="col-md-6">
				<!-- <div class="container"></div>
				<form class="text-center" action="IdPwFindServiceCon.do" method="post"
					class="align-middle"> -->
<form>
					<div class="mx-auto w-50 p-3">
						<!-- <label for="exampleInputPassword1" class="form-label">아이디입력</label> -->
							<input type="text" class="form-control" name="mem_id1" placeholder="아이디 입력">
					</div>
					<div class="mx-auto w-50 p-3">
						<!-- <label for="exampleInputPassword1" class="form-label">이름입력</label> -->
						<input type="text" class="form-control" name="mem_name1" placeholder="이름 입력">
					</div>
					<div class="mx-auto w-50 p-3">
						<!-- <label for="exampleInputPassword1" class="form-label">전화번호입력</label> -->
						<input type="text" class="form-control" name="mem_phone1" placeholder="전화번호 입력">
					</div>


					<button type="button" id="findpw" class="btn btn-primary" style="margin-top:25px;">전송</button>
					<button type="reset" class="btn btn-primary" style="margin-top:25px;">입력창 초기화</button>
					</form>
					<p class="findpwresult"></p>



			</div>
		</div>
	</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">

	// 아이디 찾기
		$('#findid').on('click', function() {
			let mem_name = $('input[name=mem_name]').val();
			console.log(mem_name);
			let mem_phone = $('input[name=mem_phone]').val();
			console.log(mem_phone);
			
			$.ajax({
			url : 'FindIdServiceCon.do',
			type : 'post',
			data : {
			mem_name : mem_name,
			mem_phone : mem_phone
			},
			dataType : "text",
			success : function(findidresult) {
				$('.findidresult').html('<div class="mx-auto w-50 p-3 alert alert-primary" role="alert" style="margin-top:40px;"> 조회하신 아이디는 <br>' + findidresult + '입니다.</div> ');
			/* $('.findidresult').html('<div class="alert alert-primary" role="alert">' + 조회하신 아이디는 ' + findidresult + ' '입니다.</div> '); */
					/* <br><p>조회하신 아이디는 ' + findidresult + '입니다.') */	
			},
			error : function() {
				alert('아이디 조회 실패');
			}
				
			});
		});
	
		// 비밀번호 찾기
		$('#findpw').on('click', function() {
			let mem_id = $('input[name=mem_id1]').val();
			console.log(mem_id);
			let mem_name = $('input[name=mem_name1]').val();
			console.log(mem_name);
			let mem_phone = $('input[name=mem_phone1]').val();
			console.log(mem_phone);
			
			$.ajax({
			url : 'FindPwServiceCon.do',
			type : 'post',
			data : {
			mem_id : mem_id,
			mem_name : mem_name,
			mem_phone : mem_phone
			},
			dataType : "text",
			success : function(findpwresult) {
				$('.findpwresult').html('<div class="mx-auto w-50 p-3 alert alert-primary" role="alert" style="margin-top:40px;"> 조회하신 비밀번호는 <br>' + findpwresult + '입니다.</div> ');				
			},
			error : function() {
				alert('비밀번호 조회 실패');
			}
				
			});
		});
	</script>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		

</body>
</html>