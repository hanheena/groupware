<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div>
<table  style="width: 100%" >
<tr>
	<td colspan="2" align="center"><p id ="cityname"></p></td>
	</tr>
  <tr>
    <th width="50%" align="center" rowspan="2"><img align="middle" id="imgimg" width="100px" height="100px"/></th>
    <td align="center"><p class="text" id ="weather"></p></td>
  </tr>
  <tr>
    <td align="center"><p class="text" id ="temperature"></p></td>
  </tr>

 
</table>

</div>
<script type="text/javascript">
	var city = "Naju"
	var appkey = "502364536faf678e6319a261e9148892"
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+appkey+"&lang=kr&units=metric";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
            // console.log(resp);
            // console.log("현재온도 : "+ resp.main.temp );
            // console.log("현재습도 : "+ resp.main.humidity);
            // console.log("날씨 : "+ resp.weather[0].main );
            // console.log("상세날씨설명 : "+ resp.weather[0].description );
            // console.log("날씨 이미지 : "+ resp.weather[0].icon );
            // console.log("바람   : "+ resp.wind.speed );
            // console.log("나라   : "+ resp.sys.country );
            // console.log("도시이름  : "+ resp.name );
            // console.log("구름  : "+ (resp.clouds.all) +"%" );          
            
            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
            $("#imgimg").attr("src", imgURL);
            $("#temperature").text(resp.main.temp+ " °C");
            $("#cityname").text("나주시");
            $("#weather").text(resp.weather[0].description);
           
        }
    })
   
</script>
</body>
</html>