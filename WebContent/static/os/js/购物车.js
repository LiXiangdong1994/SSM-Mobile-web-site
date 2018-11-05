
window.onload=function(){ 
//全选 反选		
	$('input[class="all_check"]').click(function(){           
       if($(this).is(':checked')){  
                $('.son_check').each(function(){  
                	 $(this).prop("checked",true);
                });  
                setPrice();
        }else{  
        	
            $('.son_check').each(function(){  
                    $(this).prop("checked",false);  
                });  
            var piece_num=parseInt($('.piece_num').html());//已选商品数量
            $(".piece_num").html("0");
            var total_text=parseInt($(".total_text").text());//共计
            $(".total_text").html("0.00");
        }       
    }); 

	var $add = $('.add');
	var $reduce = $('.reduce');
	var table = document.getElementById('cartTable'); // 购物车表格
	var tr = table.rows; //行
	
//加
	$add.click(function(){ 
		
		
		for (var i = 0; i <tr.length; i++) {
			var countInout=$(this).parent().find('input'); 
			var value=parseInt(countInout.val());
			tr[i].onclick = function(e) {
			var e = e || window.event;
			var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
			var productSpecNumber = this.getAttribute('data-sid');
			var buyNumber =value+1;
			$.ajax({
				type : 'get',
				datatype : 'json',
				url : baselocation + '/cart/add/' + productSpecNumber,
				data : {
					'buyNumber' : buyNumber
				}
			});
		}
		}
	}) 
//减	
	$reduce.click(function(){ 
		for (var i = 0; i <tr.length; i++) {
			var countInout=$(this).parent().find('input'); 
			var value=parseInt(countInout.val());
			if(value>1){
			tr[i].onclick = function(e) {
			var e = e || window.event;
			var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
			var productSpecNumber = this.getAttribute('data-sid');
			var buyNumber =value-1;
			$.ajax({
				type : 'get',
				datatype : 'json',
				url : baselocation + '/cart/delete/' + productSpecNumber,
				data : {
					'buyNumber' : buyNumber
				}
			});
		}
					}else {
						alert("数量已经为最低！");
				}
	}
		
}) 	
//单选时计算底下总价	
$(".son_check").click(function(){
				
			$('input[class="all_check"]').prop("checked",false);  
					var $price =$(this).parents('tr').find('#sum_price').text();//每样商品的总价
					  var price2 =parseInt($price.substring(1));//每样商品的总价转整型
					  var piece_num=parseInt($('.piece_num').html());//已选商品数量
					  var total_text=parseInt($(".total_text").text());//共计
					  if($(this).is(':checked')){	
						  total_text+=price2;
						  piece_num+=1;
						  $(".piece_num").html(piece_num);
						  $(".total_text").html(total_text.toFixed(2));
					  }else{
						  total_text-=price2;
						  piece_num-=1;
						  $(".piece_num").html(piece_num);
						  $(".total_text").html(total_text.toFixed(2));  
					  }
			
		});	
//全选时计算底下总价	
function setPrice() {
		  var piece_num=parseInt($('.piece_num').html());//已选商品数量
		  var total_text=parseInt($(".total_text").text());//共计
		 
		  piece_num=0;
		  total_text=0.00;
		var checkTure=$(".son_check");
			for(var i=0;i<checkTure.length;i++){
				if(checkTure.is(':checked')){
					piece_num+=1;
					  $(".piece_num").html(piece_num);
						  var price= parseInt(checkTure.eq(i).parents('tr').find('#sum_price').text().substring(1));//每样商品的总价转整型
						  total_text+=price;
						  $(".total_text").html(total_text.toFixed(2));
				}
				 
		}
	}

	
};
/*生成订单，跳转订单页*/
function J_goCheckout() {
	if ($('#J_goCheckout').hasClass('btn-primary')) {
		window.location.href = baselocation + '/buy/checkout'
	}
}

/**
 * 购物车商品删除
 */
function cart_list_delete(obj, data) {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/cart/' + data,
			success : function(result) {
				if (result.code == 1) {
					$(obj).parent().parent().parent("tr").remove();
					$('#J_cartBar').click();
					alert("商品删除成功！")
					location.reload();
				} else {
				}
			}
		})
}
		

/*去购买商品*/
function go() {
	window.location.href = baselocation + '/index';
}

	


	