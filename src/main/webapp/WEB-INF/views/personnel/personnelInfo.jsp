<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<section class="contents">
	<div class="container">
		<div class="row gx-4">
			<div class="col-12">
				<div id="personnelInfoBody">
					<!-- 부서 목록 Start-->
					<div class="left">
						<div class="deptSearch">
							<form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
								<input type="search" class="form-control"
									placeholder="Search..." aria-label="Search">
							</form>
						</div>
						<div class="deptTree">
							<ul id="tree">
								<li><c:forEach items="${listDeptInfo}" var="dept"
										varStatus="status">
										<c:choose>
											<c:when test="${dept.codeName eq '전체'}">
												<strong><a href="#"
													onclick="listDeptUser('${dept.codeValue}');">${dept.codeName}(${dept.userCount})</a></strong>
											</c:when>
											<c:otherwise>
												<ul>
													<li><a href="#"
														onclick="listDeptUser('${dept.codeValue}');">${dept.codeName}(${dept.userCount})</a></li>
												</ul>
											</c:otherwise>
										</c:choose>
									</c:forEach></li>
							</ul>
						</div>
						<div class="deptUserInsert">
							<button class="btn btn-outline-secondary btn-lg">인사 카드
								생성</button>
						</div>
					</div>
					<!-- 부서 목록 End-->
					<!-- 부서에 해당하는 인원 목록 Start-->
					<div class="left">
						<div class="chkboxDiv">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="workType"
									value="workType001" checked> <label
									class="form-check-label" for="workType1">정직</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="workType"
									value="workType002" checked> <label
									class="form-check-label" for="workType2">계약</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="workType"
									value="workType003" checked> <label
									class="form-check-label" for="workType3">퇴사</label>
							</div>
						</div>
						<div class="userlistDiv" id="userList"></div>
					</div>
					<!-- 부서에 해당하는 인원 목록 End -->
					<!-- 인원 상세 정보 Start -->
					<div id="tabDiv" class="right">
						<!-- 탭 메뉴 -->
						<ul class="nav nav-tabs" id="tabUi" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="tab001" data-bs-toggle="tab"
									data-bs-target="#tabBody001" type="button" role="tab"
									aria-controls="tabBody001" aria-selected="true" onclick="">인사카드</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab002" data-bs-toggle="tab"
									data-bs-target="#tabBody002" type="button" role="tab"
									aria-controls="tabBody002" aria-selected="false">휴가</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab003" data-bs-toggle="tab"
									data-bs-target="#tabBody003" type="button" role="tab"
									aria-controls="tabBody003" aria-selected="false">근태</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab004" data-bs-toggle="tab"
									data-bs-target="#tabBody004" type="button" role="tab"
									aria-controls="tabBody004" aria-selected="false">스킬인벤토리</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="tab005" data-bs-toggle="tab"
									data-bs-target="#tabBody005" type="button" role="tab"
									aria-controls="tabBody005" aria-selected="false">첨부서류</button>
							</li>
						</ul>

						<!-- 내용 -->
						<div class="tab-content" id="tabDiv">
							<c:choose>
								<c:when test="${not empty userInfo}">
									<div class="tab-pane fade show active" id="tabBody001"
										role="tabpanel" aria-labelledby="tab001">
										<%@ include file="/WEB-INF/views/personnel/personnelCard.jsp"%>

									</div>
									<div class="tab-pane fade" id="tabBody002" role="tabpanel"
										aria-labelledby="tab002">
										<%@ include file="/WEB-INF/views/personnel/holiday.jsp"%>
									</div>
									<div class="tab-pane fade" id="tabBody003" role="tabpanel"
										aria-labelledby="tab003">
										<%@ include file="/WEB-INF/views/personnel/commute.jsp"%>
									</div>
									<div class="tab-pane fade" id="tabBody004" role="tabpanel"
										aria-labelledby="tab004">
										<%@ include file="/WEB-INF/views/personnel/skillInventory.jsp"%>
									</div>
									<div class="tab-pane fade" id="tabBody005" role="tabpanel"
										aria-labelledby="tab005">
										<%@ include file="/WEB-INF/views/personnel/attachedFile.jsp"%>
									</div>
								</c:when>
								<c:otherwise>
									<div class="tab-pane fade show active" id="tabBody001"
										role="tabpanel" aria-labelledby="tab001">
										<div>로그인 되어 있지 않습니다.</div>
									</div>
									<div class="tab-pane fade" id="tabBody002" role="tabpanel"
										aria-labelledby="tab002">
										<div>로그인 되어 있지 않습니다.</div>
									</div>
									<div class="tab-pane fade" id="tabBody003" role="tabpanel"
										aria-labelledby="tab003">
										<div>로그인 되어 있지 않습니다.</div>
									</div>
									<div class="tab-pane fade" id="tabBody004" role="tabpanel"
										aria-labelledby="tab004">
										<div>로그인 되어 있지 않습니다.</div>
									</div>
									<div class="tab-pane fade" id="tabBody005" role="tabpanel"
										aria-labelledby="tab005">
										<div>로그인 되어 있지 않습니다.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
					<!-- 인원 상세 정보 End -->
					<form id="userFm" name="userFm" method="get"></form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

<script type="text/javascript">
	var dept = ""; // 부서 관리
	$(document).ready(function() {

		// 첫 해당 부서(전체) 소속자 호출
		listDeptUser(dept);
		// 체크 박스 이벤트 
		$("input[name=workType]").click(function() {
			listDeptUser(dept);
		});

	});
	// 해당 부서에 소속자 호출
	function listDeptUser(department) {
		dept = department; // 현제 부서 값 
		var workTypes = workTypeCheckdValue();

		$.ajax({
			url : "/teware/personnel/ajaxListDeptUser",
			type : "POST",
			data : {
				department : dept,
				workTypes : workTypes.join(","),
			},
			success : function(data) {
				console.log("!@````");
				var html = "";
				var arr = new Array();
				for (var i = 0; i < data.length; i++) {
					arr = [];

					data[i].dutyName != null ? arr.push(data[i].dutyName)
							: data[i].positionName != null ? arr
									.push(data[i].positionName) : "";
					data[i].departmentName != null ? arr
							.push(data[i].departmentName) : "";
					data[i].placeWorkName != null ? arr
							.push(data[i].placeWorkName) : "";

					html += '<div class="m-1">';
					html += '	<a href="#" onclick="fnUserInfo('
							+ data[i].userId + ')">';
					html += '		<strong >' + data[i].krName + '</strong>';
					html += '		<p>' + arr.join(' / ') + '</p>';
					html += '	</a>';
					html += '</div>';

				}
				$("#userList").html(html);
			},
			error : function() {
				console.log("에러");
			}
		});
	}

	// 체크 상태 확인
	function workTypeCheckdValue() {
		var arr = new Array();
		$('input:checkbox[name="workType"]').each(function() {
			if (this.checked) {//checked 처리된 항목의 값
				arr.push(this.value);
			}
		});
		return arr;
	}

	// 회원 선택
	function fnUserInfo(id) {
		selectUserId = id;
		var html = "";
		html += '<input type="hidden" id="userId" name="userId" value="'+id+'" />';
		$("#userFm").html(html);

		$('#userFm').attr({
			action : '/teware/personnel',
			method : 'get'
		}).submit();
	}
</script>

