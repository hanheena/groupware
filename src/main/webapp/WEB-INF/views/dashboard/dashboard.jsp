<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>그룹웨어</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- 공통 컴포넌트 인클루드 -->
  <jsp:include page="/WEB-INF/views/common/include/link.jsp" />

  <link rel="stylesheet" type="text/css" href="/resource/css/dashboard/dashboard.css">
  <link rel="stylesheet" type="text/css" href="/resource/css/dashboard/api/api.css">

</head>

<body id="dashboard">
  <div class="body_wrap">

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/include/header.jsp" />

    <!-- content -->
    <div class="content">

      <!-- session_1 -->
      <session class="session_1">
        <!-- session 1 현재 시간 -->
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

        <!-- session 1 결재 버튼 -->
        <div class="work_btn">
          <button onclick="alert('업무 작성')">업무작성</button>
          <button onclick="alert('결제 작성')">결제작성</button>
          <button onclick="alert('휴가 신청')">휴가신청</button>
        </div>
      </session>

      <!-- session_2 -->
      <session class="session_2">
        <!-- session 2 캘린더 -->
        <div class="calendar_content">
          <jsp:include page="/WEB-INF/views/dashboard/calender/calender.jsp" />
        </div>
      </session>

      <!-- session_3 -->
      <session class="session_3">
        <!-- session 3 알람 헤더 -->
        <div class="noti_header">
          <p>알람 인벤토리</p>
          <button>더보기</button>
        </div>

        <!-- session 3 알람 내용 -->
        <div class="noti_content">
          <jsp:include page="/WEB-INF/views/dashboard/notify/notify.jsp" />
        </div>
      </session>
    </div>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/include/footer.jsp" />
  </div>
</body>
<script type="text/javascript" src="/resource/js/dashboard/dashboard.js"></script>
<script type="text/javascript" src="/resource/js/dashboard/api/api.js"></script>
</html>