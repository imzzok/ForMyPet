<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/footer.css">
<title>FORMYPETS HOME</title>
   <style>
         img { display: block; margin: 0px auto; }
   </style>
</head>
<body>
   <header>
      <%@ include file="header.jsp" %>
   </header>
   
   <!-- 일반적으로 웹사이트를 소개하는 영역이 있는데 부트스랩에서 jumbotron이라고 사용을 합니다. -->
   <div class="container">
      <div class="jumbotron">
         <div class="container">
            <h3><strong>내 아이들</strong>에게 <strong>좋은것</strong>만 선물해주세요 !</h3>
            <p> <strong>좋은 성분</strong>의 제품만을 보여드리는 저희 <strong>ForMyPets</strong>에 오신 것을 환영합니다. </p>
            <a class="btn btn-primary btn-pull" href="product.do?category=F" role="button">좋은 사료 보러가기</a>
            <a class="btn btn-primary btn-pull" href="product.do?category=S" role="button">좋은 간식 보러가기</a>
         </div>
      </div>
   </div>
   <!-- carousel은 사진첩 같은거라고 생각 하시면 됩니다. -->
   <div class="container">
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
         </ol>
        
         <div class="carousel-inner">
            <div class="item active" > <!-- active 현재 선택 -->
               <img src="img/1.png" width="500px;" height="auto;" />
            </div>
            <div class="item">
               <img src="img/2.jpg" width="500px;" height="auto;"/>
            </div>
            <div class="item">
               <img src="img/3.jpg" width="500px;" height="auto;"/>
            </div>
         </div>
         
         <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"></span>
         </a>
         <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"></span>
         </a>
      </div>
   </div>
   <br> <br> <!-- 유튜브 -->
         <p align="middle">
         <iframe width="1100" height="500" 
         src="https://www.youtube.com/embed/EoCHFUIT14Q" title="YouTube video player" 
         frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
         allowfullscreen></iframe>
         </p>
   
   <%@ include file="footer.jsp" %>

      <script src="https://code.jquery.com/jquery-1.11.3.js"
         integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
         crossorigin="anonymous"></script>
      <script
         src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
         integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
         crossorigin="anonymous"></script>

<%
   String loginYn = null;
   String logout = null;
   loginYn = (String) session.getAttribute("loginYn");
   logout = (String) session.getAttribute("logout");
%>


<%--JSP의 경우 자바코드(스크립틀릿)를 우선 수행한 후 HTML문법을 수행(자바스크립트 포함) --%>
<script>
// 화면이 전부 로딩된 후 마지막에 수행
window.onload = function() {
     if( '<%=loginYn%>' == 'Y'){
        alert('<%=userId%>님 환영합니다.');
     }else if( '<%=loginYn%>' == 'N'){
        alert('로그인 실패');
     }
     
     if( '<%=logout%>' == 'Y'){
        alert('로그아웃 되었습니다.');
     }
     
     <%
        session.removeAttribute("loginYn");
      session.removeAttribute("logout");
     %>
}
</script>
</body>
</html>