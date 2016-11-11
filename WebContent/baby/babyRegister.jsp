<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 让部分国产浏览器默认采用高速模式渲染页面 -->
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>幼儿园管理-入园登记</title>
<link href="${pageContext.request.contextPath}/dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/dist/css/flat-ui.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/dist/img/favicon.ico">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
<script src="../../dist/js/vendor/html5shiv.js"></script>
<script src="../../dist/js/vendor/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container">
				<div class="summary">
					<span class="content-title">宝宝入园登记</span>
				</div>
				<div class="form-group">
					<form id="form" method="post" action="/footprint/" class="form-horizontal" role="form">
						<div class="form-group">
							<div class="form-group">
								<label for="babyname">宝宝姓名</label>
								<div class="col-lg-10">
								<input type="text" class="form-control" id="name" name="babyname"
									   placeholder="宝宝姓名">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label" for="gender">性别</label>
								<label class="radio" for="gender">
								<input data-toggle="radio" type="radio" name="gender" value="男">男
								</label>
								<label class="radio" for="gender">
								<input data-toggle="radio" type="radio" name="gender" value="女">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="birth">出生年月</label>
								<input type="text" class="col-sm-10" id="birth" name="birth" 
									   placeholder="请输入名称">
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="phone">电话号码</label>
								<input type="text" class="col-sm-10" id="name" name="phone"
									   placeholder="请输入名称">
							</div>
						</div>
					
						<div class="form-row-button">
							<input type="submit" class="btn btn-default" name="" value="保存">
							<p class="note">保存时自动生成一个ID号码，宝宝名字的汉语拼音</p>
						</div>
					</form>
					<div class="show-message">
						<div class="top-title">
							<h3>以下信息由家长填写：</h3>
						</div>
						<div class="part-message">
							<div class="message-title">
								<span>宝宝基础信息</span>
							</div>
							<div class="message-row">
								<div class="message-col">
									<label class="label" for="name">属相</label>
									<label class="label-content" for="name">宝宝姓名</label>
								</div>
								<div class="message-col">
									<label class="label" for="name">乳名</label>
									<label class="label-content" for="name">宝宝姓名</label>
								</div>
							</div>
							<div class="message-row">
								<div class="message-col">
									<label class="label" for="name">入园前抚育方式</label>
									<label class="label-content" for="name">宝宝姓名</label>
								</div>
							</div>
						</div>
						<div class="part-message">
							<div class="message-title">
								<span>宝宝健康状况</span>
							</div>
							<div class="message-row">
								<label class="label" for="name">过敏反应（药物、食物等）</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">疾病史或先天病史</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">现在身体状况</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
						</div>
						<div class="part-message">
							<div class="message-title">
								<span>宝宝其它信息</span>
							</div>
							<div class="message-row">
								<label class="label" for="name">喜欢吃的食物</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">喜欢的同伴</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">喜欢做的事</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">性格特点</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
							<div class="message-row">
								<label class="label" for="name">生活自理能力</label>
								<label class="label-content" for="name">宝宝姓名</label>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
</body>
<!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/dist/js/vendor/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/dist/js/vendor/video.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/flat-ui.min.js"></script>
</html>