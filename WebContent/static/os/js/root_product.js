$("#project").on("click", "li", function(){
        $("#osCategory_name").val($(this).text());
});

function root_product_delete(obj, data) {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/root/' + data,
			success : function(result) {
				if (result.code == 1) {
					alert("商品删除成功！")
					location.reload();
				} else {
				}
			}
		})
}

/**
 * 点击保存商品信息 
 */
$(function() {
	$("#J_save").click(function() {
		var c = $("#product_name"),
			g = $("#product_showPrice"),
			h = $("#product_introduce"),
			i = $("#product_picImg"),
			I= $("#product_picImg2"),
			j = $("#product_pageTitle"),
			s = $("#product_pageDescription"),
			Q = $("#product_productId"),
	 		W = $("#osCategory_name"),
		    E = $("#osCategory_categoryId"),
		    x=$("#product_detailImg"),
		    X=$("#product_detailImg2")
			r={};
		var t = $.trim(c.val());
		 r.name = t;
		var w = $.trim(g.val()); 
		r.showPrice = w;
		var C = $.trim(h.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, "");
		r.introduce = C;
		var F = $.trim(i.val());
		r.picImg = F;
		var H = $.trim(j.val());
		r.pageTitle = H;
		var S = $.trim(s.val());
		r.pageDescription = S;
		var T = $.trim(Q.val());
		r.productId = T;
		var R = parseInt($.trim(W.val()));
		r.categoryId = R;
		var V = $.trim(x.val());
		r.detailImg = V;
		if(r.picImg==""){
			var F2 = $.trim(I.val());
			r.picImg = F2;
		}
		if(isNaN(R)){
			var R2 = $.trim(E.val());
			r.categoryId = R2;
		}
		if(r.detailImg==""){
			var V2 = $.trim(X.val());
			r.detailImg = V2;
		}
		if(r.categoryId==""||r.name==""||r.showPrice==""||r.introduce==""||r.pageTitle==""||r.pageDescription==""){
			alert("请认真填写收货信息，享受更好服务");
		}else{
			 saveAddr(r);
		}
	})
})

/*点击“取消”，关闭修改	*/
$(function() {
	$("#J_cancel").click(function() {
		history.go(-1);
	})
})


/**
 * 保存商品信息的方法
 */
function saveAddr(a) {
	
	//新增 和 修改
	console.log(a);
	if (a.productId == null || a.productId == "") {
		$.ajax({
			
			type : "POST",
			url : baselocation + '/root/product/insert',
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					alert("添加成功");
					window.location.href = baselocation + '/root/productlist_2';
				} 
			}
		})
	} else {
		$.ajax({
			type : "post",
			url : baselocation + '/root/product/update',
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					alert("修改 成功");
					window.location.href = baselocation + '/root/productlist_2';
				} else {
					alert("修改信息失败，请重新认真填写");
				}
			}
		})
	}
} 