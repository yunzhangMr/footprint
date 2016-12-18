<%@page import="com.aj.footprint.model.vo.SessionInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
//String roleids = "2";
//String roleids = "1";

SessionInfo session = (SessionInfo)request.getSession().getAttribute("sessionInfo");
String roleids = session.getRoleIds();

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="左右结构项目，属于大人员的社交工具">
<meta name="keywords" content="左右结构项目 社交 占座 ">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/json/json2.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.css" rel="stylesheet"/>

<script>
    
    $(function() {	
    	  //加载菜单栏
        $.ajax({ 
         type : 'POST',
         datatype : 'JSON',
         url :  '${pageContext.request.contextPath}/menuController/dogetMenu',
         data : {roleids:'<%=roleids %>'},
		 success : function(data) {
			var obj = jQuery.parseJSON(data);
			for(var i in obj){ 
				var url = obj[i].url;
				var urls = url.split("/");
				var id = urls[urls.length-1];
				var div = "<div id='"+id+"' class='meun-item' href='"+obj[i].url+"' onclick=\"addclick('"+obj[i].url+"','"+id+"')\">"+obj[i].fname+"</div>";
			    $("#title").append(div);						  
			}
    
		 },
         error:function(data){
        	 alert("菜单加载出错，请刷新页面");   
         }
	
	});
    });
   
    function addclick(href,id) {	
       //给菜单添加点击事件       
	        $("#content").empty();
			$(".meun-item").removeClass("meun-item-active");
			$('#'+id).addClass("meun-item-active");
			$("#content").load("../view/"+href+".jsp");
	}
       
</script>
	
		
<title>小脚印</title>

<style>
img {height:50px;width:100%;}

</style>
</head>
<body>
<div id="wrap">
           <!-- banner图 -->
       <!--      <div class="row-fluid" id="banner">
	       </div>
				<script type="text/javascript">
				    $("#banner").load("../view/layout/banner.jsp");
				</script> -->
			<!-- 左侧菜单栏目块 -->
			<div class="leftMeun" id="leftMeun">
				<div id="personInfor">
					<p id="userName">${sessionScope.sessionInfo.term}</p>
					<p><span>yangxp@qq.com</span></p>
					<p>
						<a>退出登录</a>
					</p>
				</div>
		     <div id="title">
			 <div class="meun-title">小脚印幼儿成长记录</div>
			 </div>
			</div>
			<!-- 右侧具体内容栏目 -->
		    <div id="rightContent">
		      <div class="tab-content" id="content">         
		          </div>
		    </div>
		  <div class="modal-footer" id="foot">
		  <script type="text/javascript">
               $("#foot").load("../view/layout/foot.jsp");
              </script>
           </div>
		     
		    
</div>
</body>
</html>