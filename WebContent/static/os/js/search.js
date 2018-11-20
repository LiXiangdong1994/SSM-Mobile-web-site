$(function() {
	 show_search();
});
function show_search() {
	alert("ss");
	$.ajax({
		url : baselocation + "/search",
		type : 'get',
		dataType : 'text',
		success : function(result) {
			$("#J_recommend_search").html(result);
		}
	});
}