/**
 * 商品规格选择
 */
$(function () {
    $(".goods-size").each(function () {
        var i = $(this);
        var p = i.find("ul>li");
        p.click(function () {
            $(this).addClass("current").siblings("li").removeClass("current");
            i.attr("data-attrval", $(this).attr("data-aid"))
            getattrprice() //输出价格
        })
    })

    var $elements = $('.goods-size');
    $elements.each(function () {
        var $this = $(this);
        $this.children('ul').children('li:first').click(); //第一种规格
    })

    //获取对应属性的价格
    function getattrprice() {
        var defaultstats = true;
        var _val = '';
        var _resp = {
            score: ".sys_item_score",
            price: ".goods-price",
        }
        //输出对应的class
        $(".goods-size").each(function () {
            var i = $(this);
            var v = i.attr("data-attrval");
            if (!v) {
                defaultstats = false;
                $('#goodsDetailBtnBox').css('display', 'block');
                $('#goodsDetailBtnBoxForInform').css('display', 'none');
            } else {
                _val += _val != "" ? "," : "";
                _val += v;
            }
        })
        if (!!defaultstats) {
            if (typeof (sys_item[_val]) == "undefined") {
                $('#goodsDetailBtnBox').css('display', 'none');
                $('#goodsDetailBtnBoxForInform').css('display', 'block');
            } else {
                //_score = sys_item[_val]['score'];
                _price = sys_item[_val]['price'];
                _productSpecNumber = sys_item[_val]['productSpecNumber'];
                $('#goodsDetailBtnBox').css('display', 'block');
                $('#goodsDetailBtnBoxForInform').css('display', 'none');
            }

        } else {
            // 默认商品规格
            //_score = default_score;
            _price = default_price;
            _productSpecNumber = sys_item['productSpecNumber'];
        }
        //输出价格
        //$(_resp.score).text(_score); //其中的math.round为截取小数点位数
        $(_resp.price).text(_price);
        $("#goodsDetailAddCartBtn").attr("data-product-spec-number", _productSpecNumber);
        $("#goodsSubBarAddCartBtn").attr("data-product-spec-number", _productSpecNumber);
    }
})

/**
 * 默认商品规格
 */
$(function () {
    if ($('#J_goodsInfoBlock').children('.goods-size').length <= 0) {
        // 默认商品规格
        //_score = sys_item['default']['score'];
        _price = sys_item['default']['price'];
        _productSpecNumber = sys_item['default']['productSpecNumber'];

        // 输出对应的class
        var _resp = {
            //score: ".sys_item_score",
            price: ".goods-price",
        }

        $(_resp.score).text(_score); // 其中的math.round为截取小数点位数
        $(_resp.price).text(_price);
    }
})
/**
 * 加入购物车
 */
function add_cart(obj) {
    var productSpecNumber = $(obj).attr("data-product-spec-number");
    if(productSpecNumber == "" || productSpecNumber == undefined || productSpecNumber == null) {
        productSpecNumber = sys_item['default']['productSpecNumber'];
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            'productSpecNumber': productSpecNumber
        },
        url: baselocation + '/cart',
        success: function (result) {
            console.log(result.message);
            if (result.code == 1) {
                window.location.href = baselocation + '/cart/' + result.message;
            } else if (result.code == 401) {
                window.location.href = baselocation + '/pass/login';
            } else {
                layer.alert(result.message, {
                    icon: 2
                });
            }
        }
    })
}