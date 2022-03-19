<%@page import="java.util.List"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>Forty by HTML5 UP</title>
      <meta charset="UTF-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="assets/css/main.css" />
      <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
   </head>
   <body>
   <%
      // session에 있는 회원정보 가져오기
      // 로그인 성공 시 info에 정보담겨있음.
      // 로그인 실패 시 info에는 null임.
      MemberDTO info = (MemberDTO)session.getAttribute("info");
   
   List<MessageDTO> msglist = (List<MessageDTO>)request.getAttribute("msglist");
   %>

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header" class="alt">
                  <a href="index.html" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
                  <nav>
                        <% if(info != null){%>
                        <!-- 아이디가 admin이면 회원 전체 검색이 되도록 -->
                        <% if(info.getEmail().equals("admin")) { %>
                        <a href="select.jsp"> 회원전체검색 </a>
                           <a href="update.jsp">개인정보수정</a>
                           <a href="LogoutServiceCon.do">로그아웃</a>
						<% }else{ %>  	
						<a href="update.jsp">개인정보수정</a>
                           <a href="LogoutServiceCon.do">로그아웃</a>
                           <% } %>
                        <%}else{ %>
                           <a href="#menu">로그인</a>
                        <%} %>
                     <!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. -->
                  </nav>
               </header>

            <!-- Menu -->
               <nav id="menu">   
                  <ul class="links">
                     <li><h5>로그인</h5></li>
                        <form action="LoginServiceCon.do" method="post">
                           <li><input type="text" name="loginemail" placeholder="Email을 입력하세요"></li>
                           <li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
                           <li><input type="submit" value="LogIn" class="button fit"></li>
                        </form>
                  </ul>
                  <ul class="actions vertical">
                     <li><h5>회원가입</h5></li>
                        <form action="JoinServiceCon.do" method="post">
                           <li><input id="inputemail" type="text" name="email" placeholder="Email을 입력하세요"> 
                           <button type="button" id="btn"> 아이디 중복체크 </button> </li>
                           <li> <p id="idcheck"> </p> </li>
                           <li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
                           <li><input type="text" name="tel" placeholder="전화번호를 입력하세요"></li>
                           <li><input type="text" name="address" placeholder="집주소를 입력하세요"></li>
                           <li><input type="submit" value="JoinUs" class="button fit"></li>
                        </form>
                  </ul>
               </nav>         
            <!-- Banner -->
               <section id="banner" class="major">
                  <div class="inner">
                     <header class="major">
                              <%if(info != null){ %>
                                 <h1> <%= info.getEmail() %>님 환영합니다. </h1>
                              <%}else{ %>
                                 <h1>로그인 한 세션아이디를 출력해주세요</h1>
                              <%} %>
                        <!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.
                            ex)smart님 환영합니다 -->
                     </header>
                     <div class="content">
                        <p>아래는 지금까지 배운 웹 기술들입니다.<br></p>
                        <ul class="actions">
                           <li><a href="#one" class="button next scrolly">확인하기</a></li>
                        </ul>
                     </div>
                  </div>
               </section>

            <!-- Main -->
               <div id="main">

                  <!-- One -->
                     <section id="one" class="tiles">
                        <article>
                           <span class="image">
                              <img src="images/pic01.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">HTML</a></h3>
                              <p>홈페이지를 만드는 기초 언어</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="images/pic02.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">CSS</a></h3>
                              <p>HTML을 디자인해주는 언어</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="images/pic03.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">Servlet/JSP</a></h3>
                              <p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="images/pic04.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">JavaScript</a></h3>
                              <p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="images/pic05.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">MVC</a></h3>
                              <p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
                           </header>
                        </article>
                        <article>
                           <span class="image">
                              <img src="images/pic06.jpg" alt="" />
                           </span>
                           <header class="major">
                              <h3><a href="#" class="link">Web Project</a></h3>
                              <p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
                           </header>
                        </article>
                     </section>
               <!-- Two -->
                     <section id="two">
                        <div class="inner">
                           <header class="major">
                              <h2>나에게 온 메세지 확인하기</h2>
                           </header>
                           <p></p>
                           <ul class="actions">
                           <%
                           /* 로그인을 했으면 메세지 출력 send_name, context, sendDate */
                           if (msglist != null) {
                        	/* for each문 : 확장 for문
                        	for(객체타입 변수명 : 배열) {} */
                        	for(MessageDTO mdto : msglist) {
                        		%>
                        		<li>
                        		<span><%= mdto.getSend_name() %></span>
                        		<span><%= mdto.getContent()%></span>
                        		<span><%= mdto.getSendDate() %> </span>
                        		</li>
                        		<% } %>                        		
                        	<% } else {%>
                        	
                                <li>로그인을 하세요.</li> 
                        		
                                <% } %>
                           
                           
                           <!-- 로그인 상태가 아니면 뜨도록 -->
                              <li><a href="#" class="button next scrolly">전체삭제하기</a></li>
                           </ul>
                        </div>
                     </section>

               </div>

            <!-- Contact -->
               <section id="contact">
                  <div class="inner">
                     <section>
                     <!-- content 용량 때문에 post방식을 사용 -->
                        <form action="MsgCon.do" method="post">
                        <div class="field half first">
                              <label for="name">Name</label>
                              <input type="text" name="send_name" id="name" placeholder="보내는 사람 이름" />
                           </div>
                           <div class="field half">
                              <label for="email">Email</label>
                              <input type="text" name="receive_email" id="email" placeholder="보낼 사람 이메일"/>
                           </div>

                           <div class="field">
                              <label for="message">Message</label>
                              <textarea name="content" id="message" rows="6"></textarea>
                           </div>
                           <ul class="actions">
                              <li><input type="submit" value="Send Message" class="special" /></li>
                              <li><input type="reset" value="Clear" /></li>
                           </ul>
                        </form>
                     </section>
                     
                     <section class="split">
                        <section>
                           <div class="contact-method">
                              <span class="icon alt fa-envelope"></span>
                              <h3>Email</h3>
                              <%if(info != null){ %>
                                 <a href="#"> <%= info.getEmail() %></a>
                              <%}else{ %>
                                 <a href="#">로그인 한 사람의 이메일을 출력</a>
                              <%} %>
                              <!-- 로그인 한 사용자의 이메일을 출력하시오 -->
                           </div>
                        </section>
                        <section>
                           <div class="contact-method">
                              <span class="icon alt fa-phone"></span>
                              <h3>Phone</h3>
                              <%if(info != null){ %>
                                 <span> <%= info.getTel() %></span>
                              <%}else{ %>
                                 <span>로그인 한 사람의 전화번호를 출력</span>
                              <%} %>
                              
                              <!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
                           </div>
                        </section>
                        <section>
                           <div class="contact-method">
                              <span class="icon alt fa-home"></span>
                              <h3>Address</h3>
                              <%if(info != null){ %>
                                 <span> <%= info.getAddress() %></span>
                              <%}else{ %>
                                 <span>로그인 한 사람의 집주소를 출력</span>
                              <%} %>
                              
                              <!-- 로그인 한 사용자의 집주소를 출력하시오 -->
                           </div>
                        </section>
                     </section>               
                  </div>
               </section>

            <!-- Footer -->
               <footer id="footer">
                  <div class="inner">
                     <ul class="icons">
                        <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
                        <li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
                     </ul>
                     <ul class="copyright">
                        <li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
                     </ul>
                  </div>
               </footer>

         </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         
         <script type="text/javascript">
            // 0. 아이디 중복체크 버튼을 클릭했을 때!
            $('#btn').on('click', function() {
               // 1. 입력한 email 가져오기
               let email = $('input[name=email]').val();
               console.log(email);

               // 2. ajax로 email 보내기(IdCheckServiceCon)
               $.ajax({
                  url : 'idcheckServiceCon.do', /* 어디로 보낼지 */
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
         
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="assets/js/main.js"></script>

   </body>
</html>
