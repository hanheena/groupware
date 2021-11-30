<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>테스트 게시판 CRUD</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="/resource/css/dashboard/dashboard.css">
  <script type="text/javascript" src="/resource/js/dashboard/dashboard.js"></script>
</head>

<body id="dashboard">

  <!-- 공통 컴포넌트 인클루드 -->
  <jsp:include page="/WEB-INF/views/common/include/link.jsp" />

  <div class="body_wrap">

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/include/header.jsp" />

    <!-- content -->
    <div class="content">

      <!-- session_1 -->
      <session class="session_1">
        <!-- session 1 현재 시간 -->
        <div class="now_time"></div>

        <!-- session 1 출퇴근 -->
        <div class="commute"></div>

        <!-- session 1 날씨 -->
        <div class="weather"></div>

        <!-- session 1 실내 온도 -->
        <div class="indoor_temp"></div>

        <!-- session 1 결재 버튼 -->
        <div class="work_btn"></div>
      </session>

      <!-- session_2 -->
      <session class="session_2">
        <!-- session 2 캘린더 헤더 -->
        <div class="calendar_header"></div>

        <!-- session 2 캘린더 내용 -->
        <div class="calendar_content"></div>
      </session>

      <!-- session_3 -->
      <session class="session_3">
        <!-- session 3 알람 헤더 -->
        <div class="noti_header"></div>

        <!-- session 3 알람 내용 -->
        <div class="noti_content"></div>
      </session>
    </div>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
  </div>
</body>

</html>