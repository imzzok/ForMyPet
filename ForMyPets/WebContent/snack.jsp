<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="product.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<script src="js/product.js"></script>

<title>VIEW AND BUY DOG SNACK</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>

<%
	String property = (String) session.getAttribute("property");
	ArrayList<ProductDTO> pInfoList = new ArrayList<ProductDTO>();
	pInfoList = (ArrayList<ProductDTO>) session.getAttribute("pInfoList");
%>
</head>
<body>

	<header>
		<%@ include file="header.jsp"%>
	</header>

	<script type="text/javascript">
	function fnCart(code, name, price) {
		if( '<%=userId%>' == 'null') {
				if (confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동할까요?")) {
					location.href = "login.do";
				}
			} else {
				if (confirm("장바구니에 담으시겠습니까?")) {
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

	<h2 align="center">Dogs Snack</h2>
	<br>
	
	<table border="1" width="1050" align="center">
		<tr align="center">
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('S', 'ALL');" checked="checked"><strong>전체</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('S', 'A');" <% if("A".equals(property)) {%> checked="checked" <%}%> ><strong>다이어트</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('S', 'B');" <% if("B".equals(property)) {%> checked="checked" <%}%> ><strong>피부</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('S', 'E');" <% if("E".equals(property)) {%> checked="checked" <%}%> ><strong>관절</strong>
			</td>
			<td>
				<input type="radio" name="property" onclick="javascript:fncSearchProduct('S', 'F');" <% if("F".equals(property)) {%> checked="checked" <%}%>><strong>소화</strong>
			</td>
		<tr>
	</table>
	
	<br>
	<table border="1" align="center">
		<%
			for (int i = 0; i < pInfoList.size(); i++) {
				if (i % 3 == 0) {
					out.println("<tr align='center'>");
				}
				out.println("<td>");
				out.println("<table>");
				out.println("<tr align='center'>");
				out.println("<td>");
				out.println("<img src = 'snackImg/" + pInfoList.get(i).getImgPath() + "' width='350' height='350' />");
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
				out.println("<button onclick=\"location.href='SnackIngre.do?page="+ i +"'\" >성분 보러가기</button>");
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
	<%@ include file="footer.jsp"%>

	<form id="productForm" method="post" action="">
		<input type="hidden" name="code" 	value="">
		<input type="hidden" name="name" 	value="">
		<input type="hidden" name="price" 	value="">
		<input type="hidden" name="category" value="">
		<input type="hidden" name="property" value="">		
	</form>
	
</body>
</html>