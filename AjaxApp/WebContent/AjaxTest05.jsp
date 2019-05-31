<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#search
	{
		width: 500px;
	}
	#list
	{
		border: 1px solid gray;
		width: 500px;
		
		position: absolute;
		left: 68px;
		top: 134px;
		
		display: none;
	}
	#list .item
	{
		padding: 3px;
	}
	#list #footer
	{
		background-color: #DDD;
		text-align: right;
		padding: 5px;
		font-size: small;
	}
</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	// 키보드 누를 때 마다 그 때 까지의 입력된 단어를 서버로 전송하고,
	// 그에 맞는 추천 검색어를 받아올 수 있도록 처리
	function search()
	{
		// 데이터 수집
		var search = document.getElementById("search").value;
		
		// 테스트
		//alert(search);
		
		// 검색어가 있을 경우에만 전송할 수 있도록 처리
		if (search.replace(" ", "") == "")
		{
			document.getElementById("list").style.display = "none";
			return;
		}
		
		// 완성형 한글일 경우에만 검색 키워드 전송하기 → 정규 표현식 사용
		var regEx = /^[가-힣]{1,}$/;
		
		if(!regEx.test(search))
			return;
		
		// URL
		var url = "test05.do?search=" + search;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState==4)
			{
				if(ajax.status==200)                       
					callBack();	
			}
		}
		
		ajax.send("");
	}
	
	// 업무 내용
	//-- XML 목록으로 받아온 검색어들을
	//   적당한 리스트로 생성해서 화면에 출력
	function callBack()
	{
		// XML 문서 객체
		var doc = ajax.responseXML;
		//alert("test!!!");
		// XML 문서의 최상위 엘리먼트
		var root = doc.documentElement;
		
		var itemList = root.getElementsByTagName("word");
		document.getElementById("items").innerHTML = "";
		if(itemList.length==0)
			document.getElementById("items").innerHTML = "<div class='item'></div>";
			
		
		for(var i=0; i<itemList.length; i++)
		{
			var word = itemList[i].firstChild.nodeValue;
		
			document.getElementById("items").innerHTML += "<div class='item'>"+ word + "</div>"
		}
		
		document.getElementById("list").style.display = 'block';
	}

</script>

</head>
<body>

<div>
	<h1>추천 검색어 실습</h1>
	<hr>
</div>

<div>	
	검색어
	<input type="text" id="search" class="control" placeholder="검색어를 입력하세요." onkeyup="search()">
</div>

<!-- 
<div id="list">
	<div id="items">
		<div class="item">가사</div>
		<div class="item">가위</div>
		<div class="item">가지</div>
		<div class="item">가방</div>
		<div class="item">가방끈</div>
		<div class="item">가방끈 매듭</div>
		<div class="item">가방끈 매듭 풀기</div>
		<div class="item">가방끈 매듭 만드는 법</div>
		<div class="item">가장자리 다듬기</div>
		<div class="item">가차없이</div>
	</div>	
	<div id="footer">
		추천 검색어
	</div>
</div>
 -->

<div id="list">
	<div id="items">
		<div class="item"></div>
	</div>	
	<div id="footer">
		추천 검색어
	</div>
</div>

</body>
</html>