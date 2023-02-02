<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	AnimalAPI AnimalApi = new AnimalAPI();
	ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
	list = AnimalApi.RequestAnimal();
	// 받아온 list pageContext로 page영역에 담기
	pageContext.setAttribute("list", list);
	
%>
<title>map</title>
<style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; bRox-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
     .overlay_home {display: block; background: orange!important; background: orange!important url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    
    .overlay_info .desc {padding:2px;position: relative; min-width: 190px; height: 56px}
    .overlay_info .address {font-size: 9px; color: #333; position: absolute; left: 10px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style>
<c:set var="list" value="<%=list%>"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=bcc30a3677d45cf7a5e530dd5b8566de&libraries=services,Clusterer,drawing"></script>
<!-- 화면 최적화 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
주소 검색 : 
<input type="text" id="searchAddress" name="place" readonly><br><br>
</div>
<div id="map" style="width:100%;height:500px;"></div>
<script type="text/javascript">
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
		center: new kakao.maps.LatLng(37.566400714093,126.97853918975), // 지도의 중심좌표
		level:7 // 지도의 확대 레벨
	};
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	// 지도를 생성합니다
	let map = new kakao.maps.Map(mapContainer, mapOption); 
	let positions= new Array();
	
	let userAddress = "${user.place}";
	
	<c:forEach items="${list}" var="list" varStatus="status">
		let map${status.index} = new Map();
		map${status.index}.set("address",'${list.address}');
		map${status.index}.set("text",'${list.text}');
		positions.push(map${status.index});
	</c:forEach>
	
	
	for (let i = 0; i < positions.length; i ++) {
		// 주소-좌표 변환 객체를 생성합니다
		let geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(positions[i].get('address'), function(result, status) {
			// 정상적으로 검색이 완료됐으면 
			 if (status === kakao.maps.services.Status.OK) {
				let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				// 마커에 표시할 인포윈도우를 생성합니다 
					let infowindow = new kakao.maps.InfoWindow({
					//content: positions[i].content // 인포윈도우에 표시할 내용
					content: '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].text+'</div>' // 인포윈도우에 표시할 내용
				});
				
				
				
				
		
					//커스텀 오버레이에 표시할 내용입니다
					//HTML 문자열 또는 Dom Element 입니다
					var content = '<div class="overlay_info">';
					content += '    <a><strong>' + positions[i].get('text') + '</strong></a>';
					content += '    <div class="desc">';
					content += '        <span class="address">' + positions[i].get('address') + '</span>';
					content += '    </div>';
					content += '</div>';
	
	
					//커스텀 오버레이를 생성합니다
					var mapCustomOverlay = new kakao.maps.CustomOverlay({
					 position: coords,
					 content: content,
					 xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
					 yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
					});
	
					//커스텀 오버레이를 지도에 표시합니다
					mapCustomOverlay.setMap(map);
				//infowindow.open(map, marker);
			
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			} 
	
		});   
	}
	
	// 주소-좌표 변환 객체를 생성합니다
	let geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(userAddress, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
			let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			console.log(coords);
			// 마커에 표시할 인포윈도우를 생성합니다 
				let infowindow = new kakao.maps.InfoWindow({
				//content: positions[i].content // 인포윈도우에 표시할 내용
				content: '<div style="width:150px;text-align:center;padding:6px 0;">'+userAddress+'</div>' // 인포윈도우에 표시할 내용
			});
			
			
			
			
	
				//커스텀 오버레이에 표시할 내용입니다
				//HTML 문자열 또는 Dom Element 입니다
				var content = '<div class="overlay_info">';
				content += '    <a class="overlay_home"><strong>우리집</strong></a>';
				content += '    <div class="desc">';
				content += '        <span class="address">' + userAddress + '</span>';
				content += '    </div>';
				content += '</div>';


				//커스텀 오버레이를 생성합니다
				var mapCustomOverlay = new kakao.maps.CustomOverlay({
				 position: coords,
				 content: content,
				 xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
				 yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
				});

				//커스텀 오버레이를 지도에 표시합니다
				mapCustomOverlay.setMap(map);
				map.setCenter(coords);
			//infowindow.open(map, marker);
		
			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		} 

	});  

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("searchAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생.
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("searchAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=place]").focus(); //상세입력 포커싱

            	// 주소-좌표 변환 객체를 생성합니다
            	let geocoder = new kakao.maps.services.Geocoder();
            	// 주소로 좌표를 검색합니다
            	geocoder.addressSearch(data.address, function(result, status) {
            		// 정상적으로 검색이 완료됐으면 
            		 if (status === kakao.maps.services.Status.OK) {
            			let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            			console.log(coords);
            			// 결과값으로 받은 위치를 마커로 표시합니다
            			let marker = new kakao.maps.Marker({
            				map: map,
            				position: coords
            			});
            			// 마커에 표시할 인포윈도우를 생성합니다 
            				let infowindow = new kakao.maps.InfoWindow({
            				//content: positions[i].content // 인포윈도우에 표시할 내용
            				content: '<div style="width:150px;text-align:center;padding:6px 0;">'+userAddress+'</div>' // 인포윈도우에 표시할 내용
            			});
            			map.setCenter(coords);
            			//infowindow.open(map, marker);
            		
            			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            		} 

            	});  
            }
        }).open();
    });
}

	</script>
	<script src="https://code.jquery.com/jquery-1.11.3.js"
			integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
			crossorigin="anonymous"></script>
	<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous"></script>
<%@ include file="footer.jsp" %>	
</body>
</html>