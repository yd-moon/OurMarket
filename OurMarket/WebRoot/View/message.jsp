<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Message</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/Logout.js"></script>


<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/dashboard.css" />
<link rel="stylesheet" type="text/css" href="css/carousel.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/Message.css" />

	<script type="text/javascript">
$(function() {
	$("#button_show_right,#button_show_left").click(function() {
		if ($(this).attr('id').indexOf("right") > 0) {
			if ($("#button_show_left").attr("aria-expanded") == "true") {
				$("#button_show_left").trigger('click');
			}
		} else {
			if ($("#button_show_right").attr("aria-expanded") == "true") {
				$("#button_show_right").trigger('click');
			}
		}
	});
})
</script>
</head>

<body>
<!--这是位于最上方的可以伸缩的菜单栏，宽度充满屏幕，悬浮在最顶上-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<!--navbar-inverse 表示带反色（黑色背景，白色文字）的导航栏，navbar-fixed-top 表示 一直停留在顶部  添加 role="navigation"，有助于增加可访问性-->
<div class="container-fluid">
	<!--流动的容器-->
	<div class="navbar-header">
		<button id="button_show_left" type="button" class="navbar-toggle collapsed" 
			style="float:left;margin-left:15px;"
			data-toggle="collapse" data-target="#navbar-middle" 
			aria-expanded="false"aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<!--这是按钮  缩放按钮-->
		<button id="button_show_right" type="button" class="navbar-toggle collapsed" 
			data-toggle="collapse" data-target="#navbar-right" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
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
			<li><a href="homepage.html">首页</a></li>
			<li><a href="Message.html">消息</a></li>
			<li><a href="personalzoom.html">个人中心</a></li>
			<li><a href="Service.html">客服</a></li>
			<li><a onclick="Logout()" >登出</a></li>
			
		</ul>
		<form class="navbar-form navbar-right">
			<input type="text" class="form-control" placeholder="Search...">
		</form>
	
	</div>
</div>
</nav>

<div class="container-fluid">
		<!--左侧导航栏-->
		<div class="row">
			<div id="navbar" class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<!--这是列表组-->
					<li ><a href="bought.html">已买到宝贝</a></li>
					<li><a href="uncollected.html">未收款宝贝</a></li>
					<li><a href="shelved.html">已上架宝贝</a></li>
					<li><a href="footmark.html">足迹宝贝</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="refundmanage.html">退款管理</a></li>
					<li><a href="GOODmanages.html">物品管理</a></li>
					<li><a href="ordermanage.html">订单管理</a></li>
					<li><a href="Appraise.html">我的评价</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="propertycenter.html">资产中心</a></li>
				</ul>
			</div>
		
			<div  class="col-sm-3 col-md-3 "></div>
			<!--中间导航栏-->
			<div  id="navbar-middle" class="col-sm-3 col-md-2 hidden-sm " >
				<br><br>
				<ul >
					<li ><a href="#"><i class="fa fa-comment fa-lg"></i>系统消息</a></li>
					<li class="active"><a href="#" ><i class="fa fa-envelope-o fa-lg "></i>私信</a></li>
					<li><a  href="#"><i class="fa fa-bell fa-lg"></i>通知</a></li>
					<li><a href="#"><i class="fa fa-cog fa-lg"></i>消息设置</a></li>
					<img src="img/erhuo.png" width="150px" height="300px" class="hidden-xs"/>
				</ul>
			</div>
			<!--聊天窗口-->
		<div   class="col-sm-5 col-md-6 " >
			<ul class="content-reply-box mg " id="chatlog" >
				<li class="odd">
				<a class="user" href="#"><img class="img-responsive avatar_" src="img/avatar.png" alt=""><span class="user-name">Lee</span></a>
				<div class="reply-content-box">
					<span class="reply-time" id="chat-time">03-08 15：00</span>
					<div class="reply-content pr">
						<span class="arrow">&nbsp;</span>
						你好！
					</div>
				</div>
			   </li>
	            <li class="even">
	                <a class="user" href="#"><img class="img-responsive avatar_" src="img/avatar.png" alt=""><span class="user-name">Catherine</span></a>
						<div class="reply-content-box">
							<span class="reply-time">03-08 15：10</span>
							<div class="reply-content pr">
								<span class="arrow">&nbsp;</span>
								吃饭了吗？
							</div>
	                </div>
	            </li>
				</ul>
		<!--发送框-->
			<div > 
			    <form > 
			        <textarea style="width: 100%;" class="span4" id="new_message" name="new_message"></textarea> 
				</form>
				<button class="btn btn-info" id="send-message" onclick="send_message()">发送</button>
			</div> 
		</div>
		</div>
		<div  class="col-sm-3 col-md-2"></div>
</div>




<script src="js/webSocket.js" type="text/javascript"></script>
</body>
</html>