<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<!-- 회원가입 관련 스크립트 -->
<script src="js/join.js"></script>

<title>JOIN PAGE</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<div class="container">
		<div class="col-lg-4"></div>
		
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- <form method="post" action="joinAction.jsp"> -->
				<form id="joinForm" method="post" action="join.do">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary activate">
								<input type="radio" name="userGender" autocomplete="off" value="남자">남자
							</label>
							<label class="btn btn-primary activate">
								<input type="radio" name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					<!-- <input type="submit" class="btn btn-primary form-control" value="회원가입"> -->
					<input type="button" class="btn btn-primary form-control" value="회원가입" onclick="javascript:registValidate();">
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

<script type="text/javascript">

// 회원가입 입력항목 검증
function registValidate(){
	var f = document.getElementById('joinForm');
	
    if ( f.userId.value == null || f.userId.value == '' ) {
    	alert('ID를 입력해주세요');
    	return;
    }
	
    if ( f.userPassword.value == null || f.userPassword.value == '' ) {
    	alert('비밀번호를 입력해주세요');
    	return;
    }
    
    if ( f.userName.value == null || f.userName.value == '' ) {
    	alert('이름을 입력해주세요');
    	return;
    }
    
    if ( f.userEmail.value == null || f.userEmail.value == '' ) {
    	alert('이메일을 입력해주세요');
    	return;
    }
    
    if( document.querySelector('input[type=radio][name=userGender]:checked') == null ){
    	alert('성별을 선택해주세요.');
    	return;
    }
    
    f.submit();
}


</script>
</body>
</html>