<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" media="screen, print"
	href="/resource/css/common/login/login.css">
</link>

<html>
<head>
<title>그룹웨어</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<link rel="stylesheet" type="text/css"
	href="/resource/css/dashboard/dashboard.css">
<script type="text/javascript" src="/resource/js/dashboard/dashboard.js"></script>
</head>

<body>
	
  <!-- 로그인 -->
  <section class="container-signin">
    <div class="form-box">
      <form id="loginform" method="post" action="">
        <div class="title">
          <img class="logo" src="/resource/img/logo_bk1.png" alt="테라에너지 로고">
          <h1 class="mb-2">로그인</h1>
          <p class="txt">환영합니다.<br>테라에너지 그룹웨어 TEWARE 입니다.</p>
        </div>

        <div class="form-floating inputId">
          <input type="email" class="form-control" id="loginId" name="loginId" placeholder="ID" required>
          <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating inputPassword">
          <input type="password" class="form-control input-pw"  id="password" name="password" placeholder="Password"required>
          <label for="floatingPassword">Password</label>
          <button class="eye"><img class="eye-img" src="/resource/img/eye-off-line.svg" alt=""></button>
        </div>

        <div class="checkbox mb-4">
          <label>
            <input type="checkbox" value="remember-me" required> 아이디 저장
          </label>
        </div>

        <div class="link find-pw">
          <!-- <a href="#none">비밀번호를 잊으셨나요?</a> -->
          <span>비밀번호 찾기는 담당자에게 문의해주세요.</span>
        </div>
        <div class="link signup">
          <a href="${root}/teware/register">신규가입하기</a>
        </div>
        <button class="w-100 btn btn-primary login-btn" type="submit" id="loginBtn">로그인</button>
      </form>
    </div>
  </section>
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