$(document).ready(function() {
	/*이미지 첨부 예시 숨김*/
	/*get_test_img();*/
});

/*function get_test_img() {
	
	
	$.ajax({
		url : "/test_img_view",
		type : "POST", 
		dataType : 'json', 
		contentType: 'application/json; charset=utf-8',
		success : function(data) {
			
			var data_json = data;
		
			
			var file_path =  data_json[0].file_path;
			
			var file_path_replace = file_path.replace(/\\/ig, "/").replace("C:", "");
			
				console.log("data 확인 : " + file_path_replace);
				
			var img_str = "<img src='"+file_path_replace+"' alt='테스트이미지'>";
						
						
			$('#dashboard .commute').append(img_str);
		}
	});
}*/

function register_form() {
	
	var fime_name = $("input[name=test_img]").val();
	
	console.log("fime_name 확인 : " + fime_name);

	$("form#test_img_insert").submit();
}