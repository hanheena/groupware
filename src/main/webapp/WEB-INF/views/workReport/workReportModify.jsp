<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<!-- DatePicker 관련 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div id="workReportModifyBody">
	<c:choose>
		<c:when test="${map.vo.report_type eq 'DAY'}">
			<h3>일일보고 수정</h3>
		</c:when>
		<c:when test="${map.vo.report_type eq 'WEEK' }">
			<h3>주간보고 수정</h3>
		</c:when>
	</c:choose>

	<form id="writeFm">
		<input type="hidden" value="${map.vo.id }" name="id" id="id" /> <input
			type="hidden" value="${map.vo.report_type }" name="report_type"
			id="report_type" /> <input type="hidden" value="admin"
			name="update_id" id="update_id" />
		<table>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" id="title" name="title"
					title="제목" class="chk" value="${map.vo.title }" /></td>
			</tr>
			<tr>
				<!-- 보고타입 : onchange event -->
				<th>보고 유형</th>
				<td><select name="type" onchange="changeType(this);">
						<option value="DAY"
							${map.vo.report_type eq 'DAY' ? 'selected' : '' }>일일보고</option>
						<option value="WEEK"
							${map.vo.report_type eq 'WEEK' ? 'selected' : '' }>주간보고</option>
				</select></td>
				<th><label for="datepicker">보고일</label></th>
				<td><input type="text" name="report_dt" id="datepicker"
					class="chk" title="보고일" value="${map.vo.report_dt }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea rows="10" cols="100" id="content"
						name="content" title="내용" class="chk" style="resize: none;">
${fn:replace(map.vo.content, LF, '<br>')}
					</textarea></td>
			</tr>

			<tr>
				<td colspan="2"><input type="button" value="등록"
					onclick="goModify();" /> <input type="button" value="뒤로"
					onclick="history.back();" /></td>
			</tr>
		</table>

	</form>
</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

<script>
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
	
	function goModify(){
		var data = {}
		data["id"] = $("#id").val();
		data["report_type"] = $("#report_type").val();
		data["report_dt"] = $("#datepicker").val();
		data["title"] = $("#title").val();
		data["content"] = $("#content").val().replace(/\n/g,"<br>");
		data["update_id"] = $("#update_id").val();
		
		if(emptyChk()){
			$.ajax({
				dataType: "json",
				data: data,
				type: "post",
				url : "/teware/workReport/workReportChange",
				success: function(response){
					$('#writeFm').attr({
						action: "/teware/workReport/workReportDetail",
						method: "post",
					}).submit();
				}, error : function(req, text){
					alert(text + " : " + req.status);
				}
			});	//ajax
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
	    $("#datepicker").datepicker();
	});
	
	function changeType(type){
		$("#writeFm").find("[name=report_type]").val(type.value);
	}
</script>
