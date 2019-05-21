<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style>
   .errMsg	
   {
      font-size: small;
      color: red;
      display: none;
   }
</style>

<script type="text/javascript">

	function sendIt()
	{
		var f = document.myForm;
		
		var name = document.getElementById("name");
		var nameMsg = document.getElementById("nameMsg");
		/* alert(name); */
		
		nameMsg.style.display = "none";
		
		if(!(name.value))
		{
			nameMsg.style.display = "inline";
			nameMsg.focus();
			return;
		}
		
		f.submit(); 
	}
</script>

</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="name" id="name">
					<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남자">남자
					</label>
					<label>
						<input type="radio" name="gender" id="female" value="여자">여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="idelType" id="idelType1" value="조정석">조정석
					</label>
					<label>
						<input type="checkbox" name="idelType" id="idelType2" value="공유">공유
					</label>
					<label>
						<input type="checkbox" name="idelType" id="idelType3" value="강다니엘">강다니엘
					</label>
					<label>
						<input type="checkbox" name="idelType" id="idelType4" value="아이유">아이유
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" style="width: 100%; font-size: 16pt;" class="btn">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>