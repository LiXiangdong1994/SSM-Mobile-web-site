function order_list_delete(obj, data) {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/buy/' + data,
			success : function(result) {
				if (result.code == 1) {
					alert("订单删除成功！")
					location.reload();
				} else {
				}
			}
		})
}
