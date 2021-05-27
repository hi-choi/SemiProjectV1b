<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <title>세미프로젝트v1-login</title>
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <style>
        #loginfrm{
            width:300px;
            margin : 120px auto;
        }
        #loginfrm div{margin-bottom:10px;}
        #loginfrm label{
            display:inline-block;
            width:115px;
            text-align: right;
            font-weight:bold;
        }
        button { margin-left:120px; width:75px;}
        input, button {padding:5px;}

    </style>

</head>
<body>
    <div id="wrap">
    <%@ include file="/layout/header.jsp" %>
    <div id="container">
        <h2>로그인</h2>
        <form name="loginfrm" id="loginfrm" method="post">
        <div id="login">
        <div><label for="userid"> 아이디&nbsp; </label><input type="text" name="userid" id="userid"></div>
        <div><label for="passwd">비밀번호&nbsp; </label><input type="password" name="passwd" id="passwd"></div>
        <div><button type="button" name="loginbtn" id="loginbtn">로그인</button></div>
        </div>
        </form>
    </div>
	<%@ include file="/layout/footer.jsp" %>
	</div>
	
	<script>
		// 로그인 버튼 클릭 이벤트 설정
		var loginbtn = document.getElementById('loginbtn');
		loginbtn.addEventListener("click", loginok);
		
		function loginok(){
			
			var frm = document.getElementById('loginfrm');
			if (frm.userid.value == '')
				alert('아이디를 입력하세요!');
			else if (frm.passwd.value=='')
				alert('비밀번호를 입력하세요!');
			else{
				frm.action = 'loginok.jsp';
				frm.submit();
			}
		}
	</script>
</body>
</html>