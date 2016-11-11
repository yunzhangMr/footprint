<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 

String role = "";

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="左右结构项目，属于大人员的社交工具">
<meta name="keywords" content="左右结构项目 社交 占座 ">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<script src="${pageContext.request.contextPath}/js/bootstrap-moban/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-moban/js/bootstrap.min.js"></script>

<link href="${pageContext.request.contextPath}/js/bootstrap-moban/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-moban/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-moban/css/slide.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-moban/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-moban/css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-moban/css/jquery.nouislider.css">

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap-table.min.css" rel="stylesheet"/>   

<script>
    
	$(function() {
	    $("#index").addClass("meun-item-active");
	    //根据权限加载导航栏树
	    //TODO jaxa请求
	    
	 //   $("#char").load("${pageContext.request.contextPath}/view/admin/classManage.jsp");
	    
	    //添加点击事件，加载右侧内容
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var id = $(this).attr("href");
			var next = id.split("#")[1];
			$(id).load("../view/admin/"+next+".jsp");
		});
		
       
	});
	
	
</script>
	
		
<title>小脚印</title>

<style>
img {height:200px;width:100%;}

</style>
</head>
<body>
<div id="wrap">
           <!-- banner图 -->
            <div class="row-fluid" id="banner">
	       </div>
				<script type="text/javascript">
				    $("#banner").load("../view/layout/banner.jsp");
				</script>
			<!-- 左侧菜单栏目块 -->
			<div class="leftMeun" id="leftMeun">
				<div id="personInfor">
					<p id="userName">杨鹏</p>
					<p><span>yangxp@qq.com</span></p>
					<p>
						<a>退出登录</a>
					</p>
				</div>
				<div class="meun-title">小脚印幼儿成长记录</div>
		
				<div class="meun-item" id="index" href="#manageClass" aria-controls="manageClass" role="tab" data-toggle="tab">调整班级</div>
				<div class="meun-item" href="#transferClass" aria-controls="transferClass" role="tab" data-toggle="tab">离园调班</div>
			
			</div>
			<!-- 右侧具体内容栏目 -->
		    <div id="rightContent">
		      <div class="tab-content" id="content">  
		        <!-- 班级管理-->
		          <div role="tabpanel" class="tab-pane" id="manageClass">    
		                       
		          </div>
		          <!-- 调离班级 -->
		          <div role="tabpanel" class="tab-pane" id="transferClass">    
		                       
		          </div>
		    </div>
		  
		     </div>
		     
		    
</div>
</body>
</html>