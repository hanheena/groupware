$(document).ready(function() {
	$.ajax({
		url: "boardList", success: function(result) {
			var html = "";
			result.forEach(function(item) {
				html += "<tr> <td><a href = 'view?idx=" + item.idx + "'>" + item.title + "</a>"
			})
			$("#listArea").append(html)
			$('#example').DataTable();
		}
	});
	$("#deleteBtn").click(function() {
		location.href = "write";
	})
});

function register_form() {
	
	var fime_name = $("input[name=test_img]").val();
	
	console.log("fime_name 확인 : " + fime_name);

	$("form#test_img_insert").submit();
}