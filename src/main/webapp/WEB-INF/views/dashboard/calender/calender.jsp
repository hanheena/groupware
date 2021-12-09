<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resource/css/dashboard/calender/vendor/fullcalendar.min.css" />
<link rel="stylesheet" href='/resource/css/dashboard/calender/vendor/select2.min.css' />
<link rel="stylesheet" href='/resource/css/dashboard/calender/vendor/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/resource/css/dashboard/calender/calender.css">

<html>
  <body>
        <div class="container">
    
            <!-- 일자 클릭시 메뉴오픈 -->
            <div id="contextMenu" class="dropdown clearfix">
                <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                    style="display:block;position:static;margin-bottom:5px;">
                    <li><a tabindex="-1" href="#">일정등록</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
                </ul>
            </div>

            <div class="panel panel-default">
            <div class="panel-body">

                <div class="col-lg-6">
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter total' name="type_check" type="radio" value="전체"
                            checked>전체</label>
                        <label class="checkbox-inline"><input class='filter common' type="radio" name="type_check" value="공통">공통</label>
                        <label class="checkbox-inline"><input class='filter personal' type="radio" name="type_check" value="내일정">내일정</label>
                        <label class="checkbox-inline"><input class='filter share' type="radio" name="type_check" value="공유일정">공유일정</label>
                    </div>
                </div>

                <div class="insert_calender">
                    <button class="insert_calender_btn" type="button">일정 등록</button>
                </div>
            </div>
        </div>
    
            <div id="wrapper">
                <div id="loading"></div>
                <div id="calendar"></div>
            </div>
    
    
            <!-- 일정 추가 MODAL -->
            <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body">
    
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                    <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-name">작성자</label>
                                    <textarea rows="1" class="inputModal" name="edit-name"
                                        id="edit-name"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-target">대상자</label>
                                    <textarea rows="1" class="inputModal" name="edit-target"
                                        id="edit-target"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-title">일정명</label>
                                    <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                        required="required" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-start">시작</label>
                                    <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-end">끝</label>
                                    <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-type">구분</label>
                                    <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                        <option value="1">공통</option>
                                        <option value="2">내일정</option>
                                        <option value="3">공유일정</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-color">색상</label>
                                    <select class="inputModal" name="color" id="edit-color">
                                        <option value="#D25565" style="color:#D25565;">빨간색</option>
                                        <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                        <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                        <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                        <option value="#f06595" style="color:#f06595;">핑크색</option>
                                        <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                        <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                        <option value="#4d638c" style="color:#4d638c;">남색</option>
                                        <option value="#495057" style="color:#495057;">검정색</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label class="col-xs-4" for="edit-desc">설명</label>
                                    <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                        id="edit-desc"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer modalBtnContainer-addEvent">
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" id="save-event">저장</button>
                        </div>
                        <div class="modal-footer modalBtnContainer-modifyEvent">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                            <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        <!-- /.container -->
</body>

<script src="/resource/js/dashboard/calender/vendor/moment.min.js"></script>
<script src="/resource/js/dashboard/calender/vendor/fullcalendar.min.js"></script>
<script src="/resource/js/dashboard/calender/vendor/ko.js"></script>
<script src="/resource/js/dashboard/calender/vendor/select2.min.js"></script>
<script src="/resource/js/dashboard/calender/vendor/bootstrap-datetimepicker.min.js"></script>

<script src="/resource/js/dashboard/calender/calender.js"></script>
<script src="/resource/js/dashboard/calender/addEvent.js"></script>
<script src="/resource/js/dashboard/calender/editEvent.js"></script>
<script src="/resource/js/dashboard/calender/etcSetting.js"></script>
</html>