<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>貮获平台注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="<%= basePath %>/js/jquery.min.js"></script>
<script src="<%= basePath %>/js/bootstrap.min.js"></script>
<script src="<%= basePath %>/js/drag.js" type="text/javascript"></script>

<link rel="stylesheet" href="<%= basePath %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= basePath %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= basePath %>/css/carousel.css" />
<link rel="stylesheet" href="<%= basePath %>/css/dashboard.css" />

<style type="text/css">
.form-control {
	/*width: 70%;*/
	
}

#Mbody {
	font-size: large;
}

#menu {
	
}

body {
	background-image: url(../img/bgImg/bg_signUp.png);
	height: 100%;
}
</style>
<script type="text/javascript">
		</script>
</head>
<body onload="creatCode();">
	<!--这是位于最上方的可以伸缩的菜单栏，宽度充满屏幕，悬浮在最顶上-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!--navbar-inverse 表示带反色（黑色背景，白色文字）的导航栏，navbar-fixed-top 表示 一直停留在顶部  添加 role="navigation"，有助于增加可访问性-->
	<div class="container-fluid">
		<!--流动的容器-->
		<div class="navbar-header">

			<!--这是按钮  缩放按钮-->
			<button id="button_show_right" type="button"
				class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#navbar-right" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <!--<img src="img/th.jpg" style="height: 100%;width: 100%;"/>-->
				这是文字/图片logo <!--条件：图片要控制宽度，文字也要控制长度，不然会溢出-->
			</a>
			<!--这是logo标志-->
		</div>
		<!--这是向右对齐的列表-->
		<div id="navbar-right" class="navbar-collapse collapse">
			<!--这是一个汉堡按钮-->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home">首页</a></li>
				<li><a href="http://localhost:8080/OurMarket/privateMessage">消息</a></li>
				<li><a href="personalZoom">个人中心</a></li>
				<li><a href="service">客服</a></li>
				<li><a onclick="Logout()">登出</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
	</nav>
	<!--主界面-->
	<form action="../signUp" name="signUpForm" id="signUpFrom"
		method="post">
		<div class="container-fluid">

			<div class="row" style="background-color: " id="Mbody">
				<div id="blank_left" class="col-xs-1 col-sm-2 col-md-2 col-lg-2 ">
				</div>
				<div>
					<!--这里是提示框-->
				</div>
				<div id="menu" class=" col-xs-12 col-sm-10 col-md-5 col-lg-offset-2 "
					style="background-color: ; ">
					<!--此处更改了源bootstrap样式col-lg-offset-1  {margin-left:10.33333333%;width: 33.33333333%}  -->

					<div id="sbody" class="col-xs-12  col-sm-12 col-md-12 "
						style="background-color: ;text-align: left;padding-top: 0%;">
						<div style="padding-top: 8%;text-align:center" id="sign">
							<h1 class="page-header" style="display: inline;">注册页面</h1>
						</div>
						<div id="smBody" class="form-group"
							style="background-color: #f0f0f0">
							<div id="ssBody" class="form-group" style=";margin: 20px">
								<div class="form-group">
									<label>手机号：</label> <input type="text" class="form-control"
										id="name1" placeholder="请输入手机号" name="phone">
								</div>
								<div id="checkUpPhone">
									<!--这是填写手机号提示框-->
								</div>
								
								
								<div class="form-group col-xs-12 " style="padding-left:0px ">
									<div class="form-group">
										<label>验证码:</label>
										<div style="padding: 0">
										<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8"
											style="padding: 0px ">
											<input type="text" class="form-control "
												style="display:inline;" id="YZMcode" placeholder="请输入本地验证码">
										</div>
										<input style=" height: 34px; display:inline;" id="YZM"
											class="btn btn-default col-xs-12 col-sm-4 col-md-4 col-lg-4  "
											onclick="creatCode()" readonly="readonly"></input>
									</div>
									</div>
									<div id="checkUpYZM">
										<!--检查滑动框是否完全-->
									</div>
								</div>


								<div class="form-group col-xs-12 " style="padding-left:0px ">
									<label class="">手机验证码：</label>
									<div style="padding: 0">
										<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8"
											style="padding: 0px ">
											<input type="text" class="form-control "
												style="display:inline;" id="name" placeholder="请输入手机验证码">
										</div>
										<button id="CodeBtn" style=" height: 34px; display:inline;"
											class="btn btn-default col-xs-12 col-sm-4 col-md-4 col-lg-4  "
											onclick="">获取验证码</button>
									</div>
								</div>
								<div id="checkUpCode">
									<!--检查验证码-->
								</div>

								<div class="form-group">
									<label>输入密码：</label> <input type="password"
										class="form-control" id="setP" placeholder="" name="password">
								</div>
								<div id="checkUpPa">
									<!--检查初始密码-->
								</div>
								<div class="form-group">
									<label>确认密码：</label> <input type="password"
										class="form-control" id="reSetP" placeholder="">
									<div id="checkUpRP">
										<!--检查重复密码-->
									</div>
								</div>
									<div style="text-align:center;">
										<input type="submit" disabled="disabled" class="btn btn-default"  id="submit" value="提交" readonly="readonly">
										<br>
										<br>
									</div>
							</div>
						</div>
					</div>
				</div>
				<div id="blank_right" class="col-xs-1 col-sm-2 col-md-2 col-lg-2 ">

				</div>
			</div>

		</div>
	</form>
	<div class="row" style="padding-top: 60px; clear: both;">
		<div class="col-md-12 text-center">
			<p class="col-md-12">
				<small>&copy; 貮获引资 <a
					href="http://localhost:8080/OurMarket/" target="_blank" title="貮获">联系我们</a>
					- Collect from <a href="http://localhost:8080/OurMarket" title="建议"
					target="_blank">建议</a></small>
			</p>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
<script type="text/javascript">

	var passSign = false;
	var second = 60;
	var codeBtn = document.getElementById("CodeBtn");
	var password = document.getElementById("setP");
	var rePassword = document.getElementById("reSetP");
	var checkUpRP = document.getElementById("checkUpRP");
	var Mcode;
	var checkYZM=document.getElementById("checkUpYZM");
	var Menter=document.getElementById("submit");
	codeBtn.onclick = function time() {
		if (second <= 0) {
			second = 60;
			codeBtn.disabled = false;
			codeBtn.innerHTML = "重新发送";
		} else {
			second--;
			codeBtn.disabled = true;
			codeBtn.innerHTML = "<i style='color: red'>" + second + "</i>" + "可再次发送";
			setTimeout(function() {
				time()
			}, 1000);
		}

	}

	rePassword.onblur = function() {
		if ((password.value != "") && (password.value !== rePassword.value)) {
			checkUpRP.innerHTML = "<img src='<%=basePath%>/img/wrong.png' alt=''> <i>密码不相同请重新输入</i>   ";
		//                password.value="";
		//                rePassword.value="";
		  Menter.disabled="disabled";
		} else if (password.value != "") {
			checkUpRP.innerHTML = "<img src='<%=basePath%>/img/right.png' alt=''> <i>密码验证通过</i>   ";
			passSign = true;
			if(passSign == true){
			var YZMcode=document.getElementById("YZMcode");
			console.log(YZMcode.value.toUpperCase())
			if(YZMcode.value.toUpperCase()==Mcode){
				Menter.disabled=false;
			}
			else{
			  checkYZM.innerHTML = "<img src='<%=basePath%>/img/wrong.png' alt=''> <i>验证码错误</i>   ";
			  setTimeout(function(){ checkYZM.innerHTML =""},5000);
			  creatCode();
			  Menter.disabled="disabled";
			}
		}
		} else {
			checkUpRP.innerHTML = "<img src='<%=basePath%>/img/wrong.png' alt=''> <i>密码不能为空</i>   ";
		}

	}

	function creatCode() {
	   var code = document.getElementById("YZM");
		Mcode = "";
		var codeLength = 4; //验证码的长度
		code.value = "";
		var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

		for (var i = 0; i < codeLength; i++) {
			var charIndex = Math.floor(Math.random() * 32);
			Mcode += selectChar[charIndex];
		}
		if (Mcode.length != codeLength) {
			createCode();
		}
		code.value = Mcode;
	}
	
	

</script>

</html>