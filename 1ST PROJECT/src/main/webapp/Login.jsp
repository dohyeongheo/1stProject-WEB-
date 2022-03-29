<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>로그인 페이지</title>
    
</head>

<!-- 로그인 페이지 -->
<body>

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


<!-- 본문 시작 -->
<!--     <div class="container" style="margin-top: 200px;"></div> -->
    <div class="container" style="margin-top: 200px;"></div>
 

<form action = "LoginServiceCon.do" method = "post">
  
  <img src="img/Main_Logo.png" class="rounded mx-auto d-block" alt="...">
  
  <div class="form-floating mb-3 mx-auto w-25" style="margin-top:50px">
    <input type="text" class="form-control" name="mem_id" placeholder="아이디 입력">
    <label for="exampleInputPassword1" class="form-label">아이디 입력</label>
    </div>
    
    <div class="form-floating mb-3 mx-auto w-25" style="margin-top:50px">
    <input type="text" class="form-control" name="mem_pw" placeholder="비밀번호 입력">
    <label for="exampleInputPassword1" class="form-label">비밀번호 입력</label>
    </div>
  
  
  
  <!-- <div class="container" style="margin-top:50px" > -->
  <div class="container mx-auto text-center" style="margin-top:50px">
  <button type="submit" class="btn btn-primary">로그인</button>
  <a href="IdPwFind.jsp" class="btn btn-primary" role="button">아이디 비밀번호 찾기</a>
  <a href="join.jsp" class="btn btn-primary" role="button">회원가입</a>
  </div>
  

</form>
<!-- 본문 끝 -->


<!--     <main class="form-signin">
        <form action="LoginServiceCon.do" method="post">
            <h1 class="h3 mb-3 fw-normal">로그인</h1>

            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" placeholder="아이디를 입력해주세요" name="mem_id">
                <label for="floatingInput">아이디 입력</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="mem_pw">
                <label for="floatingPassword">비밀번호 입력</label>
            </div>
                        
            
            <button type="button" class="btn btn-secondary me-md-2">로그인</button>
        <button type="button" class="btn btn-secondary me-md-2">아이디 비밀번호 찾기</button>
            
        </form>
        
        
    </main>

 -->        


</body>

</html>