<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
 
 <%-- 
<style>
    .check{display: none;}
</style>
--%>   


<script type="text/javascript">
window.onload = function(){
	console.log('onload event 발생');
	/*
		변수선언
		var - 변수의 중복 선언이 가능
		let - 지역변수, 중복선언 불가능
		const - 지역상수, 중복선언 불가능
	*/

	
	let Iddupli = document.querySelector("#Iddupli"); // 중복 id값 검사
	let id = document.getElementById('ID'); // 중복 id값 검사
	
	Iddupli.addEventListener('click', () => {
		console.log('중복확인 합니다');
		joinForm.action="/IdDuplicationCheck?id="+id.value; // 요청 url 설정
		joinForm.method="post"; // 메소드 방식
		joinForm.submit(); // 요청 url 설정
	});

	/*
	joinBtn.addEventListener('click', () => {
		console.log('회원 가입버튼이 눌렸습니다.0');
		joinForm.action="/Join"; // 요청 url 설정
		joinForm.method="post"; // 메소드 방식
		joinForm.submit(); // 요청 url 설정
	})
	*/
	let joinBtn = document.querySelector("#joinBtn");
	joinBtn.addEventListener('click', validation);
	
}


// 아이디 유효성 검사
function validateUserId(id) {
    // 정규표현식을 사용하여 영어와 숫자만 허용
    let pattern = /^[a-zA-Z0-9]+$/;
    if (!pattern.test(id)) {
        return true;
    }
    return false;
}

// 이메일 유효성 검사
function validateUserEmail(email) {
    let pattern = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/;
    if (!pattern.test(email)) {
        return true;
    }
    return false;
}



function validation() {
	if(ID.value==""){
		alert("아이디를 입력해주세요");
		return false;
	} else if(validateUserId(ID.value)){
		alert("ID는 영어, 숫자만 입력가능합니다.");
		return false;
	} else if(ID.value.length>10){
		alert("아이디의 길이는 10자를 초과할 수 없습니다.");
		return false
	}
	
	let name = document.getElementById('Name');
	if(name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}
	
	if(name.value.length > 10){
		alert("이름의 길이는 15자를 초과할 수 없습니다.");
		return false;
	}
	
	if(Email.value == ""){
		alert("이메일을 입력해주세요");
		return false;
	} else if (validateUserEmail(Email.value)){
		alert("이메일 형식이 일치하지 않습니다.");
		return false;
	}
	
	let pw = document.getElementById('InputPassword');
	if(pw.value == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	joinForm.action = "/Join";
	joinForm.method="post";
	joinForm.submit();
	
}

function getByteLength(str){
	
	// 객체 생성
	var encoder = new TextEncoder('utf-8');
	
	// 문자열을 바이트 배열로 인코딩
	var encoded = encoder.encode(str);
	
	// 바이트 배열의길이 반환
	return encoded.length;
}


</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                   
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            
                             <%
                    			if("1".equals(request.getParameter("err"))){
                    				out.print("<script>");
                    				out.print("alert('중복된 id입니다.')");
                    				out.print("</script>");
                    			} 
                    			/*else if ("2".equals(request.getParameter("err"))){
                    				out.print("<script>");
                    				out.print("alert('비밀번호가 일치하지 않습니다 확인해주세요')");
                    				out.print("</script>");
                    			} */
                    			else if ("3".equals(request.getParameter("err"))){
                    				out.print("<script>");
                    				out.print("alert('회원가입 성공!')");
                    				out.print("</script>");
                    			}
                   			 %>
                            
                            
                            <form class="user" name="joinForm">
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="ID"
                                            placeholder="ID" name="id">
                                     </div>
 
                                     <div class="col-sm-6 mb-3 mb-sm-0">
                                     <button type="button" class="btn btn-dark btn-user btn-block" id="Iddupli" name="Iddupli">중복확인</button>
                                     </div>
                                </div>
                                
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="Name"
                                            placeholder="Name" name="name">
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="Email"
                                        placeholder="Email" name="email">
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="InputPassword" placeholder="Password" name="pw" oninput="pwvalidation()">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="RepeatPassword" placeholder="Repeat Password" name="re_pw" oninput="pwvalidation()">
                                    </div> 
                                </div>
                                <div class="form-group" id="inputValid">
                                </div>
                                
                              	<!-- 비밀번호 확인 시 이 상자가 나왔으면 좋겠다... -->	
                              	<%--
                                <div class="form-group " id="pwvalidcheck">
 							 	<input type="text" value="correct value" class="form-control is-valid" 
 							 		id="inputValid">
                                </div>
                                --%>
                                <a class="btn btn-primary btn-user btn-block" id="joinBtn" name="joinBtn">가입하기</a>
                                
                                
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>


<script type="text/javascript">
function pwvalidation(){
	if(document.getElementById('InputPassword').value == document.getElementById('RepeatPassword').value 
			&& "" != document.getElementById('InputPassword').value 
			&& "" != document.getElementById('RepeatPassword').value) {
		// document.getElementById('inputValid').style.display = 'block';
			 document.getElementById('inputValid').innerHTML = "비밀번호가 일치합니다 (* ￣3)(ε￣ *) ";

			
		} else {
			  // document.getElementById('inputValid').style.display = 'none';
			document.getElementById('inputValid').innerHTML = "비밀번호가 일치하지 않습니다. ━┳━　━┳━ ";

		}
	}
</script>
</html>