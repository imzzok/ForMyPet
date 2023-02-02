<%@page import="java.text.DecimalFormat"%>
<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
	a, a:hover{
	color: #000000;
	text-decoration: none;}
</style>
 
<script type="text/javascript">
 
 
function fnPay(){
	alert("결제 기능을 지원하지 않습니다.");
}
 
function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href="remove.do";
	}
}
 
function fnGo(){
	location.href = "index.jsp";
}
</script>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
<%
ArrayList<CartDTO> cartList = new ArrayList<CartDTO>();
CartDAO cartDAO = new CartDAO();
cartList = cartDAO.selectCartList(userId);
%>	
	
<div align="center">
	<h2>장바구니 보기</h2><br><br>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품이름</th>
			<th>단가</th>
			<th>주문 수량</th>
			<th>가격</th>
		</tr>
<%
		if(cartList.size() == 0) {
%>
		<tr align='center'>
			<td colspan= '5'>
				장바구니에 담긴 상품이 없습니다.
				<a href= 'main.jsp'>주문하기</a>
			</td>
		</tr>
<%
		} else {
			int totalSum = 0, total = 0;
			DecimalFormat df = new DecimalFormat("￦#,##0");
			
			for(int i = 0; i < cartList.size(); i++) {
				CartDTO dto = cartList.get(i);
		%>
		<tr align= 'center'>
			<td><%=(i + 1) %></td>
			<td><%=cartList.get(i).getName() %></td>
			<td><%=df.format(cartList.get(i).getPrice()) %></td>
			<td><%=cartList.get(i).getCount() %></td>
			<% 
				total = cartList.get(i).getPrice() * cartList.get(i).getCount();
			%>
			<td><%=df.format(total) %></td>
		</tr>
		<% 
			totalSum += total;
		}
		%>
		<tr align = 'center'>
			<td colspan= '4'>
				<input type='button' value='결제하기' onclick='fnPay()' />
				<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
			</td>
		<td>
		 <%=df.format(totalSum) %>
		 </td>
			</tr>
		<% 
			}//if else
		%>
	</table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>