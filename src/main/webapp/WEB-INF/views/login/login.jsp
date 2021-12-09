<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" media="screen, print" href="/resource/css/common/login/login.css"> </link>

<html>
<head>
  <title>그룹웨어</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- 공통 컴포넌트 인클루드 -->
  <jsp:include page="/WEB-INF/views/common/include/link.jsp" />

  <link rel="stylesheet" type="text/css" href="/resource/css/dashboard/dashboard.css">
  <script type="text/javascript" src="/resource/js/dashboard/dashboard.js"></script>
</head>

<body id="login">
  
<main class="form-signin">
  <form id="loginform" method="post" action="">
    <!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
    <h1 class="h3 mb-3 fw-normal">sign in</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="loginId" name="loginId" placeholder="ID">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="button" id="loginBtn">Sign in</button>
    
    
  </form>
</main>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			if ($("#userid").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else if ($("#userpwd").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				$("#loginform").attr("action", "${root}/teware/loginChk").submit();
			}
		});

	});
</script>
</html>