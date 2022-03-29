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
							<li>
								<hr class="dropdown-divider">
							</li>
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
							<li>
								<hr class="dropdown-divider">
							</li>
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

	<div class="container text-center align-items-center"
		style="height: 880px;">
		<div class="mt-5 row mx-auto align-items-center">
			<div class="col-md-6 ">
				<h1>전화번호 수정</h1>
			</div>
			<div class="col-md-6 ">
				<h1>비밀번호 수정</h1>
			</div>
		</div>

		<div class="h-50 row mx-auto">
			<div class="col-md-6 ">
				<form>
					<div class="form-floating mb-3 mx-auto w-50 "
						style="margin-top: 50px">
						<input type="text" class="form-control " name="mem_phone_cur"
							placeholder="기존 전화번호 입력 (Ex 010-0000-0000) "> <label
							for="exampleInputPassword1 " class="form-label ">변경전 전화번호
							입력</label>
					</div>

					<div class="form-floating mb-3 mx-auto w-50 ">
						<input type="text" class="form-control " name="mem_phone_new"
							placeholder="변경할 전화번호 입력 "> <label
							for="exampleInputPassword1 " class="form-label ">변경할 전화번호
							입력</label>
					</div>

					<div class="mt-3 ">
						<button type="button" id="changephone" class="btn btn-primary ">전화번호
							변경</button>
						<button type="reset" class="btn btn-primary ">입력창 초기화</button>
					</div>
				</form>
				<p class="changephoneresult"></p>

			</div>

			<div class="col-md-6 ">
				<form>
					<div class="form-floating mb-3 mx-auto w-50 "
						style="margin-top: 50px">
						<input type="password" class="form-control " name="mem_pw_cur"
							placeholder="기존 비밀번호 입력 "> <label
							for="exampleInputPassword1 " class="form-label ">변경전 비밀번호
							입력</label>
					</div>

					<div class="form-floating mb-3 mx-auto w-50 ">
						<input type="password" class="form-control pw" name="mem_pw_new"
							placeholder="변경할 비밀번호 입력 "> <label
							for="exampleInputPassword1 " class="form-label ">변경할 비밀번호
							입력</label>
					</div>
					<div class="form-floating mb-3 mx-auto w-50 ">
						<input type="password" class="form-control pwre"
							name="mem_pw_new_check" placeholder="변경할 비밀번호 재입력 "> <label
							for="exampleInputPassword1 " class="form-label ">변경할 비밀번호
							재입력</label>
					</div>
					<div class="mt-3 ">
						<button type="button" id="changepw" class="btn btn-primary ">비밀번호
							변경</button>
						<button type="reset" class="btn btn-primary ">입력창 초기화</button>
					</div>

				</form>
				<p class="changepwresult"></p>
			</div>
		</div>


	</div>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
            // 전화번호 수정
            $('#changephone').on('click', function() {
                let mem_phone_cur = $('input[name=mem_phone_cur]').val();
                console.log(mem_phone_cur);
                let mem_phone_new = $('input[name=mem_phone_new]').val();
                console.log(mem_phone_new);

                $.ajax({
                    url: 'UpdatePhoneService.do',
                    type: 'post',
                    data: {
                        mem_phone_cur : mem_phone_cur,
                        mem_phone_new: mem_phone_new
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

            // 비밀번호 수정
            $('#changepw').on('click', function() {
            	
            	// 비밀번호 확인
            	
            	// 비밀번호 확인 끝
            	
            	
            	
                let mem_pw_cur = $('input[name=mem_pw_cur]').val();
                console.log(mem_pw_cur);
                let mem_pw_new = $('input[name=mem_pw_new]').val();
                
                let mem_pw_new1 = $('input[name=mem_pw_new1]').val();
                console.log(mem_pw_new1);

                $.ajax({
                    url: 'UpdatePwService.do',
                    type: 'post',
                    data: {
                    	mem_pw_cur: mem_pw_cur,
                    	mem_pw_new: mem_pw_new,
                    },
                    dataType: "text ",
                    success: function(changepwresult) {
                        $('.changepwresult').html('<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 변경하신 비밀번호는 <br>' + changepwresult + '입니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
                    },
                    error: function() {
                    	$('.changephoneresult').html('<div class="w-75 mx-auto p-3 alert alert-primary alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 비밀번호 변경에 실패하였습니다.<br> 재시도해주세요 </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
                    }

                });
            });
            
         
         $(function () {
             $("input").keyup(function(){
             let mem_pw_new = $("input[name=mem_pw_new]").val();
             let mem_pw_check = $("input[name=mem_pw_new_check]").val();
             console.log(mem_pw_check);
             console.log(mem_pw_new);
            	 
             if (mem_pw_new != '' && mem_pw_check == '' ) {
                 null;
             } else if (mem_pw_new != "" || mem_pw_check != "") {
                 if (mem_pw_new == mem_pw_check) {
                	 $('.changepwresult').html('<div class="w-75 mx-auto p-3 alert alert-success alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 비밀번호가 일치합니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
                 } else {
                	 $('.changepwresult').html('<div class="w-75 mx-auto p-3 alert alert-danger alert-dismissible" id="liveAlert" role="alert" style="margin-top:40px;"><strong> 비밀번호가 일치하지 않습니다. </strong><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>');
                 }
             
             }
         });
         });
         
         
            
            
        </script>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js "
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p "
		crossorigin="anonymous "></script>


</body>

</html>