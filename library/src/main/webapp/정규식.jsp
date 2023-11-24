<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
	.areal{
		border : 1px solid;
		width : 500px;
		height : 300px;
		overflow : scroll;
	}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
window.onload =function(){
btn1.addEventListener('click', ()=>{
	// 정규식 : 패턴 생성
	// 전화번호 숫자 3 - 4 - 4
	// 영대소문자, 몇가지 기호(.$)@영문자.영문자
	
	
	
	// alert('버튼이 클릭되었습니다.');
	// 생성자를 이용한 정규 표현식 객체 생성
	// 매개값 : 패턴 문자열
	let regExp = new RegExp('script');
	// 문자열 확인, 타입확인, 형변환가능
	console.log(regExp, typeof(regExp), regExp instanceof RegExp);
	
	// 리터럴을 이용한 정규 표현식 객체 생성
	// 패턴 양쪽에 /로 작성한다(시작 기호, 종료 기호)
	let regExl = /script/;	
	console.log(regExl, typeof(regExl), regExl instanceof RegExp);
	
	/*
    RegExp 객체에서 제공하는 메소드
        객체.test(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false를 리턴한다.
        객체.exec(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 처음 매치된 문자열 리턴한다.
    */ 
    
    let str1 = "javascript jquery ajax";
    let str2 = "java jquery ajax";
    regExp.test(str1);
    regExp.test(str2);
    
    area1.innerHTML = "regExp.test(str1) : " + regExp.test(str1)+"<br>";
    area1.innerHTML += "regExp.test(str2) : " + regExp.test(str2)+"<br>";
    
    /*
    	숫자 : \d
    	+ : 1개 이상
    	$ : 문자열의 끝을 의미
    */

    let num1 = /\d+/; // 숫자가 1개이상 나왔다
    let num2 = /\d+$/; // 숫자가 1개이상 나왔다
    
    area1.innerHTML += "num1.test(sss) : " + num1.test('sss')+"<br>";
    area1.innerHTML += "num1.test(1ss) : " + num1.test('1ss')+"<br>";
    area1.innerHTML += "num1.test(ss1234) : " + num1.test('ss1234')+"<br>";
    area1.innerHTML += "num1.test(한국어) : " + num1.test('한국어')+"<br>";
    
    area1.innerHTML += "num2.test(sss) : " + num2.test('sss')+"<br>";
    area1.innerHTML += "num2.test(1ss) : " + num2.test('1ss')+"<br>";
    area1.innerHTML += "num2.test(ss1234) : " + num2.test('ss1234')+"<br>";
    area1.innerHTML += "num2.test(한국어) : " + num2.test('한국어');

    /*
    	전화번호 체크
    	숫자 3개 - 숫자 4개 - 숫자 3개
    */
    
    let num3 = /\d{3}-\d{4}=\d{4}$/;
    console.log('phone : ', num3.test('000-0000=0000'));
    console.log('phone : ', num3.test('00-0000-0000'));
    console.log('phone : ', num3.test('000-00-0000'));
    console.log('phone : ', num3.test('0000-0000-000'));
    
    
    /*
    	^ : 시작
    	$ : 종료
    	\w : 알파벳 문자와 숫자
    	\.- : . or -
    
    	[영대소문자, 숫자, ., -] 한번 이상 @ [영대소문자, 숫자, . -] 한번이상 영대소문자 2번이상
    */
    
    let email = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
    console.log('email : ', email.test('email.efr-@12.cO'));
    console.log('email : ', email.test('ema-il.efr-@12.cO'));
    console.log('email : ', email.test('email.efr-12.cO'));
   
    
    
	
	// 박스안에 출력
	/*
	area1.innerHTML="<table>"
		+"<tr>"
		+"<td>test1</td>"
		+"<td>test2</td>"
		+"<td>test3</td>"
		+"</tr>"
		+"</table>";
		*/
});
};
</script>

<h1>정규 표현식</h1>
    <p>
        정규 표현식(Regular Expresison)이란, <br>
        특정 규칙을 가진 문자열을 검색하거나 치환할 때 사용하는 형식 언어이다. <br><br>

        정규 표식을 이용하면 입력된 문자열에 대해 특정 조건 검색이나 치환 시
        복잡한 조건을 제시할 필요 없이 간단하게 처리가 가능하다.
    </p> 
    
    <h2>1. 정규 표현식 객체 생성</h2>
    
    <p>
        정규 표현식 객체를 생성하기 위해서는 정규 표현식 리터럴과 RegExp 생성자 함수를 사용한다. <br>
        리터럴을 사용하는 것이 일반적이다. (/패턴/플래그)
    </p>
    
    <button id="btn1">버튼!</button>
    <div id="area1" class="area1">
    </div>
</body>
</html>