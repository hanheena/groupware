/* ****************
 *  일정 편집
 * ************** */
var editEvent = function(event, element, view) {
	console.log("이벤트 수정")
	$('.popover.fade.top').remove();
	$(element).popover("hide");
	console.log("================================")
	console.log("이벤트 시작시간 ~ 종료시간 = " + event.start_time + " ~ " + event.end_time)
	console.log("allday 구분 = " + event.all_day)
	console.log("allday 구분 형 = " + typeof event.all_day)
	console.log("이벤트 타입 = " + event.event_type)
	console.log("이벤트 타입 형 = " + typeof event.event_type)
	console.log("대상자 형 : " + typeof event.target_user)
	console.log("대상자 : " + event.target_user)
	$("#targetcontent").empty()
	var reg = /[\{\}\[\]\/?.;:|\)*~a-z`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var test='';
	if(typeof event.target_user == "string"){
		
		test =  event.target_user.replace(reg,"")
		console.log(test)
	}else if (typeof event.target_user == "object"){
		
		test = JSON.stringify(event.target_user)
		console.log(test)
		test =  test.replace(reg,"")
		console.log(test)

	}
	//정규식으로 특수문자 , 빼고 제거
	// var test = regExp(event.target_user)
	 
	console.log(test.length)
	var array = test.split(",");
	// event.target_user.split(",");
	console.log(array)
	
	for (i=0; i<array.length; i++){
		$("#targetcontent").append(`<button class="targetbutton" tpye="button" value="` + array[i] + `">` + array[i] + "</button>")
	}

	

	var event_type_str = '';
	event_type_str = event.event_type;


	/////////////////////////
	if (event_type_str == "공통") {

		$(":radio[name='edit-type']").prop("checked", false);

		$(":radio[class='input-edit-type-1']").prop("checked", true);

	} else if (event_type_str == "내일정") {

		$(":radio[name='edit-type']").prop("checked", false);

		$(":radio[class='input-edit-type-2']").prop("checked", true);


	} else if (event_type_str == "공유일정") {

		$(":radio[name='edit-type']").prop("checked", false);

		$(":radio[class='input-edit-type-3']").prop("checked", true);
	}
	/////////////////////////

	console.log("지금 찍힌 이벤트 타입 = " + $('input[name="edit-type"]:checked').val())

	if (event.all_day == "3") {
		$("#edit-allDay").prop("checked", true)
		// editAllDay.prop('checked', true);
		$("#edit-h-start").val(event.start_time.substring(0, 2));
		$("#edit-h-end").val(event.end_time.substring(0, 2));
		$("#edit-h-start").attr("disabled", true)
		$("#edit-h-end").attr("disabled", true)
	} else if (event.all_day == "1") {
		$("#edit-timeUse").prop("checked", true)
		// editAllDay.prop('checked', false);
		$("#edit-h-start").attr("disabled", false)
		$("#edit-h-end").attr("disabled", false)
		$("#edit-h-start").val(event.start_time.substring(0, 2));
		$("#edit-h-end").val(event.end_time.substring(0, 2));
	} else if (event.all_day == "2") {
		$("#edit-timeUnuse").prop("checked", true)
		// editAllDay.prop('checked', false);
		$("#edit-h-start").attr("disabled", true)
		$("#edit-h-end").attr("disabled", true)
		$("#edit-h-start").val(event.start_time.substring(0, 2));
		$("#edit-h-end").val(event.end_time.substring(0, 2));
	}

	$("input[name='edit-allDay']").change(function() {
		var value = this.value;
		if (value == "1") {
			$("#edit-h-start").attr("disabled", false)
			$("#edit-h-end").attr("disabled", false)
			$("#edit-h-start").val(event.start_time.substring(0, 2));
			$("#edit-h-end").val(event.end_time.substring(0, 2));
		} else if (value == "2") {
			$("#edit-h-start").val("00");
			$("#edit-h-end").val("00");
			$("#edit-h-start").attr("disabled", true)
			$("#edit-h-end").attr("disabled", true)
		} else if (value == "3") {
			$("#edit-h-start").val("00");
			$("#edit-h-end").val("23");
			$("#edit-h-start").attr("disabled", true)
			$("#edit-h-end").attr("disabled", true)
			editAllDay = true;
		}
	})

	if (event.end === null) {
		event.end = event.start;
	}

	if (event.all_day === "3" && event.end !== event.start) {
		editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
	} else {
		editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
	}

	modalTitle.html('일정 수정');
	editTitle.val(event.title);
	editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
	editDesc.val(event.description);
	editColor.val(event.backgroundColor).css('color', event.backgroundColor);
	editTarget.val(event.target_user);
	editName.val(event.write_user);


	addBtnContainer.hide();
	modifyBtnContainer.show();
	eventModal.modal('show');
	
	// 대상자 추가 
	$("#selectTarget").on('click', function() {
		targetModal.modal('show')

		$("#department").change(function() {

			var param = $("select[name='department']").val();
			var target = $("select[name='department_name']");
			target.empty()
			console.log(param)

			if (param == "") {
				$target.append(`<option value="">::선택::</option>`);
				return
			}
			$.ajax({
				type: "POST",
				url: "/teware/calendar/ajax_select_department",
				data: {
					select_result: param,
				},
				success: function(response) {
					console.log(response)
					if (response.length == 0) {
						target.append(`<option value="">::선택::</option>`);
					} else {
						$(response).each(function(i) {
							target.append(`<option value="` + response[i] + `">` + response[i] + `</option>`)
						})
					}
				},
				error: function(xhr) {
					console.log(xhr.reponseText);
					return;
				}
			});
			$("#uploadTarget").unbind()
			$("#uploadTarget").on('click', function() {
				//$("#edit-target").html(`<div><p>`+target.val()+`</p></div>`)
				// $("#edit-target").val(target.val())

				$("#targetcontent").append(`<button class="targetbutton" tpye="button" value="` + target.val() + `">` + target.val() + "</button>")
				array.push(target.val())


				targetModal.modal('hide')
			})
		})
		
	})
	// 대상자 버튼 클릭 시 삭제
		$(document).on("click", ".targetbutton", function() {
			console.log($(this).val())
			var removetarget = array.indexOf($(this).val());

			console.log(removetarget)
			array.splice(removetarget, removetarget + 1);
			$(this).remove();
			console.log("버튼 클릭 array : " + array)
		})
		$("#test_target").on("click", function() {
			console.log("출력 : " + array)
		})


	console.log("지금찍힌 이벤트 시작시간 ~ 종료시간 = " + $("#edit-h-start").val() + " ~ " + $("#edit-h-end").val())
	//업데이트 버튼 클릭시
	
	
	$('#updateEvent').unbind();
	$('#updateEvent').on('click', function() {
		submitarray = { "targetdata": JSON.stringify(array) };
		console.log("일정 저장 클릭 array : " + array)
		console.log("일정 저장 클릭 submitarray : " + submitarray)
		if (editStart.val() > editEnd.val()) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}

		if (editTitle.val() === '') {
			alert('일정명은 필수입니다.')
			return false;
		}


		var statusAllDay;
		var startDate;
		var endDate;
		var displayDate;
		var editAllDay = $('input[name="edit-allDay"]:checked').val();
		if (editAllDay == "3") {
			statusAllDay = 3;
			startDate = moment(editStart.val()).format('YYYY-MM-DD 00:00');
			endDate = moment(editEnd.val()).format('YYYY-MM-DD 23:59');
			displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD 23:59');
		} else if (editAllDay == "2") {
			statusAllDay = 2;
			startDate = editStart.val();
			endDate = editEnd.val();
			displayDate = endDate;
		}
		else {
			statusAllDay = 1;
			startDate = editStart.val();
			endDate = editEnd.val();
			displayDate = endDate;

		}

		eventModal.modal('hide');

		event.all_day = statusAllDay;
		event.title = editTitle.val();
		event.start = startDate;
		event.end = displayDate;
		event.event_type = $('input[name="edit-type"]:checked').val();
		event.backgroundColor = editColor.val();
		event.description = editDesc.val();
		event.target_user = submitarray;
		event.write_user = editName.val();
		event.start_time = $("#edit-h-start").val();
		event.end_time = $("#edit-h-end").val();

		var eventData = {
			title: event.title,
			start: event.start,
			end: event.end,
			description: event.description,
			event_type: event.event_type,
			backgroundColor: event.backgroundColor,
			all_day: event.all_day,
			id: event.id,
			target_user: event.target_user,
			write_user: event.write_user,
			start_hours: event.start_time,
			end_hours: event.end_time

		};

		$("#calendar").fullCalendar('updateEvent', event);
		console.log(eventData.target_user)
		//일정 업데이트
		$.ajax({
			type: "POST",
			url: "/teware/calender/ajax_update_schedule",
			data: {
				"eventData": eventData
			},
			success: function(response) {
				$("#department option").prop("selected", false);
				$("#department_name option").prop("selected", false);
				alert('수정되었습니다.')
				// location.reload();
			}
		});

	});
};

// 삭제버튼
$('#deleteEvent').on('click', function(event) {

	$('#deleteEvent').unbind();
	$("#calendar").fullCalendar('removeEvents', $(this).data('id'));
	eventModal.modal('hide');

	console.log("삭제 아이디 확인 : " + JSON.stringify(event.id));

	//삭제시
	$.ajax({
		type: "POST",
		url: "/teware/calender/ajax_delete_schedule",
		data: {
			"check_id": $(this).data('id')
		},
		success: function(response) {
			alert('삭제되었습니다.');
		}
	});

});

