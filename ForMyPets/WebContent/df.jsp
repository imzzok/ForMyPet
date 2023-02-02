<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="product.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>

<%
	String property = (String) session.getAttribute("property");
	ArrayList<ProductDTO> pInfoList = new ArrayList<ProductDTO>();
	pInfoList = (ArrayList<ProductDTO>) session.getAttribute("pInfoList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="js/product.js"></script>

<title>VIEW AND BUY DOG FOOD</title>
<style>
img {
	display: block;
	margin: 0px auto;
}
</style>
				
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	
	<script type="text/javascript">
	function fnCart(code, name, price) {
		if( '<%=userId%>' == 'null' ){
			if(confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동할까요?")) {
				location.href = "login.do";
			}
		}else {
			if(confirm("장바구니에 담으시겠습니까?")) {
				var f = document.getElementById('productForm');
		        f.action = 'cart.do';
		        f.code.value = code;
		        f.name.value = name;
		        f.price.value = price;
		        f.submit();
			}
		}
	}
	</script>

	<h2 align='center'>Dogs Food</h2>
	<br>
	<table border="1" width="1050" align='center'>
		<tr align="center"> 
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('F', 'ALL');" checked="checked"><strong>전체</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('F', 'A');" <% if("A".equals(property)) {%> checked="checked" <%}%> ><strong>다이어트</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('F', 'B');" <% if("B".equals(property)) {%> checked="checked" <%}%>><strong>피부</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('F', 'C');" <% if("C".equals(property)) {%> checked="checked" <%}%>><strong>저알러지</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('F', 'D');" <% if("D".equals(property)) {%> checked="checked" <%}%>><strong>고단백</strong>
			</td>
		<tr>
	</table>
	
	<br>
	<table border="1" align='center'>
		<%
		for (int i = 0; i < pInfoList.size(); i++) {
			if (i % 3 == 0) {
				out.println("<tr align='center'>");
			}
			out.println("<td>");
			out.println("<table>");
			out.println("<tr align='center'>");
			out.println("<td>");
			out.println("<img src = 'foodImg/" + pInfoList.get(i).getImgPath() + "' width='350' height='350' />");
			out.println("</td>");
			out.println("</tr>");

			out.println("<tr align='center'>");
			out.println("<td>");
			out.println("<b>" + pInfoList.get(i).getName() + "</b>");
			out.println("</td>");
			out.println("</tr>");

			out.println("<tr align='center'>");
			out.println("<td>");
			out.println("<b>￦" + pInfoList.get(i).getPrice() + "원</b>");
			out.println("</td>");
			out.println("</tr>");
			
			out.println("<tr align='center'>");
			out.println("<td>");
			out.println("<b>" + " " + "<br>");
			out.println("</td>");
			out.println("</tr>");

			out.println("<tr align='center'>");
			out.println("<td>");
			//두 줄로 쓰기, 닫는 큰 따옴표와 괄호 옆의 띄어쓰기 필수
			out.println("<input type='button' value='장바구니 담기' ");
			out.println("onclick='fnCart(\"" + pInfoList.get(i).getCode() + "\", \"" + pInfoList.get(i).getName() + "\", \"" + pInfoList.get(i).getPrice() + "\")' />");
			out.println("</td>");
			out.println("</tr>");
			
			out.println("<tr align='center'>");
			out.println("<td>");
			out.println("<b>" + " " + "<br>");
			out.println("</td>");
			out.println("</tr>");
			
			out.println("<tr align='center'>");
			out.println("<td>");
			//두 줄로 쓰기, 닫는 큰 따옴표와 괄호 옆의 띄어쓰기 필수
			out.println("<button onclick=\"location.href='FoodIngre.do?page="+ i +"'\" >성분 보러가기</button>");
			
			
			out.println("</td>");
			out.println("</tr>");
			
			out.println("</table>");
			out.println("</td>");
			if (i % 3 == 2) {
				out.println("</tr>");
			}
		}
		%>
		</table>
		
		
		<%@ include file="footer.jsp" %>	
		<script src="https://code.jquery.com/jquery-1.11.3.js"
			integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
			crossorigin="anonymous"></script>

		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous"></script>


	<form id="productForm" method="post" action="">
		<input type="hidden" name="code" value="">
		<input type="hidden" name="name" value="">
		<input type="hidden" name="price" value="">
		<input type="hidden" name="category" value="">
		<input type="hidden" name="property" value="">
	</form>	
	
</body>
</html>