<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="alarms">
	<div class="title d-flex align-items-center justify-content-between">
		<span class="txt">알림</span> <span class="btn more">더보기</span>
	</div>
	<ul class="alarm-ul">
		<li class="alarm-li required"><a href="#none"><i
				class="ri-notification-2-fill"></i>기본 서류를 등록해주세요.</a></li>
		<li class="alarm-li required"><a href="#none"><i
				class="ri-notification-2-fill"></i>스킬 및 경력을 작성해주세요.</a></li>
		<li class="alarm-li required"><a href="#none"><i
				class="ri-notification-2-fill"></i>지각 사유서를 작성해주세요.</a></li>
		<li class="alarm-li info"><a href="#none"><i
				class="ri-information-fill"></i>결재를 요청했습니다.</a>
			<button class="close">
				<i class="ri-close-fill"></i>
			</button></li>
		<li class="alarm-li reject"><a href="#none"><i
				class="ri-close-circle-fill"></i>결재 요청이 반려되었습니다.</a>
			<button class="close">
				<i class="ri-close-fill"></i>
			</button></li>
		<li class="alarm-li ok"><a href="#none"><i
				class="ri-checkbox-circle-fill"></i>결재가 최종 승인되었습니다.</a>
			<button class="close">
				<i class="ri-close-fill"></i>
			</button></li>
		<li class="alarm-li ok"><a href="#none"><i
				class="ri-checkbox-circle-fill"></i>연차가 1일 생성되었습니다.</a>
			<button class="close">
				<i class="ri-close-fill"></i>
			</button></li>
		<li class="alarm-li warning"><a href="#none"><i
				class="ri-error-warning-fill"></i>출근 등록이 누락되었습니다.</a>
			<button class="close">
				<i class="ri-close-fill"></i>
			</button></li>
	</ul>
</div>
