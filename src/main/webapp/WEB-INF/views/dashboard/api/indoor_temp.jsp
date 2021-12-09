<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<table  style="width: 100%">
			<tr>
				<td colspan="2"><h1>
						테라에너지
						</h1></td>
			</tr>
			<td><p>실내온도</p></td>
			<td align="right"><p id="va_temperature">ㅇㅇㅇ</p></td>
			</tr>
			<tr>
				<td><p>실내습도</p></td>
				<td align="right"><p id="va_humidity">ㅇㅇㅇ</p></td>
			</tr>

			<td><p>실내습도</p></td>
			<td align="right"><p>ㅇㅇㅇ</p></td>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "http://teraenergy.iptime.org:10070/getDeviceInfo?deviceId=eb5f163e05f612e8e7p9w4",
					success : function(res) {
						// console.log("성공")
						// console.log("온도 : "	+ res.result.status[0].value)
						 		var va_temperature = parseInt(res.result.status[0].value) * 0.1;
						// console.log(va_temperature)
						// 	console.log("습도 : "	+ res.result.status[1].value)
								var va_humidity = res.result.status[1].value
								$("#va_temperature").text(va_temperature + "°C")
										$("#va_humidity").text(va_humidity + "%")
									},									
									error : function(res) {
										var json = res
										// console.log(json)
									}
								})
					})
</script>
</html>