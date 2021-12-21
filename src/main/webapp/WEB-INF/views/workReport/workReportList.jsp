<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/include/header.jsp" />

<!-- 공통 컴포넌트 인클루드 -->
<jsp:include page="/WEB-INF/views/common/include/link.jsp" />

<div id="workReportListBody">
	<h3>업무보고</h3>
	<div class="buttonSet">
		<!-- 체크박스 -->
		<!-- 검색 -->
	</div>
	<button onclick="goWrite('DAY');">일일 보고</button>
	<button onclick="goWrite('WEEK');">주간 보고</button>
	<table>
		<tr>
			<th>번호</th>
			<th>보고 유형</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="4">작성된 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.id }</td>
					<td>${list.report_type eq 'DAY'? '일일보고' : '주간보고' }</td>
					<td style="text-align: left;" onclick="goDetail(${list.id})">
						${list.title }</td>
					<td>${list.insert_id }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<form id="detailFm">
		<input type="hidden" name="id" id="id" />
	</form>

	<div>
		<form id="typeFm">
			<input type="hidden" name="report_type" id="report_type" />
		</form>
	</div>


	<form id="workReportFm" name="workReportFm" method="get"></form>
</div>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/include/footer.jsp" />

<script>
		function goWrite(type){
			$("#typeFm").find("#report_type").val(type);
			$("#typeFm").attr({
				action: "/teware/workReport/workReportWrite",
				method: "post",
			}).submit();
		}
		
		function goDetail(num){
			$("#detailFm").find("#id").val(num);
			$("#detailFm").attr({
				action: "/teware/workReport/workReportDetail",
				method: "post",
			}).submit();
		}
	</script>
