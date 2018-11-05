/**
 * 分页
 */
$(function() {
	var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
	var current = $('#pager').attr('data-pager-current'); // 当前页数
	var href = $('#pager').attr('data-pager-href'); // 链接地址
	$(document).ready(function() {
		$("#pager").pager({
			pagenumber : current,
			pagecount : pagecount,
			buttonClickCallback : PageClick
		});
	});
	PageClick = function(number) {
		$("#pager").pager({
			pagenumber : number,
			pagecount : pagecount,
			buttonClickCallback : PageClick
		});
		window.location.href = href + number;
	}
});

