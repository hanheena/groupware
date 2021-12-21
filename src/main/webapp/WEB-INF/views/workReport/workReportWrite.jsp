<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<!-- DatePicker 관련 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Summernote 관련 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<div id="workReportWriteBody">
	<c:choose>
		<c:when test="${map.report_type eq 'DAY' }">
			<h3>일일보고 작성</h3>
		</c:when>
		<c:when test="${map.report_type eq 'WEEK' }">
			<h3>주간보고 작성</h3>
		</c:when>
	</c:choose>

	<form id="writeFm">
		<input type="hidden" value="${map.report_type }" name="report_type" />
		<input type="hidden" value="admin" name="insert_id" />
		<table>
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" title="제목" class="chk" /></td>
			</tr>
			<tr>
				<!-- 날짜 관련 선택할 수 있는 datePicker -->
				<td colspan="2"><label for="datepicker">보고일</label> <input
					type="text" name="report_dt" id="datepicker" class="chk"
					title="보고일" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><c:choose>
						<c:when test="${map.report_type eq 'DAY' }">
							<textarea id="summernote" rows="10" cols="100" name="content"
								title="내용" class="chk" style="resize: none;">
● 어제 한 일

● 오늘 할 일</textarea>
						</c:when>
						<c:when test="${map.report_type eq 'WEEK' }">
							<textarea id="summernote" rows="10" cols="100" name="content"
								title="내용" class="chk" style="resize: none;">
[이름/팀 명]
						
● 이번 주에 한 일
		
● 다음 주에 할 일

● 특이사항</textarea>
						</c:when>
					</c:choose></td>
			</tr>

			<tr>
				<td colspan="2"><input type="button" value="등록"
					onclick="goSubmit();" /> <input type="button" value="뒤로"
					onclick="history.back();" /></td>
			</tr>
		</table>

	</form>
</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder: 'content',
			minHeight: 370,
			maxHeight: 370,
			focus: true,
			lang : 'ko-KR'
		})
	})
	
	function emptyChk(){
		var ok = true;
		$(".chk").each(function(){
			if($.trim($(this).val()) == ''){
				alert($(this).attr('title') + '을 입력해주세요.');
				$(this).focus();
				ok = false;
				return ok;
			}
		});
		return ok;
	}
	
	
	function goSubmit(){
		if(emptyChk()){
			$('#writeFm').attr({
				action: '/teware/workReport/workReportSave',
				method: 'post',
			}).submit();
		}
	}
	
	$.datepicker.setDefaults({
		setDate: 'today',
	    dateFormat: 'yy-mm-dd',
	    maxDate : 0,
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    changeMonth : true,
	    changeYear : true,
	    nexText : '다음 달',
	    prevText : '지난 달',
	    showButtonPanel : true,
	    currentText : '오늘',
	    closeText : '닫기'
	});
	
	$(function() {
	    $("#datepicker").datepicker({
	    	dateFormat: "yy-mm-dd"
	    }).datepicker("setDate","0");
	});
</script>
