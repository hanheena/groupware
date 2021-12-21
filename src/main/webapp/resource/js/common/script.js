window.onload = function(){
  /* 메인 대시보드 */
  // 탭버튼
  $('.tab-btns li').click(function(){
    $(this).addClass('active').siblings().removeClass('active');
  })

  // 일정등록 모달창 - 시간 사용/미사용
  // 시간 미사용
  $('.tab-btns .time-btn.off').click(function(){
    $(this).addClass('active').parents().siblings().children().removeClass('active');

    if($('.tab-btns .time-btn.off').hasClass('active') === true) {
      $('.schedule-form .select-box select, .btn.all-day').attr('disabled', true);
    }
  })

  // 시간 사용
  $('.tab-btns .time-btn.on').click(function(){
    $(this).addClass('active').parents().siblings().children().removeClass('active');

    if($('.tab-btns .time-btn.on').hasClass('active') === true) {
      $('.schedule-form .select-box select, .btn.all-day').attr('disabled', false);
    }
  })

  // 일정등록 모달창 - '하루종일' 버튼 클릭 시, time select 비활성화
  $('.btn.all-day').click(function(){
    $(this).toggleClass('active');

    if($('.btn.all-day').hasClass('active') === true) {
      $('.schedule-form .select-box select').attr('disabled', true);
    } else {
      $('.schedule-form .select-box select').attr('disabled', false);
    }
  })


  $('.fc-daygrid-day-events').click(function(){
    console.log('clicked');
  })
}
