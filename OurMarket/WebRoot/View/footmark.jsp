<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>足迹宝贝</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/Logout.js"></script>

<link rel="stylesheet" href="<%= basePath %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/dashboard.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/carousel.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/Message.css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/bought.css"/>
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/font-awesome.css" />
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
					data-toggle="collapse" data-target="#navbar-left" 
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
						<li><a href="home">首页</a></li>
						<li><a href="privateMessage">消息</a></li>
						<li><a href="personalZoom">个人中心</a></li>
						<li><a href="service">客服</a></li>
						<li><a onclick="Logout()" >登出</a></li>
						
					</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			
			</div>
		</div>
		</nav>
		
		<div class="container-fluid">
				<!--流动的容器-->
				<div class="row">
					<!--这是CSS的自定义样式-->
					<div id="navbar-left" class="col-sm-2 col-md-2 sidebar">
						<!--sidebar  边栏-->
						<ul class="nav nav-sidebar">
							<!--这是列表组-->
							<li><a href="bought">已买到宝贝</a></li>
							<li><a href="uncollected">未收款宝贝</a></li>
							<li><a href="shelved">已上架宝贝</a></li>							
							<li class="active"><a href="footmark">足迹宝贝</a></li>
						</ul>
						<ul class="nav nav-sidebar">
							<li><a href="refundManage">退款管理</a></li>
							<li><a href="goodsManages">物品管理</a></li>
							<li><a href="orderManage">订单管理&nbsp;&nbsp;&nbsp;&nbsp;<span class="badge">3</span></a></li>
							<li><a href="Appraise">我的评价</a></li>
						</ul>
						<ul class="nav nav-sidebar">
							<li><a href="propertyCenter">资产中心</a></li>
						</ul>
					</div>
				</div>
		</div>

		<!--导航栏右侧部分-->
		<div class="col-sm-10  col-sm-offset-3 col-md-10 col-md-offset-2 col-xs-12 hidden-xs" style="padding-left: 30px;padding-right: 30px;margin-bottom: 100px;">
			<div style="overflow-x: scroll;">
				<h1 style="margin-top: ;0px">7.17</h1>
				<table class=" table-responsive" style="border: groove;margin-right: 50px;">
				
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
				
				</table>
			</div>
			
			
			
			<div style="overflow-x: scroll;">
				<h1 style="margin-top: ;0px">7.16</h1>
				<table class=" table-responsive" style="border: groove;margin-right: 50px;">
				<tr>
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
					
					<td style="padding-right: 60px;">
						<div class="row" style="padding-bottom: 0px;padding-top: 10px;padding-left: 20px;">
					 	<a href="#"><img src="<%=basePath%>/img/desk.jpg" style="height: 200px;"></a>
					 	<div class="price" >
					 		<i class="fa fa-rmb"></i><span >86.0</span>
					 	</div>
					 	<p style="">二手书桌	</p>
					 	<div style="text-align: center;">
					 		<button  class="btn btn-default" style="height:30px;">查看</button>
					 	</div>
					 	</div>		
					</td>
				</tr>
				</table>
			</div>
			
		</div>
		
		<!--手机上显示-->
		<div class=visible-xs style="margin: 10px;margin-top: 0px;">
			<div style="margin-top: 10px;">
				<h5 style="margin: 0px;background-color: #E1E6EF;">7.17</h5>
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive  " style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
				
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive" style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
				
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive" style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
			</div>
			
			<div style="margin-top: 10px;">
				<h5 style="margin: 0px;background-color: #E1E6EF;">7.16</h5>
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive  " style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
				
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive  " style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
				
				<table class="table " style="border: groove;">	
					<td class="col-xs-5">
						<img src="<%=basePath%>/img/desk.jpg" class="img-responsive  " style="height: 130px;"/>
					</td>
					<td class="col-xs-7" >
					<div >
						 二手书桌
					</div>
					<br><br><br>
					<span style="color: orangered;font-size: larger;display: block;"><i class="fa fa-rmb"></i>86.0</span>
					<button class="btn btn-default"style="float: right;margin-left: 20px;">查看</button>
					</td>
				</table>
			</div>
		</div>
		
		
</body>	
</html>
