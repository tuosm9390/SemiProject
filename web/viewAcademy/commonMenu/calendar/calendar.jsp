<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="image/favicon.ico">
    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
    <link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/main.css">
</head>

<style>

     html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
    #external-events {
    position: fixed;
    z-index: 0;
    top: 300px;
    left: 140px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
  }
 
  #calendar-container {
    position: relative;
    z-index: 0;
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }
</style>

 
<body>
 <%@ include file="/viewAcademy/common/menubar.jsp"%>
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a href="#">학생 상담</a></li>
                <li><a href="#">학부모 상담</a></li>
                <li><a href="#">직원 면담</a></li>
                <li><a href="#">회의</a></li>
                <li><a href="#">개인일정</a></li>
                <li class="divider"></li>
                <li><a  href="#" data-role="close">Close</a></li>
            </ul>
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
                                    <option value="학생 상담">학생 상담</option>
                                    <option value="학부모 상담">학부모 상담</option>
                                    <option value="직원 면담">직원 면담</option>
                                    <option value="회의">회의</option>
                                    <option value="개인일정">개인일정</option>
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
    </div><!-- /.container -->

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/main.js"></script>
  
    <script src="js/editEvent.js"></script>
    <script src="js/etcSetting.js"></script>
     
</body>
 <script>
 var eventModal = $('#eventModal');

 var modalTitle = $('.modal-title');
 var editAllDay = $('#edit-allDay');
 var editTitle = $('#edit-title');
 var editStart = $('#edit-start');
 var editEnd = $('#edit-end');
 var editType = $('#edit-type');
 var editColor = $('#edit-color');
 var editDesc = $('#edit-desc');

 var addBtnContainer = $('.modalBtnContainer-addEvent');
 var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


 /* ****************
  *  새로운 일정 생성
  * ************** */
 var newEvent = function (start, end, eventType) {

     $("#contextMenu").hide(); //메뉴 숨김

     modalTitle.html('새로운 일정');
     editStart.val(start);
     editEnd.val(end);
     editType.val(eventType).prop("selected", true);

     addBtnContainer.show();
     modifyBtnContainer.hide();
     eventModal.modal('show');

     /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
     var eventId = 1 + Math.floor(Math.random() * 1000);
     /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

     //새로운 일정 저장버튼 클릭
     $('#save-event').unbind();
     $('#save-event').on('click', function () {

         var eventData = {
             title: editTitle.val(),
             start: editStart.val(),
             end: editEnd.val(),
             content: editDesc.val(),
             type: editType.val(),
             backgroundColor: editColor.val(),
             textColor: '#ffffff',
             uno:<%=loginUser.getUserNo()%>,
             allDay: false
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
             eventData.start = moment(eventData.start).format('YYYY-MM-DD');
             //render시 날짜표기수정
             eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
             //DB에 넣을때(선택)
             realEndDay = moment(eventData.end).format('YYYY-MM-DD');

             eventData.allDay = true;
         }

         $("#calendar").fullCalendar('renderEvent', eventData, true);
         eventModal.find('input, textarea').val('');
         editAllDay.prop('checked', false);
         eventModal.modal('hide');
        
       

         var title = "tetstst";
         //새로운 일정 저장
         $.ajax({
             type: "get",
             url: "/hagong/ainsert.cal",
             data: 
              eventData
             ,
             success: function (data) {
                 console.log("조회완료");
             
                 //DB연동시 중복이벤트 방지를 위한
                 //$('#calendar').fullCalendar('removeEvents');
                 //$('#calendar').fullCalendar('refetchEvents');
             },
             error:function(data){
             	console.log("시발");
             }
         });
     });
 };
 </script>
</html>