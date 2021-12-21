<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>

<header class="header">
	<div class="py-2">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-between">
				<a href="/" class="logo d-flex align-items-center my-2 my-lg-0">
					<img src="/resource/img/logo_teware.svg" alt="TEWARE 로고">
				</a>

				<ul class="nav col-12 col-lg-auto my-2 justify-content-center">
					<li><a href="#" class="nav-link active"><i
							class="ri-home-4-fill"></i>홈</a></li>
					<li><a href="/teware/workReport/workReportList"
						class="nav-link"><i class="ri-stack-fill"></i>업무</a></li>
					<li><a href="#" class="nav-link"><i class="ri-draft-fill"></i>결재</a></li>
					<li><a href="#" class="nav-link"><i class="ri-timer-fill"></i>휴가</a></li>
					<li><a href="#" class="nav-link"><i
							class="ri-calendar-check-fill"></i>근태</a></li>
					<li><a href="/teware/personnel" class="nav-link"><i
							class="ri-contacts-book-fill"></i>인사카드</a> <!-- <a href="./hr-admin.html" class="nav-link"><i class="ri-contacts-book-fill"></i>인사카드</a> -->
					</li>
				</ul>

				<div class="user-profile dropdown text-end">
					<a href="#"
						class="user-pic d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="/resource/img/gravatar.png" alt="사용자 프로필 사진" width="32"
						height="32" class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<li><a class="dropdown-item" href="#">설정</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/teware/logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="hd-sub">
		<div class="inner">
			<p>${user_name}님,
				안녕하세요! <span class="ico"></span>
			</p>
		</div>
	</div>
</header>