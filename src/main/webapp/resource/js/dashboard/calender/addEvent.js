var eventModal = $('#eventModal');

var modalTitle = $('.modal-title'); // 일정 창 타이틀 (디비 연동 안 함)
// var editAllDay = $('#edit-allDay'); // 종일 구분
var editName = $('#edit-name'); // 작성자명
var editTarget = $('#edit-target'); // 대상자명
var editTitle = $('#edit-title'); // 일정 명
var editStart = $('#edit-start'); // 시작 날짜
var editEnd = $('#edit-end'); // 종료 날짜
var editType = $("#edit-type");
//var editType = $("input[name='edit-type']:checked").val(); // 이벤트 구분
var editColor = $('#edit-color'); // 배경 색상
var editDesc = $('#edit-desc'); // 일정 내용
var editHStart = $("#edit-h-start"); // 시작시간
// var editHStart = $("#edit-h-start option:selected").val()
var editHEnd = $("#edit-h-end"); // 시작시간

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

/* ****************
 *  새로운 일정 생성
 * ************** */

/*일정 등록 버튼 추가*/
$('.schedule-btn').unbind('click');
$('.schedule-btn').on('click', function(e) {

	e.preventDefault();


	var today = moment();

	var startDate = moment(today).format('YYYY-MM-DD');
	var endDate = moment(today).format('YYYY-MM-DD');

	var startDateHour = moment(today).format('HH');
	var endDateHour = moment(today).add(1, 'hours').format('HH');
	editHStart.val(startDateHour);
	editHEnd.val(endDateHour);

	newEvent(startDate, endDate, startDateHour, endDateHour, $(this).html());
});

var newEvent = function(start, end, startDateHour, endDateHour, eventType) {
	//
	$("#targetcontent").empty()	
	
	var array = new Array();
	var submitarray;
	///
	$("#contextMenu").hide(); //메뉴 숨김
	$(":radio[name='edit-type']").prop("checked", false);
	$(":radio[class='input-edit-type-1']").prop("checked", true);
	$("#edit-timeUse").prop("checked", true)
	modalTitle.html('일정 등록');
	// editType.val(eventType).prop('selected', true); //이거 꼭 써야하나???? 
	editTitle.val('');
	editStart.val(start);
	editEnd.val(end);
	editDesc.val('');
	editName.val('');
	editTarget.val('');
	//editAllDay.prop('checked', false);
	$("#edit-h-start").attr("disabled", false)
	$("#edit-h-end").attr("disabled", false)
	$("#edit-h-start").val(startDateHour.substring());
	$("#edit-h-end").val(endDateHour);
	//editHStart.val(editHStart);
	// editHEnd.val(end);

	addBtnContainer.show();
	modifyBtnContainer.hide();
	eventModal.modal('show');

	$("input[name='edit-allDay']").change(function() {
		var value = this.value;
		if (value == "1") {
			$("#edit-h-start").attr("disabled", false)
			$("#edit-h-end").attr("disabled", false)
			$("#edit-h-start").val(startDateHour.substring());
			$("#edit-h-end").val(endDateHour);
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
		}
	})
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

				if ($("#targetcontent"))
					$("#targetcontent").append(`<button class="targetbutton" tpye="button" value="` + target.val() + `">` + target.val() + "</button>")
				array.push(target.val())
				

				targetModal.modal('hide')
			})
		})
		// 대상자 버튼 클릭 시 삭제
		$(document).on("click", ".targetbutton", function() {
			console.log($(this).val())
			var removetarget = array.indexOf($(this).val());
			
			console.log(removetarget)
			array.splice(removetarget,removetarget+1);
			$(this).remove();
			console.log("버튼 클릭 array : " + array)
		})
		$("#test_target").on("click", function() {
			console.log("출력 : " + array)
		})
	})


	//새로운 일정 저장버튼 클릭
	$('#save-event').unbind();
	$('#save-event').on('click', function() {
		submitarray = { "targetdata": JSON.stringify(array) };
		console.log("일정 저장 클릭 array : " + array)
		console.log("일정 저장 클릭 submitarray : " + submitarray)
		var eventData = {
			title: editTitle.val(),
			start: editStart.val(),
			end: editEnd.val(),
			description: editDesc.val(),
			event_type: $("input[name='edit-type']:checked").val(),
			write_user: editName.val(),
			backgroundColor: editColor.val(),
			all_day: 1,
			target_user: submitarray,
			//target_user: editTarget.val(),
			start_hours: $("#edit-h-start").val(),
			end_hours: $("#edit-h-end").val(),


		};
		var editAllDay = $("input[name='edit-allDay']:checked").val();
		if (eventData.start > eventData.end) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}

		if (eventData.title === '') {
			alert('일정명은 필수입니다.');
			return false;
		}

		var realEndDay;
		if (editAllDay == "3") {
			eventData.start = moment(eventData.start).format('YYYY-MM-DD 00:00');
			//render시 날짜표기수정
			eventData.end = moment(eventData.end).add(1, "days").format('YYYY-MM-DD 23:59');
			//DB에 넣을때(선택)
			realEndDay = moment(eventData.end).format('YYYY-MM-DD 23:59');
			eventData.all_day = 3;
		} else if (editAllDay == "2") {
			// 미사용
			eventData.all_day = 2;
		}
		else if (editAllDay == "1") {
			// 사용
			eventData.all_day = 1;
		}

		$("#calendar").fullCalendar('renderEvent', eventData, true);
		eventModal.find('textarea').val('');

		//$("#edit-allDay").prop("checked", false)
		$("#edit-timeUse").prop("checked", false)
		$("#edit-timeUnuse").prop("checked", false)

		// editAllDay.prop('checked', false);
		eventModal.modal('hide');
		$("#edit-h-end").val("");
		//

		$("#selectTarget").unbind()

		console.log("보내는 데이터")
		console.log(eventData)


		//새로운 일정 저장
		$.ajax({
			type: "POST",
			url: "/teware/calender/ajax_insert_schedule",
			data: {
				"eventData": eventData
			},
			success: function(response) {
				//DB연동시 중복이벤트 방지를 위한
				$('#calendar').fullCalendar('removeEvents');
				$('#calendar').fullCalendar('refetchEvents');
				/*console.log("결과 값 확인" + JSON.stringify(response));*/
			}
		});
	});
};