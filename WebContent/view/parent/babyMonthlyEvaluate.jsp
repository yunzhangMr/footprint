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
    	 
    	 //var CTCs;
    	 //myInit();
    	 
    	 var items;
    	 getItems();
	   	 
    	});
    	
    	
    	/*
    		动态获取学年，学期，得到班级
    	*/
    	/* var createArray = new Array();
    	
    	function myInit() {
    		$.post("${pageContext.request.contextPath}/commentTMController/getItemCTC",null,function(data){
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
        			getMonth();//getCommentResult();
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
			$.post("${pageContext.request.contextPath}/commentTMController/getCommentTMResult",{createyear:$("#grade").val(),term:$("input[name='term']:checked").val(),month:$("input[name='month']:checked").val()},function(data){
				var json = eval('('+data+')');
				$("#behavior").val(json[0].behavior);
				$("#suggestion").val(json[0].suggestion);
			});
		}
		
		function getMonth() {
			var termChecked = $("input[name='term']:checked").val();
			$("#pjmonth").empty();
			if(termChecked=='下学期'){
				$label = '<label class="" style="padding-top:5px;">'
					+'<input type="radio" name="month" id="month1" value="1">一月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month2" value="2">二月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month3" value="3">三月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month4" value="4">四月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month5" value="5">五月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month6" value="6">六月</label>';
				$("#pjmonth").append($label);
			}
			if(termChecked=='上学期'){
				$label = '<label class="" style="padding-top:5px;">'
					+'<input type="radio" name="month" id="month7" value="7">七月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month8" value="8">八月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month9" value="9">九月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month10" value="10">十月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month11" value="11">十一月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month12" value="12">十二月</label>';
				$("#pjmonth").append($label);
			}
			$("input[name='month']").on("change",function(){
    			getCommentResult();
        	});
		}
    	
    	$("#grade").on("change",function(){
    		getTerm($(this).val());
    		$("input[name='term']").on("change",function(){
    			getClassName();
    			getMonth();
    			//getCommentResult();
        	});
    	}); */
    	
    	
    	function getItems() {
			$.post("${pageContext.request.contextPath}/pItemController/getItems",null,function(data){
				/* alert(data); */
				items = data;
			});
		}
    	
    	function createItems() {
			var json = eval('('+items+')');
			for(var i in json){
				if(json[i].grade=='大'&&json[i].term==$("input[name='term']:checked").val()&&json[i].createmonth==$("input[name='month']:checked").val()){
					$("#descript").empty();
					$("#descript").append(json[i].descript);
					$("#performance").empty();
					var performance = json[i].performance.split("|");
					for(var j in performance){
						$row = '<div class="row" style="padding-bottom:10px;">'
							+'<label class="control-label col-sm-5 text-right"  for="pjitem">'+performance[j]+'</label>'
							+'<div id="pjterm" class="col-sm-5 text-left">'
							+'<label class="checkbox-inline" >'
							+'<input type="radio" name="item'+j+'" id="item'+j+'1" value="N">能做到</label>'
							+'<label class="checkbox-inline" >'
							+'<input type="radio" name="item'+j+'" id="item'+j+'2" value="J">基本做到</label>'
							+'<label class="checkbox-inline" >'
							+'<input type="radio" name="item'+j+'" id="item'+j+'3" value="H">还需努力</label>'
							+'</div>'
							+'</div>';
						$("#performance").append($row);
					}
				}
			}
		}
    	
    	function getTermMonth() {
			var termChecked = $("input[name='term']:checked").val();
			$("#pjmonth").empty();
			if(termChecked=='下学期'){
				$label = '<label class="" style="padding-top:5px;">'
					+'<input type="radio" name="month" id="month1" value="1">一月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month2" value="2">二月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month3" value="3">三月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month4" value="4">四月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month5" value="5">五月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month6" value="6">六月</label>';
				$("#pjmonth").append($label);
			}
			if(termChecked=='上学期'){
				$label = '<label class="" style="padding-top:5px;">'
					+'<input type="radio" name="month" id="month7" value="7">七月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month8" value="8">八月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month9" value="9">九月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month10" value="10">十月</label>'
				   	+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month11" value="11">十一月</label>'
					+'<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="month" id="month12" value="12">十二月</label>';
				$("#pjmonth").append($label);
			}
			$("input[name='month']").on("change",function(){
				createItems();
        	}); 
		}
    	
    	$("input[name='term']").on("change",function(){
    		getTermMonth();
    	});
    	
    	$("#btn-save").on("click",function(){
    		alert($("#behavior").val());
    		alert($("#suggestion").val());
    		$.post("${pageContext.request.contextPath}/commentPMController/saveComment",{createyear:$("#grade").val(),grade:'大',term:$("input[name='term']:checked").val(),createmonth:$("input[name='month']:checked").val(),behavior:$("#behavior").val(),suggestion:$("#suggestion").val()},function(data){
    			alert(data);
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
			 		<option value="2016">2016-2017</option>
			 		<option value="2015">2015-2016</option>
			 		<option value="2014">2014-2015</option>
	         	</select> 
		    </div>
		    <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="pjterm">所在学期</label>
		    <div id="pjterm" class="col-sm-3 text-left">
		    	<label class="" style="padding-top:5px;">
    				<input type="radio" name="term" id="term1" value="上学期">上学期</label>
    			<label class="" style="padding-top:5px;margin-left:20px;">
    				<input type="radio" name="term" id="term2" value="下学期">下学期</label>
			</div>
	     	<div class="col-sm-4 text-center"><label style="padding-top:5px;" id="className"></label></div>
	     </div>
	     <div class="row">
	     	<label class="control-label col-sm-1 label-expand"  for="grade">所在学年</label>
		 	<div id="pjmonth" class="col-sm-5 text-center">
		    </div>
	     </div>
	    
	    </form>
	   </div>
	  </div>  
	</div>   
	
	<div class="wrap2">
  		<div class="panel panel-default panel-expand2">
  			<div class="panel-body panel-body-expand2">
  				<div class="row" style="padding:10px 15px 0;">
  					<h4>情境观察</h4>
  					<div id="descript"></div>
  				</div>
  			</div>
  		</div>
  	</div>
  	
  	<div class="wrap2">
  		<div class="panel panel-default panel-expand2">
  			<div class="panel-body panel-body-expand2">
  				<div class="row" style="padding:10px 15px 0;">
  					<h4>日常观察</h4>
  					<div id="performance">
  						<!-- <div class="row">
  							<label class="control-label col-sm-5 text-right"  for="pjitem">所在学期</label>
						    <div id="pjterm" class="col-sm-5 text-left">
						    	<label class="" style="margin-left:20px;">
				    				<input type="radio" name="item" id="item1" value="N">能做到</label>
						    	<label class="" style="margin-left:20px;">
				    				<input type="radio" name="item" id="item2" value="J">基本做到</label>
				    			<label class="" style="margin-left:20px;">
				    				<input type="radio" name="item" id="item3" value="H">还需努力</label>
							</div>
  						</div> -->
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
	

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">幼儿在园情况：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_jbfm" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="behavior" placeholder="textarea还剩余字数统计" ></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">给爸爸妈妈的建议：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<!-- <button id="btn_comExp_gbzd" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button> -->
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="suggestion" placeholder="textarea还剩余字数统计" ></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
	</div>
  </div>
</div>

	<div class="wrap2">
  		<div class="panel panel-default panel-expand2">
  			<div class="panel-body panel-body-expand2">
  				<div class="row" style="padding:10px 15px 0;">
  					<button id="btn-save" class="btn btn-primary col-sm-2 col-sm-offset-5">保存</button>
  				</div>
  			</div>
  		</div>
  	</div>

</body>
</html>