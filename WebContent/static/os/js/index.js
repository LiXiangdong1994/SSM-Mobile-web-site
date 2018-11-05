$(function() {
	show_hot_category(); // 热门分类
});



/**
 * 热门分类
 */
function show_hot_category() {
	$.ajax({
		url : baselocation + "/recommend/hot",
		type : 'get',
		dataType : 'text',
		success : function(result) {
			$("#J_hotCategory").html(result);
		}
	});
}

