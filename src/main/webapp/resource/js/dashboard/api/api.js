$(document).ready(function() {
	console.log("=======api.js=======")
	
	get_commute();
});

/*로그인 유저의 출퇴근 정보 가져오기*/
function get_commute() {
	
	var now = new Date();
	
	var user_id = $('input[name="login_user_id"]').val();
	
	$.ajax({
		url : "/teware/commute/get_commute",
		type : "POST", 
		dataType : 'json', 
		data: {
			"user_id": user_id, 
			"base_date": dateFormat(now)
		},
		success : function(data) {
			
			console.log("디비 데이터 : " + JSON.stringify(data));
			
			/*데이터 없을 때 처리*/
			if(data[0].attend_date != null) {
			
			var attend_date_format = new Date(data[0].attend_date);
			
			$('.commute .attend_time').append(timeFormat(attend_date_format));
			}
			
			if(data[0].leave_date != null) {
			
			var leave_date_format = new Date(data[0].leave_date);
			
			$('.commute .leave_time').append(timeFormat(leave_date_format));
			}
			
		}, error:function(request,status,error){
			alert("실패" + error);
		}
	});
}

$('.commute #attend_btn').click(function() {
	
	var now = new Date();

	var user_id = $('input[name="login_user_id"]').val();

	var eventData = {
		user_id: user_id,
		attend_date: datetimeFormat(now), 
		base_date: dateFormat(now)
	};
	
	console.log("유저 아이디 : " + JSON.stringify(user_id));
	console.log("출근 클릭 시 : " + JSON.stringify(eventData));

	$.ajax({
		type: "POST",
		url: "/teware/commute/ajax_insert_attend",
		data: {
			"eventData": eventData
		},
		success: function(response) {
			alert("출근 등록 완료");
		}
	});

	/*alert("attend_btn : " + JSON.stringify(attent_date) + " : " + JSON.stringify(attent_time));*/

});

$('.commute #leave_btn').click(function() {

	var now = new Date();
	
	/*var leave_time = timeFormat(now);*/
	/*$('.commute .leave_time').append(leave_time);*/
	
	console.log("유저 아이디 : " + JSON.stringify(user_id));
	console.log("퇴근 클릭 시 : " + JSON.stringify(eventData));

	var user_id = $('input[name="login_user_id"]').val();
	
	var eventData = {
		user_id: user_id,
		leave_date: datetimeFormat(now), 
		base_date: dateFormat(now)
	};

	$.ajax({
		type: "POST",
		url: "/teware/commute/ajax_insert_leave",
		data: {
			"eventData": eventData
		},
		success: function(response) {
			alert("퇴근 등록 완료");
		}
	});

	/*alert("leave_btn : " + JSON.stringify(leave_date) + " : " + JSON.stringify(leave_time));*/
});

function datetimeFormat(date) {
	let month = date.getMonth() + 1;
	let day = date.getDate();
	let hour = date.getHours();
	let minute = date.getMinutes();
	let second = date.getSeconds();

	month = month >= 10 ? month : '0' + month;
	day = day >= 10 ? day : '0' + day;
	hour = hour >= 10 ? hour : '0' + hour;
	minute = minute >= 10 ? minute : '0' + minute;
	second = second >= 10 ? second : '0' + second;

	return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
}

function dateFormat(date) {
	let month = date.getMonth() + 1;
	let day = date.getDate();

	month = month >= 10 ? month : '0' + month;
	day = day >= 10 ? day : '0' + day;

	return date.getFullYear() + '-' + month + '-' + day;
}


function timeFormat(date) {
	let hour = date.getHours();
	let minute = date.getMinutes();
	let second = date.getSeconds();

	hour = hour >= 10 ? hour : '0' + hour;
	minute = minute >= 10 ? minute : '0' + minute;
	second = second >= 10 ? second : '0' + second;

	return hour + ':' + minute;
}