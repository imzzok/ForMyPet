<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>LOGIN PAGE</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<div class="container">
		<div class="col-lg-4"></div>
		
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form id="loginForm" method="post" action="login.do">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="button" class="btn btn-primary form-control" value="로그인" onclick="javascript:loginValidate();">
				</form>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp" %>

<script
  src="https://code.jquery.com/jquery-1.11.3.js"
  integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%
	String loginYn = null;
	loginYn = (String) session.getAttribute("loginYn");	
%>

<script>
window.onload = function() {
	  if( '<%=loginYn%>' == 'N'){
		  alert('로그인 실패');
	  }
}

function loginValidate() {
    
	var f = document.getElementById('loginForm');
	
    if ( f.userId.value == null || f.userId.value == '' ) {
    	alert('ID를 입력해주세요');
    	return;
    }
	
    if ( f.userPassword.value == null || f.userPassword.value == '' ) {
    	alert('비밀번호를 입력해주세요');
    	return;
    }
    
    f.submit();
}

</script>

</body>
</html>