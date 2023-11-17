<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 변수 선언 및 값 할당
	int num1 = 3;

	// 페이지 영역에 값을 저장
	pageContext.setAttribute("num2", 4);
	pageContext.setAttribute("num3", "5");
	pageContext.setAttribute("num4", "8");
	
%>

<h2>변수 선언 및 할당</h2>
<!-- num1은 영역에 저장하지 않았으므로 EL언어로 출력되지 않음 -->
<p>스크립틀릿에서 선언한 변수 : ${num1 }</p>
<p>페이지 영역에 저장한 변수 : ${num2 }, ${num3 }, ${num4 }</p>

<!-- 3.0버전 부터 대입연산자를 이용하여 값을 대입할 수 있따. -->
<p>변수 할당 및 즉시 출력 : ${num1=7 }</p>
<p>변수 할당  : ${num2=8; "" }</p>
<p>할당된 값 출력 : ${num2 } </p>
<p>변수 할당  : ${num3=9; "" }</p>
<hr>

num1 - ${num1 }, num2 - ${num2 }, num3 - ${num3 }, num4 - ${num4 }
<hr>
<br />num1 + num2 = ${num1 + num2 }
<br />num1 - num2 = ${num1 - num2 }
<br />num1 * num2 =${num1 * num2 }
<br />num1 / num2 =${num1 / num2 }

<!-- 
	표현언어를 이용하면 산술연산시 자동으로 숫자로 변환
	(문자형태의 숫자를 숫자로 변환하여 연산)
 -->
 <hr>
<br />num3 + num4 = ${num3 + num4 }
<br />num3 - num4 = ${num3 - num4 }
<br />num3 * num4 = ${num3 * num4 }
<br />num3 / num4 = ${num3 / num4 }

<!-- 
	문자 형태의 연산자
	/ = div
	% = mod
 -->
 <hr>
<br />num3 div num4 = ${num3 div num4 }
<br />num3 mod num4 = ${num3 mod num4 }

<!-- 
	+ 연산자 : 문자열의 연결 시 오류 발생
	el표현언어에서 +연산자는 숫자와의 연산만 가능
 -->
 <hr>
 <br />${num1+"3"} 
<br />\${num1+"str" }

<hr>
 <h2>비교 연산자</h2>
 <!-- 문자 형태의 연산자 -->
 <!-- 문자 형태의 연산자를 사용하여 코드를 좀 더 직관적으로 작성할 수 있다. -->
 <br />num1==num4 : ${num1 eq num4 }
 <br />num1>num4 : ${num1 gt num4 }
 <br />num1 < num4 : ${num1 lt num4 }
 <br />num1>=num4 : ${num1 ge num4 }
 
  <br />num1>num4 : ${num1 > num4 }
  
  <hr>
  
  <h3>논리 연산자</h3>
  <br>num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4 }
  <br>num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4 }
  
  <br>num3 <= num4 && num3 == num4  : ${num3 <= num4 && num3 == num4 }
  <br>num3 >= num4 || num3 != num4  : ${num3 >= num4 || num3 != num4 }
 
 
</body>
</html>