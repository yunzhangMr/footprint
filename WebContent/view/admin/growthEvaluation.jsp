<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    	 
    	/* alert($("input[name='itemQuota']:checked").val());
    	alert($("input[name='stage']:checked").val()); */
    	
    	 //1.初始化Table
    	 var oTable = new TableInit();
    	 oTable.Init();
    	 
    	 //2.初始化Button的点击事件
    	 var oButtonInit = new ButtonInit();
    	 oButtonInit.Init();
    	 
    	 //1.初始化Table1
	   	 var oTable1 = new TableInit1();
	   	 oTable1.Init();
	   	 
	   	 //2.初始化Button1的点击事件
	   	 var oButtonInit1 = new ButtonInit1();
	   	 oButtonInit1.Init();
    	 
	   	 var items;
	   	 getItems();
	   	 var item_score;
	   	 
	   	/* radioInit(); */
	   	 //提示插件
	   		$("[data-toggle='tooltip']").tooltip();
    	});
    	
    	var TableInit = function () {
    	 var oTableInit = new Object();
    	 //初始化Table
    	 oTableInit.Init = function () {
    	  $('#tb_departments').bootstrapTable({
    	   url: '${pageContext.request.contextPath}/itemScoreController/getItemScore',   //请求后台的URL（*）
    	   method: 'get',      //请求方式（*）
    	   toolbar: '#toolbar',    //工具按钮用哪个容器
    	   striped: true,      //是否显示行间隔色
    	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
    	   pagination: true,     //是否显示分页（*）
    	   sortable: false,      //是否启用排序
    	   sortOrder: "asc",     //排序方式
    	   queryParams: oTableInit.queryParams,//传递参数（*）
    	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
    	   pageNumber:1,      //初始化加载第一页，默认第一页
    	   pageSize: 10,      //每页的记录行数（*）
    	   pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
    	   search: false,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
    	   strictSearch: true,
    	   showColumns: false,     //是否显示所有的列
    	   showRefresh: false,     //是否显示刷新按钮
    	   minimumCountColumns: 2,    //最少允许的列数
    	   clickToSelect: true,    //是否启用点击选中行
    	  // height: 500,      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
    	   uniqueId: "id",      //每一行的唯一标识，一般为主键列
    	   showToggle: false,     //是否显示详细视图和列表视图的切换按钮
    	   cardView: false,     //是否显示详细视图
    	   detailView: false,     //是否显示父子表
    	   columns: [{
               title: '姓名',
               field: 'baby_name',
               align: 'center',
               valign: 'middle'
           }, 
           {
               title: '性别',
               field: 'baby_gender',
               align: 'center'
           },
           {
               title: '录入日期',
               field: 'createdate',
               align: 'center'
           },
           {
               title: '操作',
               field: 'id',
               align: 'center',
               formatter:function(value,row,index){  
	            /* disabled="true" evaluat加上e的时候会报错var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id +'\')">修改</a> ';   */
	            var e = '<button type="button" id="btn_evaluat'+index+'" onclick="evaluat(\'' + row.baby_id +'\',\''+row.baby_name+'\',\''+row.baby_gender+ '\')"  class="btn btn-link btn-sm">评价</button>';
	           /*  var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">调离</a> ';   */
	            var i = '<input type="hidden" class="ids" value="'+ row.id + '"/>';
	            var s = '<input type="hidden" class="sid" value="'+ row.id + '"/>';
	                 return e+i+s;  
	             }
           }]
    	  });
    	  
    	  
    	 };
    	 
    	 //得到查询的参数
    	 oTableInit.queryParams = function (params) {
		
    	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	   /* limit: params.limit, //页面大小
    	   offset: params.offset, //页码 */
    	   isBaby: 'Y',
    	   stage:encodeURI($("input[name='stageBaby']:checked").val()),
	   	   name:encodeURI($("#txt_search_nurseryName").val().trim())
    	  };
    	  return temp;
    	 };
    	 return oTableInit;
    	};
    	 
    	 
    	var ButtonInit = function () {
    	 var oInit = new Object();
    	 var postdata = {};
    	 
    	 oInit.Init = function () {
    	  //初始化页面上面的按钮事件
    	 };
    	 
    	 return oInit;
    	};

    	function search(){
    		$('#tb_departments').bootstrapTable('refresh');
    		
    	}
    	
	   	var TableInit1 = function () {
	   	 var oTableInit1 = new Object();
	   	 //初始化Table
	   	 oTableInit1.Init = function () {
	   	  $('#tb_classes').bootstrapTable({
	   	   url: '${pageContext.request.contextPath}/itemScoreController/getItemScore',   //请求后台的URL（*）
	   	   method: 'get',      //请求方式（*）
	   	   toolbar: '#toolbarClasses',    //工具按钮用哪个容器
	   	   striped: true,      //是否显示行间隔色
	   	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	   	   pagination: false,     //是否显示分页（*）
	   	   sortable: false,      //是否启用排序
	   	   sortOrder: "asc",     //排序方式
	   	   queryParams: oTableInit1.queryParams,//传递参数（*）
	   	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
	   	   search: false,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	   	   strictSearch: true,
	   	   showColumns: false,     //是否显示所有的列
	   	   showRefresh: false,     //是否显示刷新按钮
	   	   minimumCountColumns: 2,    //最少允许的列数
	   	   clickToSelect: true,    //是否启用点击选中行
	   	   //height: 300,      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	   	   uniqueId: "id",      //每一行的唯一标识，一般为主键列
	   	   showToggle: false,     //是否显示详细视图和列表视图的切换按钮
	   	   cardView: false,     //是否显示详细视图
	   	   detailView: false,     //是否显示父子表
	   	  /*  height: 400, */
	   	   columns: [{
	              title: '姓名',
	              field: 'baby_name',
	              align: 'center',
	              valign: 'middle',
	              width: '30%'
	          }, 
	          {
	              title: '性别',
	              field: 'baby_gender',
	              align: 'center',
	              width: '20%'
	          },
	          {
	              title: '操作',
	              field: 'id',
	              align: 'center',
	              width: '50%',
	              formatter:function(value,row,index){ 
	            	  var c = '<label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score3'+value+'" value="3">&nbsp;☆☆☆</label>';
	            	if(row.score==1){c = '<label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score1'+value+'" value="1" checked>&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score3'+value+'" value="3">&nbsp;☆☆☆</label>';}
	            	if(row.score==2){c = '<label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score2'+value+'" value="2" checked>&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score3'+value+'" value="3">&nbsp;☆☆☆</label>';}
	            	if(row.score==3){c = '<label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="score'+value+'" id="score3'+value+'" value="3" checked>&nbsp;☆☆☆</label>';}
		                 return c;  
		             }
	          }]
	   	  });
	   	  
	   	  
	   	 };
	   	 
	   	 //得到查询的参数
	   	 oTableInit1.queryParams = function (params) {
			
	   	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
	   		stage:encodeURI($("input[name='stage']:checked").val()),
	   		quota:encodeURI($("input[name='itemQuota']:checked").val()),
	   		name: encodeURI($("#txt_search_Name").val().trim())
	   	  };
	   	  return temp;
	   	 };
	   	 return oTableInit1;
	   	};
	   	 
	   	 
	   	var ButtonInit1 = function () {
	   	 var oInit = new Object();
	   	 var postdata = {};
	   	 
	   	 oInit.Init = function () {
	   	  //初始化页面上面的按钮事件
	   	 };
	   	 
	   	 return oInit;
	   	};
    	
	   	function search1(){
    		$('#tb_classes').bootstrapTable('refresh');
    	}
    	
    	/*
    		评价按钮（宝宝评价）
    	*/
    	function evaluat(baby_id,baby_name,baby_gender) {
    		alert(baby_id);
    		/* $("#gridSystemModalLabel").text('宝宝观察评价 —— '+baby_name+' '+baby_gender+'  '+'${sessionScope.sessionInfo.createyear }'+'-'+'${sessionScope.sessionInfo.createyear+1 }'+'学年  '+'${sessionScope.sessionInfo.term}'); */
    		$("#addTeacher #gridSystemModalLabel").html('宝宝观察评价 ——&nbsp;'+baby_name+'&nbsp;'+baby_gender+'&nbsp; &nbsp;'+'${sessionScope.sessionInfo.createyear }'+'-'+'${sessionScope.sessionInfo.createyear+1 }'+'学年&nbsp;&nbsp;'+'${sessionScope.sessionInfo.term}'+'&nbsp;'+$("input[name='stageBaby']:checked").val());
			$.post("${pageContext.request.contextPath}/itemScoreController/getItemScore",{'babyId':baby_id,stage:encodeURI($("input[name='stageBaby']:checked").val())},function(data){
				/* alert(data); */
				item_score = data;
			});
			$("#addTeacher").modal('show');
		} 
    	
    	/*
    		获取评价信息,并将它存到items里
    	*/
    	function getItems(){
    		$.post("${pageContext.request.contextPath}/itemController/getItems",null,function(data){
    			/* alert(data); */
    			items = data;
    		});
    	}
    	
    	/*
    		类型切换事件
    	*/
    	$("input[name='itemType']").on("change",function(){
    		$this = $(this);
    		var json = eval(items);
    		$("#itemQuotas").empty();
    		for(var i in json){
    			if(json[i].type==$this.val()){
   					$label = '<label class="checkbox-inline">'
       					+'<input type="radio" name="itemQuota" id="itemQuotas'+i+'" value="'+json[i].code+'">'
       					+'&nbsp;<span data-toggle="tooltip" data-placement="top" title="'+json[i].descript+'">'+json[i].quota+'</span>'
       					+'</label>';
       				$("#itemQuotas").append($label);
    			}
    		}
    		$("input[name='itemQuota']").on("change",function(){
    			search1();
        	});
    		$("[data-toggle='tooltip']").tooltip();
    	});
    	
    	/*
    		radio的初始化方法
    	*/
    	/* function radioInit() {
    		var json = eval(items);
    		$("#itemQuotas").empty();
    		for(var i in json){
    			if(json[i].type=='健康'){
   					$label = '<label class="checkbox-inline">'
       					+'<input type="radio" name="itemQuota" id="itemQuota'+i+'" value="'+json[i].code+'">'
       					+'&nbsp;<span data-toggle="tooltip" data-placement="top" title="'+json[i].descript+'">'+json[i].quota+'</span>'
       					+'</label>';
       				$("#itemQuotas").append($label);
    			}
    		}
    		$("input[name='itemQuota']").on("change",function(){
    			search1();
		    });
    		$("[data-toggle='tooltip']").tooltip();
		} */
    	
    	/*
    		开始评测按钮（按项目评价）
    	*/
    	$("#btn_item_score").on("click",function(){
    		alert($("input[name='stage']:checked").val());
    		$.post("${pageContext.request.contextPath}/itemScoreController/createItemScore",{stage:$("input[name='stage']:checked").val()},function(data){
    			alert(data);
    			search1();
    		});
    	});
		
		/*
			开始评测按钮（按宝宝评价）
		*/
		$("#btn_item_score_baby").on("click",function(){
			alert($("input[name='stageBaby']:checked").val());
			$.post("${pageContext.request.contextPath}/itemScoreController/createItemScore",{stage:$("input[name='stageBaby']:checked").val()},function(data){
				alert(data);
				search();
			});
		});
    	
    	/*
    		切换学期阶段 （刷新数据）
    	*/
    	$("input[name='stage']").on("change",function(){
    		search1();
    	});
    	
    	/*
			切换学期阶段 （刷新数据）
		*/
		$("input[name='stageBaby']").on("change",function(){
			search();
		});
    	
    	
    	/*
    		保存评价成绩(按项目)
    	*/
    	$("#btn_class_save").on("click",function(){
    		/* alert(0); */
    		var json = new Array();
    		$("#tb_classes input[name^='score']:checked").each(function () {
    			var arr  = {
			         id : $(this).attr("name").split("score")[1],
			         score : $(this).val()
			     };
    			json.push(arr);
    		}); 
    		$.post("${pageContext.request.contextPath}/itemScoreController/changeItemScore",{'scoreList':encodeURI(JSON.stringify(json))},function(data){
    			alert(data);
    		});
    	});
    	
    	/*
			保存评价成绩（按宝宝）
		*/
		$("#save-itemscore-baby").on("click",function(){
			var json = new Array();
			$("#baby_item_score input[name^='scoreBaby']:checked").each(function () {
				var arr  = {
			         id : $(this).attr("name").split("scoreBaby")[1],
			         score : $(this).val()
			     };
				json.push(arr);
			}); 
			$.post("${pageContext.request.contextPath}/itemScoreController/changeItemScore",{'scoreList':encodeURI(JSON.stringify(json))},function(data){
				alert(data);
			});
		});
    	
    	/*
    		切换评价类型
    	*/
    	$("input[name='itemTypeBaby']").on("change",function(){
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
						var c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby3'+value+'" value="3">&nbsp;☆☆☆</label></td>';
			            if(jsonItemScore.rows[i].score==1){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby1'+value+'" value="1" checked>&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby3'+value+'" value="3">&nbsp;☆☆☆</label></td>';}
			            if(jsonItemScore.rows[i].score==2){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby2'+value+'" value="2" checked>&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby3'+value+'" value="3">&nbsp;☆☆☆</label></td>';}
			            if(jsonItemScore.rows[i].score==3){c = '<td style="text-align: center;height:48px;border: 1px solid #ddd; "><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby1'+value+'" value="1">&nbsp;☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby2'+value+'" value="2">&nbsp;☆☆</label><label class="checkbox-inline"><input type="radio" name="scoreBaby'+value+'" id="scoreBaby3'+value+'" value="3" checked>&nbsp;☆☆☆</label></td>';}
						$("#baby_item_score").append($tr+c+'</tr>');
					}
				}
			}
		});
    	
    	
    	
    	/* $("#tb_departments button[id^='btn_evaluat']").on("click",function(){
    		alert(0);
    	}); */
    	
    	
		
    	//提交表单
        
        $("#submit").click(function(){
       	 
         $.ajax({ 
                type : "POST",
                url :  '${pageContext.request.contextPath}/adminController/classAdd',
              //  data :  '$("#form-horizontal").serialize(); charset=utf-8',//序列化表单提交input 值
                data :  $("#form-horizontal").serialize(),
       		 success : function() {      			
   				alert("成功");
   				//window.location.href="${pageContext.request.contextPath}/view/index.jsp";		
       		 },
                error:function(){
               	 alert("请求出错");   
                }
       	
       	});
       	  
         });
    	 
    	
    </script>
</head>
<style>
</style>
<body>

<ul id="myTab" class="nav nav-tabs">
	<li class="active">
		<a href="#class" data-toggle="tab">
			按项目评价
		</a>
	</li>
	<li>
		<a href="#baby" data-toggle="tab">按宝宝评价</a>
	</li>
</ul>

<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="class">
		<div class="wrap1">
		  <div class="panel panel-default panel-expand1">
		   <div class="panel-body panel-body-expand1">
		    <form id="formSearch" class="form-horizontal" role="form">
		     <div class="row">
		     	<div class="col-sm-4 text-center"><label id="">${sessionScope.sessionInfo.createyear }-${sessionScope.sessionInfo.createyear+1 }学年&nbsp;&nbsp;${sessionScope.sessionInfo.term}</label></div>
		     	<div class="col-sm-4 text-center"><label id="">大（1）班</label></div>
		     	<div class="col-sm-4 text-center">
		     		<label class="" style="margin-left:20px;">
						<input type="radio" name="stage" id="stage1" value="开学">开学</label>
				   	<label class="" style="margin-left:20px;">
						<input type="radio" name="stage" id="stage2" value="期中">期中</label>
					<label class="" style="margin-left:20px;">
						<input type="radio" name="stage" id="stage3" value="期末">期末</label>
				</div>
		     </div>
		    
		    <div class="row">
		    	<label class="control-label col-sm-2 "  for="txt_search_nurseryName">评价类型</label>
		    	<div class="col-sm-8">
		    		<label class="checkbox-inline">
					    <input type="radio" name="itemType" id="itemType1" value="健康">&nbsp;健康
					</label>
					<label class="checkbox-inline">
					    <input type="radio" name="itemType" id="itemType2" value="认知">&nbsp;认知
					</label>
					<label class="checkbox-inline">
					    <input type="radio" name="itemType" id="itemType3" value="语言">&nbsp;语言
					</label>
					<label class="checkbox-inline">
					    <input type="radio" name="itemType" id="itemType4" value="社会性">&nbsp;社会性
					</label>
					<label class="checkbox-inline">
					    <input type="radio" name="itemType" id="itemType5" value="艺术（音乐，美术）">&nbsp;艺术（音乐，美术）
					</label>
		    	</div>
		    	<div class="col-sm-1">
			      	<button type="button" id="btn_item_score" class="btn btn-primary btn-sm">
						开始评测
					</button>
			      </div>
		    </div>
		    
		     <div class="row">
		    	<label class="control-label col-sm-2 "  for="txt_search_nurseryName">评价指标</label>
		    	<div id="itemQuotas" class="col-sm-10">
		    	</div>
		    </div>
		    
		    </form>
		   </div>
		  </div>  
		</div>
		
		 <div id="toolbarClasses" class="row" style="height:50px;padding:10px 15px;">
			<label class="control-label col-sm-3 text-right"  for="txt_search_Name">姓名</label>
		    <div class="col-sm-5 ">
		      	<input type="text" class="form-control input-sm" id="txt_search_Name">
		    </div>
			<button id="" type="button" onclick="search1()" class="btn btn-primary btn-sm col-sm-2" >
			    	查询
			</button>
			<button id="btn_class_save" type="button" onclick="" class="btn btn-primary btn-sm col-sm-2 " >
			    	保存
			</button>
		</div>
			
			
			<div class="wrap2">
			  <div class="panel panel-default panel-expand2">
			  	<div class="panel-body panel-body-expand2" style="max-height:450px;overflow-y: scroll;">
			  			<table id="tb_classes" class="table table-bordered responsive" ></table>
			  	</div>
			  </div>
			</div>
		   
	</div>
	<div class="tab-pane fade" id="baby">
		<div class="wrap1">
		  <div class="panel panel-default panel-expand1">
		   <div class="panel-body panel-body-expand1">
		    <form id="formSearch" class="form-horizontal" role="form">
		     <div class="row">
		      <div class="col-sm-3 text-center"><label id="">${sessionScope.sessionInfo.createyear }-${sessionScope.sessionInfo.createyear+1 }学年&nbsp;&nbsp;${sessionScope.sessionInfo.term}</label></div>
		     	<div class="col-sm-3 text-center"><label id="">大（1）班</label></div>
		     	<div class="col-sm-3 text-center">
		     		<label class="" style="margin-left:20px;">
						<input type="radio" name="stageBaby" id="stageBaby1" value="开学">开学</label>
				   	<label class="" style="margin-left:20px;">
						<input type="radio" name="stageBaby" id="stageBaby2" value="期中">期中</label>
					<label class="" style="margin-left:20px;">
						<input type="radio" name="stageBaby" id="stageBaby3" value="期末">期末</label>
		     	</div>
		     	<div class="col-sm-1 col-sm-offset-1">
			      	<button type="button" id="btn_item_score_baby" class="btn btn-primary btn-sm">
						开始评测
					</button>
			     </div>
		     </div>
		     
		    
		    </form>
		   </div>
		  </div>  
		</div>   
		
		<div id="toolbar" class="row" style="height:50px;padding:10px 15px;">
			<!-- <div class="form-group">
		    <label for="firstname" class="col-sm-3 control-label text-right">名字</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="firstname">
		    </div>
		    <button id="btn-set-password" type="button" class="btn btn-primary btn-sm col-sm-2 col-sm-offset-1" >
		    	搜索
		   </button>
		  </div> -->
			<label class="control-label col-sm-3 text-right"  for="txt_search_nurseryName">姓名</label>
	      <div class="col-sm-6 ">
	      	 <input type="text" class="form-control input-sm" id="txt_search_nurseryName">
	      </div>
		   <button id="" type="button" onclick="search()" class="btn btn-primary btn-sm col-sm-2 col-sm-offset-1" >
		    	查询
		   </button>
		  
		</div>
		
		<div class="wrap2">
		  <div class="panel panel-default panel-expand2">
		  	<div class="panel-body panel-body-expand2">
		  			<table id="tb_departments" class="table table-bordered responsive"></table>
		  	</div>
		  </div>
		</div>
		
	</div>
</div>

  
<!--弹出宝宝评价窗口-->
<div class="modal fade" id="addTeacher" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true" style="width:1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">宝宝观察评价</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row " style="padding-bottom:5px;border-bottom: 1px solid #e5e5e5; ">
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
						<div class="col-sm-1 col-sm-offset-2"><button id="save-itemscore-baby" type="button" class="btn btn-xs btn-primary " >保 存</button></div>
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
								<td colspan="4" style="text-align: left;height:48px;border: 1px solid #ddd; ">没有找到匹配的记录</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button id="edit-teacher" type="button" class="btn btn-sm btn-primary" >保 存</button>
				<button id="add-teacher" type="button" class="btn btn-sm btn-primary"  >保 存</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">关闭</button> -->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出添加班级窗口-->
<div class="modal fade" id="success" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<span id="changePassword"></span>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出确认删除窗口-->
<div class="modal fade" id="confirm" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<span>确定要删除吗？</span>
				</div>
			</div>
			<div class="modal-footer">
				<button id="confirmDel" type="button" class="btn btn-sm btn-primary" >确定</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

</body>
</html>