<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<header>
   <!--  로그인이 된 사람은 로그인정보를 담을 수 있도록 만들어 주겠습니다. -->
   <%
      String userId = null;
      String adminYn = null;
      if (session.getAttribute("userId") != null) {
         userId = (String) session.getAttribute("userId");
         adminYn = (String) session.getAttribute("adminYn");
      }
   %>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="index.jsp"><strong>ForMyPets</strong></a>
      </div>
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="product.do?category=F"><strong>사료</strong></a></li>
            <li><a href="product.do?category=S"><strong>간식</strong></a></li>
            <li><a href="map.jsp"><strong>동물병원 지도</strong></a></li>
         </ul>

         <%
            //로그인이 되어 있지 않다면
            if (userId == null) {
         %>
         <ul class="nav navbar-nav navbar-right">
                  <li><a href="login.do"><strong>로그인</strong></a></li>
                  <li><a href="join.do"><strong>회원가입</strong></a></li>
               </ul>
      
         <%
            } else {
         %>
         <ul class="nav navbar-nav navbar-right">
                  <li><a href="logout.do"><strong>로그아웃</strong></a></li>
                  <li><a href="CartView.jsp"><strong>장바구니</strong></a></li>
                  <%
                     if( adminYn == "Y"){
                  %>
                     <li><a href="adminPage.jsp"><strong>회원관리</strong></a></li>
                  <%
                     }
                  %>      
               </ul>
         <%
            }
         %>

      </div>
   </nav>
</header>
<script src="https://code.jquery.com/jquery-1.11.3.js"
         integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
         crossorigin="anonymous"></script>
      <script
         src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
         integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
         crossorigin="anonymous"></script>