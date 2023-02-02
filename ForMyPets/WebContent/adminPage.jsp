<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="js/admin.js"></script>

<title>ADMIN PAGE</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>

	<%
		String removeUserYn = null;
		
		userId = (String) session.getAttribute("userId");	
		removeUserYn = (String) session.getAttribute("removeUserYn");	
	%>
	
	<script>
	window.onload = function() {
		  if( '<%=removeUserYn%>' == 'Y'){
			  alert('<%=userId%> 회원 삭제 완료.');
		  }else if( '<%=removeUserYn%>' == 'N'){
			  alert('<%=userId%> 회원 삭제 실패.');
		  }
		  <%
		  	session.removeAttribute("removeUserYn");
		  %>
	}
	</script>

	<div class="container">
		<div class="row">
			<!--  홀수와 짝수로 색상이 변경됨 -->
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<!-- thead : 테이블의 제목부분 각각의 속성들을 알려주는 역할을 합니다. -->
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">사용자ID</th>
						<th style="background-color: #eeeeee; text-align: center;">성명</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">권한</th>
					</tr>

				</thead>
				<tbody>
				<%
					UserDAO userDao = new UserDAO();
					ArrayList<UserDTO> list = userDao.userInfoList();
					if(list.size() > 0){ // 1건 이상일 경우(회원이 있을 경우)
						for (int i = 0; i < list.size(); i++) {
				%>		
						<tr>
							<td><%=list.get(i).getUserId()%></td>
							<td><%=list.get(i).getUserName()%></td>
							<td><%=list.get(i).getUserGender()%></td>
							<td><%=list.get(i).getUserEmail()%></td>
							<td><input type="button" class="btn btn-primary form-control" value="회원삭제" onclick="javascript:removeUser('<%=list.get(i).getUserId()%>');"></td>
						</tr>
				<%		
						} // for 반복문
					
					}else { // 회원정보가 존재하지 않을 경우
				%>
						<tr>
							<td colspan="5">회원 정보가 존재하지 않습니다.</td>
						</tr>				
				
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>

	<form id="userInfoForm" method="post" action="userMgnt.do">
		<input name="removeUserId" type="hidden">
	</form>

	<script src="https://code.jquery.com/jquery-1.11.3.js"
		integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
		
		</script>
	<%@ include file="footer.jsp"%>
</body>
</html>