<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//String babyid = "1";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />
<title>宝宝班级调整</title>

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<script type="text/javascript">
    
    $(function () {
    	 
    	 var CTCs;
    	 myInit();
	   	 
    	});
    	
    	
    	/*
    		动态获取学年，学期，得到班级
    	*/
    	var createArray = new Array();
    	
    	function myInit() {
    		$.post("${pageContext.request.contextPath}/commentTTController/getItemCTC",null,function(data){
    			CTCs = data;
    			var json = eval('('+data+')');
    			for(var i in json){
    				if($.inArray(json[i].createyear,createArray)==-1){
    					createArray.push(json[i].createyear);
    				}
    			}
    			$("#grade").empty();
    			for(var j in createArray){
    				$option = '<option value="'+createArray[j]+'">'+createArray[j]+'-'+(Number(createArray[j])+1)+'</option>'
    				$("#grade").append($option);
    			}
    			getTerm($("#grade").val());
    			$("input[name='term']").on("change",function(){
        			getClassName();
        			getCommentResult();
            	});
    		});
		}
    	
		function getClassName() {
			var json = eval('('+CTCs+')');
    		for(var i in json){
    			if($("#grade").val()==json[i].createyear&&$("input[name='term']:checked").val()==json[i].term){
    				$("#className").text(json[i].class_name);
    			}
    		}
		}
		
		function getTerm(pjcreateyear) {
			var json = eval('('+CTCs+')');
    		$("#pjterm").empty();
    		for(var i in json){
    			if(pjcreateyear==json[i].createyear){
    				if(json[i].term=='上学期'){
    					$label = '<label class="" style="padding-top:5px;">'
    						+'<input type="radio" name="term" id="term1" value="上学期">上学期</label>';
    					$("#pjterm").append($label);
    				}else{
    					$label = '<label class="" style="padding-top:5px;margin-left:20px;">'
    						+'<input type="radio" name="term" id="term2" value="下学期">下学期</label>';
    					$("#pjterm").append($label);
    				}
    			}
    		}
		}
		
		function getCommentResult() {
			$.post("${pageContext.request.contextPath}/commentTTController/getCommentTTResult",{createyear:$("#grade").val(),term:$("input[name='term']:checked").val()},function(data){
				/* alert(data); */
				var json = eval('('+data+')');
				$("#sgd").val(json[0].sparkle);
				$("#jbfm").val(json[0].progress);
				$("#gbzd").val(json[0].guidance);
				$("#yxys").val(json[0].factors);
				$("#zdjh").val(json[0].plan);
			});
		}
    	
    	$("#grade").on("change",function(){
    		getTerm($(this).val());
    		$("input[name='term']").on("change",function(){
    			getClassName();
    			getCommentResult();
        	});
    	});
    	
    	
    	
    </script>
</head>
<style>
/* .wordCount{ position:relative;width:90%; } */
.wordCount textarea{ width: 100%; height: 100px;}
.wordCount .wordwrap{ position:absolute; right: 30px; bottom: 6px;}
.wordCount .word{ color: red; padding: 0 4px;}
</style>
<body>

	<div class="wrap1">
	  <div class="panel panel-default panel-expand1">
	   <div class="panel-body panel-body-expand1">
	    <form id="formSearch" class="form-horizontal" role="form">
	     <div class="row">
	     	<label class="control-label col-sm-1 label-expand"  for="grade">所在学年</label>
		 	<div class="col-sm-2 text-center">
			 	<select  name="grade" id="grade" class=" show-tick form-control"  >
	         	</select> 
		    </div>
		    <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="pjterm">所在学期</label>
		    <div id="pjterm" class="col-sm-3 text-left">
			</div>
	     	<div class="col-sm-4 text-center"><label style="padding-top:5px;" id="className"></label></div>
	     	<!-- <div class="col-sm-3 text-center">
	     		<label class="" style="padding-top:5px;">
					<input type="radio" name="stageBaby" id="stageBaby1" value="开学">开学</label>
			   	<label class="" style="margin-left:20px;">
					<input type="radio" name="stageBaby" id="stageBaby2" value="期中">期中</label>
				<label class="" style="margin-left:20px;">
					<input type="radio" name="stageBaby" id="stageBaby3" value="期末">期末</label>
	     	</div> -->
	     </div>
	     
	    
	    </form>
	   </div>
	  </div>  
	</div>   
	
	<div class="wrap2">
	  <div class="panel panel-default panel-expand2">
	  	<div class="panel-body panel-body-expand2">
			<label class="control-label" ><font style="font-size:14px;">孩子的闪光点（轶事记录）</font><font style="font-size:12px;">本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和家长共同欣赏。</font></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_sgd" title="闪光点" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="sgd" placeholder="textarea还剩余字数统计" readonly></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
		</div>
	  </div>
	</div>

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  		<div class="row" style="padding:10px 15px 0;">
  			<div class="col-sm-3">
  				<label class="control-label" ><span style="font-size:14px;">期末幼儿发展分析</span></label>
  			</div>
  			<!-- <div class="col-sm-1 col-sm-offset-7">
		       <button type="button" id="btn_comExp_" class="btn btn-primary btn-sm">
					保存
				</button>
	     	</div> -->
	     	<input id="commentid" type="hidden" />
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">本学期内有哪些明显进步的方面：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_jbfm" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="jbfm" placeholder="textarea还剩余字数统计" readonly></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">需要加强个别指导的方面：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_gbzd" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="gbzd" placeholder="textarea还剩余字数统计" readonly></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">影响因素分析：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_yxys" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="yxys" placeholder="textarea还剩余字数统计" readonly></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">个别指导计划：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_zdjh" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="zdjh" placeholder="textarea还剩余字数统计" readonly></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
	</div>
  </div>
</div>

</body>
</html>