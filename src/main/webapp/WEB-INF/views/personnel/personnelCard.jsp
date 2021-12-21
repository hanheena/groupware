<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
<style>
.hasDatepicker {
	position: relative;
	z-index: 1;
}
</style>


<div style="padding: 10px 10px 10px 10px;">
	<!-- 좌측 인사 정보 start-->
	<div style="float: left; width: 75%; height: 100%;">

		<div class="form-group row mb-1 mt-1">
			<label class="col-sm-2 col-form-label ">기본정보</label>
			<div class="col-sm-7"></div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label class="col-sm-2 col-form-label">이름</label>
			<div class="col-sm-7">
				<input type="text" readonly class="form-control-plaintext"
					id="krName" value="${personnel.krName}"> <input
					type="hidden" readonly class="form-control-plaintext" id="userId"
					value="${personnel.userId}">
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="enName" class="col-sm-2 col-form-label">영문 이름</label>
			<div class="col-sm-7">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<input type="text" class="form-control" id="enName"
							value="${personnel.enName}">
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.enName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row">
			<label for="placeWork" class="col-sm-2 col-form-label">업무위치</label>
			<div class="col-sm-7">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="placeWork">
								<option value="">없음</option>
								<c:forEach items="${listPlace}" var="place" varStatus="status">
									<option value="${place.codeValue}"
										<c:if test="${personnel.placeWork eq  place.codeValue}">selected</c:if>>${place.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listPlace.get(0).codeTypeValue}', '${listPlace.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.placeWorkName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="department" class="col-sm-2 col-form-label">소속부서</label>
			<div class="col-sm-7">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="department">
								<option value="">없음</option>
								<c:forEach items="${listDept}" var="dept" varStatus="status">
									<option value="${dept.codeValue}"
										<c:if test="${personnel.department eq  dept.codeValue}">selected</c:if>>${dept.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listDept.get(0).codeTypeValue}', '${listDept.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.departmentName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="position" class="col-sm-2 col-form-label">직급</label>
			<div class="col-sm-7">

				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="position">
								<option value="">없음</option>
								<c:forEach items="${listPosition}" var="position"
									varStatus="status">
									<option value="${position.codeValue}"
										<c:if test="${personnel.position eq  position.codeValue}">selected</c:if>>${position.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listPosition.get(0).codeTypeValue}', '${listPosition.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.positionName}">
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="duty" class="col-sm-2 col-form-label">직책</label>
			<div class="col-sm-7">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="duty">
								<option value="">없음</option>
								<c:forEach items="${listDuty}" var="duty" varStatus="status">
									<option value="${duty.codeValue}"
										<c:if test="${personnel.duty eq  duty.codeValue}">selected</c:if>>${duty.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listDuty.get(0).codeTypeValue}', '${listDuty.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.dutyName == null || personnel.dutyName == "" ? "없음" :personnel.dutyName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="workType" class="col-sm-2 col-form-label">근로형태</label>
			<div class="col-sm-7">

				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="workType">
								<option value="">없음</option>
								<c:forEach items="${listWorkType}" var="workType"
									varStatus="status">
									<option value="${workType.codeValue}"
										<c:if test="${personnel.workType eq  workType.codeValue}">selected</c:if>>${workType.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listWorkType.get(0).codeTypeValue}', '${listWorkType.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.workTypeName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${userInfo.userId eq personnel.userId}">
			<div class="form-group row mb-1 mt-1">
				<label for="loginId" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-7">
					<input type="text" readonly class="form-control-plaintext"
						id="loginId" value="${personnel.loginId}">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="birthDt" class="col-sm-2 col-form-label">생년월일</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="birthDt"
						value="${personnel.birthDt}">
				</div>
			</div>


			<div class="form-group row mb-1 mt-1">
				<label for="postNum" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-3">
					<div class="input-group">
						<input type="text" class="form-control" id="postNum"
							value="${personnel.postNum}">
						<button class="btn btn-primary" onclick="searchAddr();">주소검색</button>

					</div>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="addr1"
						value="${personnel.addr1}">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="addr2" class="col-sm-2 col-form-label">상세주소</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="addr2"
						value="${personnel.addr2}">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="email" class="col-sm-2 col-form-label">개인 이메일</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="email"
						value="${personnel.email}">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="teraEmail" class="col-sm-2 col-form-label">회사
					이메일</label>
				<div class="col-sm-7">
					<input type="text" readonly class="form-control-plaintext"
						id="teraEmail" value="${personnel.loginId}@@teraenergy.co.kr">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="emplyDt" class="col-sm-2 col-form-label">입사 일</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="emplyDt"
						value="${personnel.emplyDt}">
				</div>
			</div>
			<div class="form-group row mb-1 mt-1">
				<label for="resignDt" class="col-sm-2 col-form-label">퇴사 일</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="resignDt"
						value="${personnel.resignDt}">
				</div>
			</div>

			<div class="form-group row mb-1 mt-1">
				<div class="m-3">
					<button class="btn btn-primary" onclick="fnPersonnelSave();">저장하기</button>
				</div>
			</div>
		</c:if>

	</div>
	<!-- 좌측 인사 정보 end-->
	<!-- 우측 프로필 및 다른 상태 관리 start -->
	<div style="float: right; width: 25%; height: 100%;">
		<div class="">
			<img alt="기본" src="${root}/resource/img/basic_profile.png"
				style="width: 150px; height: 250; object-fit: cover;">
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="state" class="col-sm-4 col-form-label ">상태</label>
			<div class="col-sm-6">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="state">
								<option value="">없음</option>
								<c:forEach items="${listState}" var="state" varStatus="status">
									<option value="${state.codeValue}"
										<c:if test="${personnel.state eq  state.codeValue}">selected</c:if>>${state.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listState.get(0).codeTypeValue}', '${listState.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.stateName == null || personnel.stateName == "" ? "없음" :personnel.stateName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="auth" class="col-sm-4 col-form-label ">등급</label>
			<div class="col-sm-6">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<div class="input-group">
							<select class="form-control" id="auth">
								<option value="">없음</option>
								<c:forEach items="${listAuth}" var="auth" varStatus="status">
									<option value="${auth.codeValue}"
										<c:if test="${personnel.auth eq  auth.codeValue}">selected</c:if>>${auth.codeName}</option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-default "
								onclick="modalEvent('${listAuth.get(0).codeTypeValue}', '${listAuth.get(0).codeTypeName}');">
								<i class="fab fa-apple"></i>
							</button>
						</div>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.authName == null || personnel.authName == "" ? "없음" :personnel.authName}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="form-group row mb-1 mt-1 ">
			<label for="commuteYn" class="col-sm-4 col-form-label ">출퇴근
				관리</label>
			<div class="col-sm-6 ">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<input type="checkbox" id="commuteYn" data-toggle="toggle"
							data-onstyle="success"
							onchange="fnYnChecked(${personnel.userId}, 'commuteYn');"
							<c:if test="${personnel.commuteYn eq 'Y'}">checked</c:if>>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.commuteYn eq 'Y' ? '예' : '아니요'}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="skillYn" class="col-sm-4 col-form-label ">스킬 요청</label>
			<div class="col-sm-6">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<input type="checkbox" id="skillYn" data-toggle="toggle"
							data-onstyle="success"
							onchange="fnYnChecked(${personnel.userId}, 'skillYn');"
							<c:if test="${personnel.skillYn eq 'Y'}">checked</c:if>>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.skillYn eq 'Y' ? '예' : '아니요'}">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="form-group row mb-1 mt-1">
			<label for="papersYn" class="col-sm-4 col-form-label ">서류 요청</label>
			<div class="col-sm-6">
				<c:choose>
					<c:when test="${userInfo.userId eq personnel.userId}">
						<input type="checkbox" id="papersYn" data-toggle="toggle"
							data-onstyle="success"
							onchange="fnYnChecked(${personnel.userId}, 'papersYn');"
							<c:if test="${personnel.papersYn eq 'Y'}">checked</c:if>>
					</c:when>
					<c:otherwise>
						<input type="text" readonly class="form-control-plaintext"
							value="${personnel.papersYn eq 'Y' ? '예' : '아니요'}">
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<!-- 우측 프로필 및 다른 상태 관리 end -->

	<!-- 공통 코드 모달 영역 start -->
	<div id="commonCodeModal" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="modalLabel"
		aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- header start-->
					<h5 class="modal-title" id="modalLabel">Modal title</h5>
					<!-- header end-->
				</div>
				<div class="modal-body">
					<!-- body start-->
					<input type="hidden" id="codeTypeValue" name="codeTypeValue"
						value="" />
					<div style="padding: 10px 10px 10px 10px;">
						<div style="float: left; width: 48%; height: 100%;">
							<table class="table">
								<thead>
									<th scope="col">ID</th>
									<th scope="col">코드 값</th>
									<th scope="col">코드 명</th>
									<th scope="col">순서</th>
								</thead>
								<tbody id="commonCodeModalTableBody">

								</tbody>
							</table>

							<button type="button" class="btn btn-primary btn-sm"
								id="commonCodeAdd">추가</button>
						</div>

						<div id="commonCodeInfo"
							style="float: right; width: 48%; height: 100%;">
							<p>?</p>
						</div>
					</div>
					<!-- body end-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalClose">닫기</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- 공통 코드 모달 영역 end -->

</div>


<!-- 주소 검색 js 파일  -->
<script type="text/javascript"
	src="${root}/resource/js/postcode/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		// 생년월일
		$("#birthDt").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dateFormat : "yy-mm-dd",
			maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) 
		});
		// 입사일
		$("#emplyDt").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dateFormat : "yy-mm-dd",
			maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			onClose : function(selectedDate) { //시작일(startDate) datepicker가 닫힐때 //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정 
				$("#resignDt").datepicker("option", "minDate", selectedDate);
			}
		});
		// 퇴사일
		$("#resignDt").datepicker({
			changeMonth : true,
			changeYear : true,
			nextText : '다음 달',
			prevText : '이전 달',
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			dateFormat : "yy-mm-dd",
			maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			onClose : function(selectedDate) { //시작일(startDate) datepicker가 닫힐때 //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정 
				$("#emplyDt").datepicker("option", "minDate", selectedDate);
			}
		});

	});

	
	// 저장 처리 
	function fnPersonnelSave(){
		
		if(confirm('저장하시겠습니까?')){
			$.ajax({
				url : "/teware/personnel/ajaxUpdateUserInfo",
				type : "POST",
				data : {
					userId : $("#userId").val(),				// 고유 ID
					krName : $("#krName").val(),				// 이름
					enName : $("#enName").val(),				// 영문 이름
					placeWork : $("#placeWork").val(), 			// 업무 위치
					department : $("#department").val(), 		// 소속 부서
					position : $("#position").val(), 			// 직급
					duty : $("#duty").val(),					// 직책
					workType : $("#workType").val(),			// 근로 형태			
					birthDt : $("#birthDt").val(),				// 생년 월일
					postNum : $("#postNum").val(),				// 우편 번호
					addr1 : $("#addr1").val(), 					// 일반 주소
					addr2 : $("#addr2").val(),					// 상세 주소
					email : $("#email").val(), 					// 개인 이메일
					emplyDt : $("#emplyDt").val(),				// 입사 일
					resignDt : $("#resignDt").val(),			// 퇴사 일
				},success : function(data){
					alert("저장 되었습니다.");
					location.reload();
				},
				error : function(){
					console.log("에러");
				}		
			});
		}

	}
	
	
	
	// 주소 검색 기능 
	function searchAddr(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullAddr = ''; // 최종 주소 변수 
				var extraAddr = ''; // 조합형 주소 변수 
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
					fullAddr = data.roadAddress; 
				} else { // 사용자가 지번 주소를 선택했을 경우(J) 
					fullAddr = data.jibunAddress; 
				} 
				
				// 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
				if(data.userSelectedType === 'R'){ 
					//법정동명이 있을 경우 추가한다. 
					if(data.bname !== ''){ 
						extraAddr += data.bname; 
					} 
					// 건물명이 있을 경우 추가한다. 
					if(data.buildingName !== ''){ 
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
					} 
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
				}
				$("#postNum").val(data.zonecode);
				$("#addr1").val(fullAddr);
				$("#addr2").focus();
	        }
    	}).open(); 
	}
 	// 출퇴근 관리, 스킬요청, 서류 요청 처리 
	function fnYnChecked(userId, value){
		console.log(value+":"+$("#"+value).is(":checked"));
		$.ajax({
			url : "/teware/personnel/ajaxUpdateChecked",
			type : "POST",
			data : {
				userId	: userId,
				type	: value,
				value	: $("#"+value).is(":checked") ? 'Y' : 'N'
			},success : function(data){
				alert("헐퀴~");
			},
			error : function(){
				console.log("에러");
			}		
		});
	}
	
	// 공통 코드 모달창 오픈
	function modalEvent(codeTypeValue, title){
		$("#modalLabel").html(title+" 공통코드 관리");
		$("#codeTypeValue").val(codeTypeValue);
		$('#commonCodeModal').modal("show");
		fnCommonCodeList();
	}
	// 공통 코드 목록 
	function fnCommonCodeList(){
		var codeValue = $("#codeTypeValue").val();
		$.ajax({
			url : "/teware/commonCode/ajaxListCommonCode",
			type : "POST",
			data : {
				codeValue : codeValue
			},success : function(data){
				
				console.log(data);
				var html = "";					
				if(data.length > 0){
					for(var i = 0; i < data.length; i++){							
						html += "<tr scope='row'  onclick='fnCommonCodeInfo(\""+codeValue+"\","+data[i].codeId+");'>";
						html += "<td>"+data[i].codeId+"</td>";
						html += "<td>"+data[i].codeValue+"</td>";
						html += "<td>"+data[i].codeName+"</td>";
						html += "<td>"+data[i].seq+"</td>";
						html += "</tr>";
					}
					fnCommonCodeInfo(codeValue, data[0].codeId);
				}else{
					html += "<tr><td>데이터가 존재하지 않습니다.</td></tr>";
				}
				$("#commonCodeModalTableBody").html(html);
			},
			error : function(){
				console.log("에러");
			}		
		});
	}

	// 공통 코드 모달창 클로즈
	$("#modalClose").click(function(){
		$('#commonCodeModal').modal("hide");
		location.reload();
	});
	
	// 공통 코드 등록 버튼 실행
	$("#commonCodeAdd").click(function(){
		fnCodeInfoInsert();
	});
	
	// 공통 코드 등록 처리
	function fnCommonCodeInsert(){
		$.ajax({
			url : "/teware/commonCode/ajaxInsertCommonCode",
			type : "POST",
			data : {
				codeTypeValue	: $("#codeTypeValue").val(),
				codeValue		: $("#commonCodeInfo").find("#codeValue").val(),
				codeName		: $("#commonCodeInfo").find("#codeName").val()
			},success : function(data){
				console.log(data)
				if(data.code == "1"){
					alert(data.msg);
				}else{
					fnCommonCodeList();
				}
			},
			error : function(){
				console.log("에러");
			}		
		});
	}
	// 공통 코드 수정 처리 
	function fnCommonCodeUpdate(id){
		$.ajax({
			url : "/teware/commonCode/ajaxUpdateCommonCode",
			type : "POST",
			data : {
				codeId			: id,
				codeTypeId		: $("#commonCodeInfo").find("#codeTypeId").val(),
				codeValue		: $("#commonCodeInfo").find("#codeValue").val(),
				codeName		: $("#commonCodeInfo").find("#codeName").val(),
				seq				: $("#commonCodeInfo").find("#seq").val()
			},success : function(data){
				console.log(data)
				if(data.code == "1"){
					alert(data.msg);
				}else{
					fnCommonCodeList();
				}
			},
			error : function(){
				console.log("에러");
			}		
		});
	}
	
	// 공통 코드 정보 보기 
	function fnCommonCodeInfo(codeValue, codeId){
		$.ajax({
			url : "/teware/commonCode/ajaxCommonCode",
			type : "POST",
			data : {
				codeValue : codeValue,
				codeId : codeId
			},success : function(data){
				if(data != null){						
					fnCodeInfoModify(data);
				}
			},
			error : function(){
				console.log("에러");
			}		
		});
	}
	// 코드 정보 그리기 
	function fnCodeInfoModify(data){
		var html = "";
		html += '<div class="card">';
		html += 	'<div class="card-header">수정</div>';
		html += 	'<div class="card-body">';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="codeId" class="col-sm-3 col-form-label">ID</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" readonly class="form-control-plaintext" id="codeId" name="codeId" value="'+data.codeId+'">';
		html += 				'<input type="hidden" id="codeTypeId" name="codeTypeId" value="'+data.codeTypeId+'">';
		html += 			'</div>';
		html += 		'</div>';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="codeValue" class="col-sm-3 col-form-label">코드 값</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" class="form-control" id="codeValue" name="codeValue" value="'+data.codeValue+'">';
		html += 			'</div>';
		html += 		'</div>';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="codeName" class="col-sm-3 col-form-label">코드 명</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" class="form-control" id="codeName" name="codeName" value="'+data.codeName+'">';
		html += 			'</div>';
		html += 		'</div>';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="seq" class="col-sm-3 col-form-label">순서</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" class="form-control" id="seq" name="seq" value="'+data.seq+'">';
		html += 			'</div>';
		html += 		'</div>';
		html +=			'<button type="button" class="btn btn-primary btn-sm" onclick="fnCommonCodeUpdate('+data.codeId+');">변경</button>';
		html += 	'</div>';
		html += '</div>';
		$("#commonCodeInfo").html(html);
	}
	
	// 등록 화면 그리기 
	function fnCodeInfoInsert(){
		var html = "";
		html += '<div class="card">';
		html += 	'<div class="card-header">등록</div>';
		html += 	'<div class="card-body">';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="codeValue" class="col-sm-3 col-form-label">코드 값</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" class="form-control" id="codeValue" name="codeValue" value="">';
		html += 			'</div>';
		html += 		'</div>';
		html += 		'<div class="form-group row mb-1 mt-1">';
		html += 			'<label for="codeName" class="col-sm-3 col-form-label">코드 명</label>';
		html += 			'<div class="col-sm-7">';
		html += 				'<input type="text" class="form-control" id="codeName" name="codeName" value="">';
		html += 			'</div>';
		html += 		'</div>';
		html +=			'<button type="button" class="btn btn-primary btn-sm" onclick="fnCommonCodeInsert();">등록</button>';
		html += 	'</div>';
		html += '</div>';
		$("#commonCodeInfo").html(html);
	}
	

</script>



