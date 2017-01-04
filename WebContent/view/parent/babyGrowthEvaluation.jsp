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
    	 
	   	 var items;
	   	 getItems();
	   	 var item_score;
	   	 
    	});
    	
    	
    	/*
    		获取评价信息,并将它存到items里
    	*/
    	function getItems(){
    		/* alert(0); */
    		$.post("${pageContext.request.contextPath}/itemController/getItems",null,function(data){
    			/* alert(data); */
    			items = data;
    		});
    	}
    	
		/*
			取评价结果
		*/
		function evaluat() {
			$.post("${pageContext.request.contextPath}/itemScoreController/getItemScoreParent",{stage:$("input[name='stageBaby']:checked").val(),createyear:$("#grade").val(),term:$("input[name='term']:checked").val()},function(data){
				/* alert(data); */
				item_score = data;
			});
		} 
    	
		/*
			切换学期阶段 （刷新数据）
		*/
		$("input[name='stageBaby']").on("change",function(){
		/* 	alert(0); */
			evaluat();
			/* $("#baby_item_score").html('请选择对应条件'); */
			$("input[name='itemTypeBaby']:checked")[0].checked = false;
			$("#baby_item_score").empty();
			$head = '<tr>'
					+'<th width="10%" style="text-align: center;height:38px;border: 1px solid #ddd; ">类型</th>'
					+'<th width="10%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd; ">指标</th>'
					+'<th width="55%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">描述</th>'
					+'<th width="25%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">评价</th>'
					+'</tr>';
			$tr = '<tr>'
				+'<td colspan="4" style="text-align: left;height:48px;border: 1px solid #ddd; ">请选择上面的项目</td>'
				+'</tr>';
			$("#baby_item_score").append($head);
			$("#baby_item_score").append($tr);
		});
    	
    	/*
    		切换评价类型
    	*/
    	$("input[name='itemTypeBaby']").on("change",function(){
    		/* alert(items);
    		alert(item_score); */
    		var type = $(this).val();
			var jsonItem = eval('('+items+')');
			var jsonItemScore = eval('('+item_score+')');
			/* alert(JSON.stringify(jsonItemScore)); */
			/* alert(JSON.stringify(jsonItem)); */
			$("#baby_item_score").empty();
			$head = '<tr>'
					+'<th width="10%" style="text-align: center;height:38px;border: 1px solid #ddd; ">类型</th>'
					+'<th width="10%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd; ">指标</th>'
					+'<th width="55%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">描述</th>'
					+'<th width="25%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">评价</th>'
					+'</tr>';
			$("#baby_item_score").append($head);
			for(var i in jsonItemScore.rows){
				/* alert(jsonItemScore.rows[i].id); */
				for(var j in jsonItem){
					if(jsonItem[j].code==jsonItemScore.rows[i].item_code&&(type==jsonItem[j].type||type=='all')){
						var value = jsonItemScore.rows[i].id;
						/* alert(1); */
						var $tr = '<tr>'
								+'<td style="text-align: center;height:48px;border: 1px solid #ddd; ">'+jsonItem[j].type+'</td>'
								+'<td style="text-align: center;height:48px;border: 1px solid #ddd; ">'+jsonItem[j].quota+'</td>'
								+'<td style="text-align: left;height:48px;border: 1px solid #ddd; ">'+jsonItem[j].descript+'</td>';
						var c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "></td>';
			            if(jsonItemScore.rows[i].score==1){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline">☆</label></td>';}
			            if(jsonItemScore.rows[i].score==2){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline">☆☆</label></td>';}
			            if(jsonItemScore.rows[i].score==3){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline">☆☆☆</label></td>';}
						$("#baby_item_score").append($tr+c+'</tr>');
					}
				}
			}
		});
    	
    	var createArray = new Array();
    	
    	function myInit() {
    		$.post("${pageContext.request.contextPath}/itemScoreController/getItemCTC",null,function(data){
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
    				/* alert(createArray[j]); */
    			}
    			/* alert($("#grade").val()); */
    			getTerm($("#grade").val());
    			$("input[name='term']").on("change",function(){
        			getClassName();
            	});
    		});
		}
    	
		function getClassName() {
			/* alert(1); */
			var json = eval('('+CTCs+')');
    		for(var i in json){
    			/* alert(json[i].createyear+json[i].term);
    			alert($("#grade").val()+$("input[name='term']:checked").val()); */
    			if($("#grade").val()==json[i].createyear&&$("input[name='term']:checked").val()==json[i].term){
    				/* alert(json[i].class_name); */
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
    					$label = '<label class="" style="margin-left:20px;">'
    						+'<input type="radio" name="term" id="term2" value="下学期">下学期</label>';
    					$("#pjterm").append($label);
    				}
    			}
    		}
		}
    	
    	$("#grade").on("change",function(){
    		getTerm($(this).val());
    		$("input[name='term']").on("change",function(){
    			getClassName();
        	});
    	});
    	
    	
    	
    </script>
</head>
<style>
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
		    <label class="control-label col-sm-1 label-expand"  for="pjterm">所在学期</label>
		    <div id="pjterm" class="col-sm-2 text-left">
			</div>
	     	<div class="col-sm-2 text-center"><label style="padding-top:5px;" id="className"></label></div>
	     	<div class="col-sm-3 text-center">
	     		<label class="" style="padding-top:5px;">
					<input type="radio" name="stageBaby" id="stageBaby1" value="开学">开学</label>
			   	<label class="" style="margin-left:20px;">
					<input type="radio" name="stageBaby" id="stageBaby2" value="期中">期中</label>
				<label class="" style="margin-left:20px;">
					<input type="radio" name="stageBaby" id="stageBaby3" value="期末">期末</label>
	     	</div>
	     </div>
	     
	    
	    </form>
	   </div>
	  </div>  
	</div>   
	
	<div class="wrap2">
	  <div class="panel panel-default panel-expand2">
	  
	  	<div class="row " style="height:20px;padding:10px 15px;">
			<div class="col-sm-8">
				<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby0" value="all">&nbsp;全部
				</label>
	    		<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby1" value="健康">&nbsp;健康
				</label>
				<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby2" value="认知">&nbsp;认知
				</label>
				<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby3" value="语言">&nbsp;语言
				</label>
				<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby4" value="社会性">&nbsp;社会性
				</label>
				<label class="checkbox-inline">
				    <input type="radio" name="itemTypeBaby" id="itemTypeBaby5" value="艺术（音乐，美术）">&nbsp;艺术（音乐，美术）
				</label>
	    	</div>
		</div>
		<div class=""  style="height:400px;overflow-y:scorll;overflow-x:hidden;margin-top:20px; ">
			<table id="baby_item_score" class="col-sm-12">
				<tr>
					<th width="10%" style="text-align: center;height:38px;border: 1px solid #ddd; ">类型</th>
					<th width="10%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd; ">指标</th>
					<th width="55%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">描述</th>
					<th width="25%" style="text-align: center; vertical-align: middle;height:38px;border: 1px solid #ddd;">评价</th>
				</tr>
				<tr>
					<td colspan="4" style="text-align: left;height:48px;border: 1px solid #ddd; ">请选择上面的项目</td>
				</tr>
			</table>
		</div>
	  </div>
	</div>

</body>
</html>