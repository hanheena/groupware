<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="weather indoor w-100">
		<span class="location">테라에너지</span>
		<ul>
			<li class="d-flex align-items-center justify-content-between"><span>실내온도</span><em
				id="va_temperature">20.6°C</em></li>
			<li class="d-flex align-items-center justify-content-between"><span>실내습도</span><em
				id="va_humidity">40.2%</em></li>
		</ul>
	</div>
</body>
<script type="text/javascript"
	src="/resource/js/dashboard/api/indoor_temp.js"></script>
</html>