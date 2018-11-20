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

$(function() {
		$("#search").click(function() {
			name = $("input[name='name']").val();
			if (name==""){
				alert("请输入搜索的商品名");
				return
			}
			$.ajax({
				type : "POST",
				url : baselocation + '/recommend/search',
				data : {
					"name" : name,
				},
				dataType : "json",
				success : function(result) {
					if(result.code==1){
						alert("查询成功！");
						$.ajax({
							url : baselocation + "/recommend/search2",
							type : 'get',
							dataType : 'text',
							success : function(result) {
								$(".site_header").hide();
								$(".page-main").hide();
								$("#J_recommend_search").html(result);
							}
						});
					}else{
						alert("不存在此产品");
						return
					}
				}
			})
			
		});
});


