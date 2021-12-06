var eventModal = $('#eventModal');

var modalTitle = $('.modal-title'); // 일정 창 타이틀 (디비 연동 안 함)
var editAllDay = $('#edit-allDay'); // 종일 구분
var editName = $('#edit-name'); // 작성자명
var editTitle = $('#edit-title'); // 일정 명
var editStart = $('#edit-start'); // 시작 날짜
var editEnd = $('#edit-end'); // 종료 날짜
var editType = $('#edit-type'); // 이벤트 구분
var editColor = $('#edit-color'); // 배경 색상
var editDesc = $('#edit-desc'); // 일정 내용

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function(start, end, eventType) {

	$("#contextMenu").hide(); //메뉴 숨김

	modalTitle.html('일정 등록');
	editType.val(eventType).prop('selected', true);
	editTitle.val('');
	editStart.val(start);
	editEnd.val(end);
	editDesc.val('');
	editName.val('');

	addBtnContainer.show();
	modifyBtnContainer.hide();
	eventModal.modal('show');

	//새로운 일정 저장버튼 클릭
	$('#save-event').unbind();
	$('#save-event').on('click', function() {

		var eventData = {
			title: editTitle.val(),
			start: editStart.val(),
			end: editEnd.val(),
			description: editDesc.val(),
			event_type: editType.val(),
			write_user: editName.val(),
			backgroundColor: editColor.val(),
			textColor: '#ffffff',
			all_day: false
		};

		if (eventData.start > eventData.end) {
			alert('끝나는 날짜가 앞설 수 없습니다.');
			return false;
		}

		if (eventData.title === '') {
			alert('일정명은 필수입니다.');
			return false;
		}

		var realEndDay;

		if (editAllDay.is(':checked')) {
			
			console.log();
			eventData.start = moment(eventData.start).format('YYYY-MM-DD 00:00');
			//render시 날짜표기수정
			eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD 00:00');
			//DB에 넣을때(선택)
			realEndDay = moment(eventData.end).format('YYYY-MM-DD 00:00');

			eventData.all_day = true;
		} else {
			eventData.all_day = false;
		}

		$("#calendar").fullCalendar('renderEvent', eventData, true);
		eventModal.find('input, textarea').val('');
		editAllDay.prop('checked', false);
		eventModal.modal('hide');
		
		console.log("eventData 확인 : " + JSON.stringify(eventData));

		//새로운 일정 저장
		$.ajax({
			type: "POST",
			url: "/calender/ajax_insert_schedule",
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