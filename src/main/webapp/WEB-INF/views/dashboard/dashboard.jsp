<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>그룹웨어</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<!-- 개별 대시보드 페이지 컴포넌트 -->
<link rel="stylesheet" type="text/css"
	href="/resource/css/dashboard/dashboard.css">

</head>

<body id="main">

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

	<main class="dashboard">
		<!-- content -->
		<section class="contents">
			<div class="container">
				<div class="row gx-2">

					<!-- session_1 -->
					<div class="col-2">
						<div class="navbar navbar-vertical navbar-expand-xl navbar-light">
							<!-- session 1 오늘 날짜 -->
							<div class="now_time">
								<jsp:include page="/WEB-INF/views/dashboard/api/now_time.jsp" />
							</div>

							<!-- session 1 출퇴근 -->
							<div class="commute">
								<jsp:include page="/WEB-INF/views/dashboard/api/commute.jsp" />
							</div>

							<!-- session 1 날씨 -->
							<div class="weather">
								<jsp:include page="/WEB-INF/views/dashboard/api/weather.jsp" />
							</div>

							<!-- session 1 실내 온도 -->
							<div class="indoor_temp">
								<jsp:include page="/WEB-INF/views/dashboard/api/indoor_temp.jsp" />
							</div>

							<!-- 업무/결재 작성 및 휴가신청 -->
							<ul class="btn-list">
								<li><button class="btn work">업무작성</button></li>
								<li><button class="btn doc">결재작성</button></li>
								<li><button class="btn holiday">휴가신청</button></li>
							</ul>
						</div>
					</div>

					<!-- session_2 -->
					<div class="col-7">
						<jsp:include page="/WEB-INF/views/dashboard/calender/calender.jsp" />
					</div>

					<!-- session_3 -->
					<div class="col-3">
						<jsp:include page="/WEB-INF/views/dashboard/notify/notify.jsp" />
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
</body>

<script type="text/javascript" src="/resource/js/dashboard/dashboard.js"></script>

</html>