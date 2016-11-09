<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="resource/jquery-1.9.1/jquery.min.js" ></script>
<script type="text/javascript" src="resource/bootstrap-3.3.0-dist/dist/js/bootstrap.js" ></script>
<link rel="stylesheet" href="resource/bootstrap-3.3.0-dist/dist/css/bootstrap.css" type="text/css"></link>

<title>小脚印</title>

<style>
img {height:200px;width:100%;}

</style>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<img alt="banner" src="img/banner.jpg"/>
		</div>
	</div>
	
	<div class="row-fluid" style="float:left;">
		<div class="span6">
			<ul class="nav nav-list">
				<li class="nav-header">
					列表标题
				</li>
				<li class="active">
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">库</a>
				</li>
				<li>
					<a href="#">应用</a>
				</li>
				<li class="nav-header">
					功能列表
				</li>
				<li>
					<a href="#">资料</a>
				</li>
				<li>
					<a href="#">设置</a>
				</li>
				<li class="divider">
				</li>
				<li>
					<a href="#">帮助</a>
				</li>
			</ul>
		</div>
		<div class="span6">
			<form>
				<fieldset>
					 <legend>表单项</legend> <label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span> <label class="checkbox"><input type="checkbox" /> 勾选同意</label> <button type="submit" class="btn">提交</button>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>