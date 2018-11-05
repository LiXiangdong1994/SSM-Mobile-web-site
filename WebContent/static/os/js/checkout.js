/*打开地址栏*/
function Show(a) {
		if ("object" != typeof $(this)) return !1;
		$(".address-edit-box").show();
		var e = $(document).width(),
			f = $(document).height();
		$("#J_editAddrBackdrop").show()
}

/*关闭地址栏*/
function Close() {
	$(".address-edit-box").hide();
}


/*点击“添加地址”*/
$(function() {
	$(".address-item-new").click(function(){
		$(".address-edit-box").show();
	})
})

/**
*点击修改，修改收货地址
*/
$(function() {
	$(".modify").on("click", function() {
		 var b=$(this).parent().parent('.addressmassage');
			var c=b.attr("data-consignee"),
				d=b.attr("data-tel"),
				e=b.attr("data-address"),
				f=b.attr("data-zipcode"),
				g=b.attr("data-tag_name"),
				h=b.attr("data-address_id");
			return $("#user_name").val(c),
			$("#user_phone").val(d),
			$("#user_address").val(e),
			$("#user_zipcode").val(f),
			$("#user_tag").val(g),
			$("#address_id").val(h),
			Show(b), !1
	})
})
/**
 * 点击保存收货地址
 */
$(function() {
	$("#J_save").click(function() {
		var c = $("#user_name"),
			g = $("#user_address"),
			h = $("#user_zipcode"),
			i = $("#user_phone"),
			j = $("#user_tag"),
			s = $("#address_id"),
			r={};
		var t = $.trim(c.val());
		 r.userName = t;
		var w = $.trim(i.val()); 
		r.userPhone = w;
		var C = $.trim(g.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, "");
		r.userAdress = C;
		var F = $.trim(h.val());
		r.userZipcode = F;
		var H = $.trim(j.val());
		r.userTag = H;
		var S = $.trim(s.val());
		r.addressId = S;
		if(r.userName==""||r.userPhone==""||r.userAdress==""||r.userZipcode==""||r.userTag==""){
			alert("请认真填写收货信息，享受更好服务");
		}else{
			 saveAddr(r), Close();
		}
	})
})

/*点击“取消”，关闭修改	*/
$(function() {
	$("#J_cancel").click(function() {
		Close();
	})
})


/**
 * 保存收货地址的方法
 */
function saveAddr(a) {
	
	//新增 和 修改
	console.log(a);
	if (a.addressId == null || a.addressId == "") {
	
		$.ajax({
			type : "POST",
			url : baselocation + '/pass/address/insert',
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					window.location.reload();
				} 
			}
		})
	} else {
		$.ajax({
			type : "post",
			url : baselocation + '/pass/address/update',
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					window.location.reload();
				} else {
					alert("修改信息失败，请重新认真填写");
				}
			}
		})
	}
}
/**
 * 删除收获地址
 */
function address_delete(obj, data) {

		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/pass/address/delete/' + data,
			success : function(result) {
				if (result.code == 1) {
					$(obj).parent().parent("div").remove();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
}

/**
 * 去结算
 */
$(function() {
	$("#J_checkoutToPay").on("click", function() {
		var params = {};
		params.addressId = $("#J_addressList").find(".addressmassage").attr('data-address_id');
		console.log(params);
		$.ajax({
			url : baselocation + '/buy/confirm',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(result) {
				if (result.code == true) {
					window.location.href = baselocation + '/buy/confirm/' + result.message;
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		});
	})
})
