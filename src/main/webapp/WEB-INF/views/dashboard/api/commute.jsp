<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script type="text/javascript">
      // f110ae2e.4393a7f81ed14d0fb10195f5325faa2c
      $(document).ready(function () {
        $("#aaa").click(function () {
          $.ajax({
            type: "GET",
            url: "http://localhost:8080/workapi",
            success: function (res) {
              // console.log("성공")
              // console.log(res)
            },
            error: function (res) {
              var json = res;
              // console.log(json)
            },
          });
        });

        $("#kkk").click(function () {
          // console.log("click")
          $.ajax({
            type: "GET",
            url: "http://api.kakaowork.com/v1/users.list",
            headers: {
              Authorization: "Bearer f110ae2e.4393a7f81ed14d0fb10195f5325faa2c",
              "Content-Type": "application/json",
            },
            success: function (res) {
              // console.log(res.code)
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
              // console.log("xx")
            },
          });
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <button class="btn btn-primary" id="attend_btn">go kakao</button>
      <button class="btn btn-primary" id="leave_btn">go aaa</button>
    </div>
  </body>
</html>
