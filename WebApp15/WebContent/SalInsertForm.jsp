<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalInsertForm.jsp</title>
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


   function salSubmit() 
   {
      var salForm = document.getElementById("salForm");
      
      var losal = document.getElementById("losal");
      var hisal = document.getElementById("hisal");
      
      var losalMsg = document.getElementById("losalMsg");
      var hisalMsg = document.getElementById("hisalMsg");
      
      losalMsg.style.display = "none";
      hisalMsg.style.display = "none";
      
   
      if(losal.value=="" || isNaN(losal.value) || Number(losal.value)<0 || Number(losal.value)> Number(hisal.value))
      {
         losalMsg.style.display = "inline";
         losal.focus();
         return;
      }
      
      if(hisal.value=="" || isNaN(hisal.value) || Number(hisal.value)<0 || Number(hisal.value) < Number(losal.value))
      {
         hisalMsg.style.display = "inline";
         hisal.focus();
         return;
      }
      
      salForm.submit();
   }
   
   function salReset()
   {

      var SalForm = document.getElementById("salForm");
      
      var losal = document.getElementById("losal");
      var hisal = document.getElementById("hisal");
      
      var losalMsg = document.getElementById("losalMsg");
      var hisalMsg = document.getElementById("hisalMsg");
      
      losalMsg.style.display = "none";
      hisalMsg.style.display = "none";
   
      // form 을 직접 지정하여 reset 액션 수행
      SalForm.reset();
      losal.focus();
   }
   
</script>

</head>
<body>


<!-- http://localhost:8090/WebApp13/SalInsertForm.jsp -->
<div class="container">
   <h1>급여 등급 관리 및 입력 페이지</h1>
   <hr>
</div>

<div class="container">
   <!-- 급여 등급 입력 폼 구성  -->   
   <form action="SalInsert.jsp" method="post" id="salForm">
      <table class= "table table-bordered">
         <tr>
            <th>최저급여</th>
            <td>
               <input type="text" id="losal" name="losal" class="txtSal">
               <span class="errMsg" id="losalMsg">
                  0 이상, 최고급여 이하의 급여를 입력해야 합니다.
               </span>
            </td>      
         </tr>
            <tr>
            <th>최고급여</th>
            <td>
               <input type="text" id="hisal" name="hisal" class="txtSal">
               <span class="errMsg" id="hisalMsg">
                  0 이상, 최저급여 이상의 급여를 입력해야 합니다.
               </span>
            </td>
         </tr>
      </table>
      <br>
      <a href="javascript:salSubmit()"><button type="button"  class='btn btn-primary btn-sm active'>입력하기</button></a>
      <a href="javascript:salReset()"><button type="button"  class='btn btn-default btn-sm active'>취소하기</button></a>
      <a href="SalSelect.jsp"><button type="button" class='btn btn-primary btn-sm active'>목록으로</button></a>
   </form>
</div>


</body>
</html>