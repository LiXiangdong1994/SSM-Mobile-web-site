/**
 * 注册页面
 */
$(function() {
	//第一页的确定按钮
	$("#btn_part1").click(function() {
		var params = '';
		$("#verifyUser input").each(function() {
			params += $(this).serialize() + "&";
		});
		console.log(params);
		$.ajax({
			type : "POST",
			url : baselocation + '/pass/register',
			data : params,
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					   $(".message").hide();;
                            window.location.href = baselocation + '/pass/login';
				} else {
                    $(".message").show();
                    $(".message").children("label").text(result.message);
				}
			}
		})
	});
	});


/**
 * 登陆页面按钮栏控制
 */
$(function() {
	$("#btn_login").click(function() {
		
		loginPassword = $("#password").val();
		loginName = $("input[name='loginName']").val();
		if (loginPassword==""||loginName==""){
			alert("请填写完整的手机号和密码");
			return
		}
		if (loginPassword.length != 256) {
			
		}
		$.ajax({
			type : "POST",
			url : baselocation + '/pass/login',
			data : {
				"loginName" : loginName,
				"loginPassword" : loginPassword
			},
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					$(".message").hide();
					window.location.href = baselocation + '/index';/*验证成功执行index的action*/
				} else {
					$(".message").show();
					alert("账号或密码不正确")
					$(".message").children("label").text(result.message);
				}
			}
		})
	});
});


/**
 * 修改密码
 */
$(function() {
	$(".modify").click(function() {
		
		password = $("#password").val();
		newpassword = $("input[name='newpassword']").val();
		if (password==""||newpassword==""){
			alert("请输入密码");
			return
		}
		$.ajax({
			type : "POST",
			url : baselocation + '/pass/modify',
			data : {
				"password" : password,
				"newpassword" : newpassword
			},
			dataType : "json",
			success : function(result) {
				if (result.code == 1) {
					alert("密码修改成功，请重新登录！");
				} else {
					alert("原密码不正确")
				}
			}
		})
	});
});



