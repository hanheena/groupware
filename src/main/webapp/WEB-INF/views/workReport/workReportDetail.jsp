<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<div id="workReportDetailBody">
	<c:choose>
		<c:when test="${map.vo.report_type eq 'DAY' }">
			<h3>일일보고</h3>
		</c:when>
		<c:when test="${map.vo.report_type eq 'WEEK' }">
			<h3>주간보고</h3>
		</c:when>
	</c:choose>

	<table>
		<tr>
			<th>제목</th>
			<td>${map.vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${map.vo.insert_id }</td>
			<th>보고 일자</th>
			<td>${map.vo.report_dt }</td>
		</tr>
		<tr>
			<th>보고 내용</th>
			<td>${fn:replace(map.vo.content, LF, '<br>')}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="뒤로"
				onclick="history.back();" /> <input type="button" value="수정"
				onclick="goModify(${map.vo.id});" /> <input type="button"
				value="삭제" onclick="goDelete(${map.vo.id});" /></td>
		</tr>
	</table>
	<form id="goFm">
		<input type="hidden" name="id" id="id" value="${map.vo.id}" />
	</form>
</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

<script>
		function goModify(num){
			$("#goFm").find("#id").val(num);
			$("#goFm").attr({
				action: "/teware/workReport/workReportModify",
				method: "post",
			}).submit();
		}
		
		function goDelete(num) {
			$("#goFm").attr({
				action: "/teware/workReport/workReportDelete",
				method: "post",
			}).submit();
		}
</script>
