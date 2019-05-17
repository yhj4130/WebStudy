<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeptInsertForm.jsp</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<style>
   .errMsg
   {
      font-size: small;
      color: red;
      display: none;
   }

</style>

<script type="text/javascript">
	
	function deptSubmit()
	{
		var deptForm = document.getElementById("deptForm");
		
		var dName = document.getElementById("dName");
		var loc = document.getElementById("loc");
		var nameMsg = document.getElementById("nameMsg");
		var locMsg = document.getElementById("locMsg");
		
		nameMsg.style.display = "none";
		locMsg.style.display = "none";
		
		if (dName.value == "")
		{
			nameMsg.style.display = "inline";
			dName.focus();
			return;
		}
		
		if (loc.value == "")
		{
			locMsg.style.display = "inline";
			loc.focus();
			return;
		}
		
		deptForm.submit();
	}
	
	function deptReset()
	{
		var deptForm = document.getElementById("deptForm");
		var dName = document.getElementById("dName");
		var nameMsg = document.getElementById("nameMsg");
		var locMsg = document.getElementById("locMsg");
		
		nameMsg.style.display = "none";
		locMsg.style.display = "none";
		
		deptForm.reset();
		
		dName.focus();
	}
	
</script>

</head>
<body>

<div  class="container"> 
	<h1>부서 명단 관리 및 입력 페이지</h1>
	<hr>
</div>


<div  class="container">
	<form action="DeptInsert.jsp" method="post" id="deptForm">
		<table>
			<tr>
				<th>부서이름(*)</th>
				<td>
					<input type="text" id="dName" name="dName">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">부서이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>지역명(*)</th>
				<td>
					<input type="text" id="loc" name="loc">
				</td>
				<td>
					<span class="errMsg" id="locMsg">지역명을 입력해야 합니다.</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:deptSubmit()"><button type="button" class="btn btn-primary btn-sm active">입력하기</button></a>	
		<a href="javascript:deptReset()"><button type="button"  class="btn btn-default btn-sm active">취소하기</button></a>
		<a href="DeptSelect.jsp"><button type="button" class="btn btn-primary btn-sm active">목록으로</button></a>
	</form>
</div>

</body>
</html>