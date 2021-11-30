<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>테스트 게시판 CRUD</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 공통코드로 따로 뺄거임 -->
 <!-- =====css===== -->
  <!-- 부트스트랩 css -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 데이터테이블 라이브러리 css -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
 
  <!-- =====js===== -->
  <!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <!-- 부트스트랩 js -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  <!-- 데이터테이블 라이브러리 js -->
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
<script type="text/javascript">
$(document).ready(function() {
    $.ajax({url: "boardList", success: function(result){             
        var html = "";
    	result.forEach(function(item){
        	html+= "<tr> <td><a href = 'view?idx=" + item.idx + "'>" + item.title + "</a>"
        })
       $("#listArea").append(html)
       $('#example').DataTable();
     }});
     $("#deleteBtn").click(function(){
    	location.href ="write";
     })
} );

</script>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>테스트 게시판 CRUD</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="board1">게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="signin">로그인</a>
      </li>
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px">
	<div class="row">
		<div class="col-sm-12">
	      <h2>게시판</h2>
			<table id="example" class="display" style="width:100%">
		        <thead>
		            <tr>
		                <th>제목</th>
		            </tr>
		        </thead>
		        <tbody id = "listArea">
		        </tbody>
		    </table>
			<button type="button" class="btn btn-primary" id = "writeBtn">글쓰기</button>
		</div>
	</div>
</div>
</body>
</html>