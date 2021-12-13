<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <div class="commute_container">
	<input type="hidden" value="${user_id}" name="login_user_id">
    <div class="attend_area">
      <button class="btn btn-primary" id="attend_btn">출근</button>
      <div class="attend_time"></div>
    </div>
    <div class="leave_area">
      <button class="btn btn-primary" id="leave_btn">퇴근</button>
      <div class="leave_time"></div>
    </div>

    <div class="commute_notify"></div>
  </div>
</html>
