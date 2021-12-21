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

<body id="register">

	<!-- 가입인증 -->
	<section class="container-signin certi">
		<div class="form-box">
			<form>
				<div class="title">
					<img class="logo" src="/resource/img/logo_bk1.png" alt="테라에너지 로고">
					<h1 class="mb-2">가입인증</h1>
					<p class="txt">관리자가 보낸 인증번호를 입력해주세요.</p>
				</div>

				<div class="form-floating">
					<input type="text" class="form-control" placeholder="인증번호">
					<label for="floatingInput">인증번호</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" placeholder="이름"> <label
						for="floatingInput">이름</label>
				</div>
				<div class="form-floating">
					<input type="tel" class="form-control" placeholder="전화번호">
					<label for="floatingInput">전화번호</label>
				</div>

				<button class="btn btn-primary reg-btn" type="button"
					onclick="location.href='/teware/dashboard'">계정생성</button>
				<span class="sub-txt">클릭 시 신규가입 화면으로 이동합니다.</span>
			</form>
		</div>
	</section>
</body>

<script type="text/javascript">
	
</script>
</html>