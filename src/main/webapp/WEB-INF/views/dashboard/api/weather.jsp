<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="w-100">
		<span class="location" id="cityname"></span>
		<div class="state d-flex justify-content-between align-items-center">
			<img align="middle" id="imgimg" class="pic" />
			<div class="txt">
				<em class="ondo" id="temperature"></em> 
				<span class="nal" id="weather"></span>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/resource/js/dashboard/api/weather.js"></script>
</body>
</html>