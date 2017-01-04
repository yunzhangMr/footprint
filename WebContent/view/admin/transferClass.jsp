<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>

<title>调离班级</title>
<script type="text/javascript">

	$(function () {
		var bcId;
		var babyId;
		var classId;
		var gradeOld;
		var cnumOld;
		
	   	//1.初始化Table
	   	var oTable = new TableInit();
	   	oTable.Init();
	   	 
	   	//2.初始化Button的点击事件
	   	var oButtonInit = new ButtonInit();
	   	oButtonInit.Init();
   	});

	var TableInit = function () {
   	var oTableInit = new Object();
   	 //初始化Table
   	oTableInit.Init = function () {
   	  $('#tb_departments').bootstrapTable({
   	   url: '${pageContext.request.contextPath}/babyClassesController/babyClassesManage',   //请求后台的URL（*）
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
   	   uniqueId: "classid",      //每一行的唯一标识，一般为主键列
   	   showToggle:false,     //是否显示详细视图和列表视图的切换按钮
   	   cardView: false,     //是否显示详细视图
   	   detailView: false,     //是否显示父子表
	   columns: [{
           title: '序号',
             field: 'id',
             align: 'center',
             valign: 'middle'
         }, 
         {
             title: '班级名称',
             field: 'class_name',
             align: 'center',
             valign: 'middle'
         }, 
         {
             title: '宝宝姓名',
             field: 'bname',
             align: 'center'
         },
         {
             title: '家长姓名',
             field: 'parent_name',
             align: 'center'
         },
	     {
	         title: '操作',
	         field: 'id',
	         align: 'center',
	         formatter:function(value,row,index){  
	        	 var e = '<a href="#" mce_href="#" onclick="edit(\'' + row.b_c_id +'\',\''+ row.id +'\',\''+ row.class_id + '\',\''+ row.grade + '\',\''+ row.cnum  + '\')">调班</a> ';  
	             var d = '<a href="#" mce_href="#" onclick="del(\'' + row.b_c_id +'\',\''+ row.id +'\',\''+ row.class_id+ '\')">离园</a> ';
	             return e+d;    
	         }
	      }]
   	  });
   	  
   	  
   	 };
   	 
   	 //得到查询的参数 // row.id +'\',\''+ row.class_id  
   	 oTableInit.queryParams = function (params) {

   	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
   	   limit: params.limit, //页面大小
   	   offset: params.offset, //页码
   	   status: 'N',
   	   grade:$("input[name='grade']:checked").val(),
   	   cnum: $("input[name='cnum']:checked").val(),
   	   name: $("#txt_search_nurseryName").val().trim()
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
   	
   	function del(b_c_id,baby_id,class_id) {
		$.post("${pageContext.request.contextPath}/babyClassesController/changeBase",{id:b_c_id,baby_id:baby_id,class_id:class_id,status:'F'},function(data){
			var json = eval('('+data+')');
			alert(json.msg);
			search();
		});
	}
	
   	function edit(b_c_id,baby_id,class_id,grade,cnum) {
   		bcId = b_c_id;
   		babyId = baby_id;
   		classId = class_id;
   		gradeOld = grade;
   		cnumOld = cnum;
   		$("input[name='gradeChange']").each(function() {
			$(this)[0].checked = false;
		});
		$("#changeClassModal").modal('show');
	}
   	
   	/*
   		切换年级
   	*/
	$("input[name='grade']").on("change",function(){
		$.post("${pageContext.request.contextPath}/classController/getCNum",{grade:$("input[name='grade']:checked").val()},function(data){
			var json = eval('('+data+')');
			$("#classNum").empty();
			for(var i in json.obj){
				$label = '<label class="" style="margin-left:20px;">'
					+'<input type="radio" name="cnum" id="cnum'+json.obj[i].cnum+'" value="'+json.obj[i].cnum+'">'+json.obj[i].cnum+'</label>';
				$("#classNum").append($label);
			}
			/*切换班级*/
			$("input[name='cnum']").on("change",function(){
				search();
			});
		});
		search();
	});
	
   
	$("input[name='gradeChange']").on("change",function(){
		/* alert(cnumOld+gradeOld);
		alert(0); */
		$.post("${pageContext.request.contextPath}/classController/getCNum",{grade:$("input[name='gradeChange']:checked").val()},function(data){
			$("#cnumChange").empty();
			var json = eval('('+data+')');
			for(var i in json.obj){
				alert(cnumOld+gradeOld);
				if(!(json.obj[i].cnum==cnumOld&&$("input[name='gradeChange']:checked").val()==gradeOld)){
					$option = '<option value="'+json.obj[i].cnum+'">'+json.obj[i].cnum+'</option>';
					$("#cnumChange").append($option);
				}
			}
		});
	});
   	
   	$("#classChange").on("click",function(){
   		/* alert(0); */
   		$.post("${pageContext.request.contextPath}/babyClassesController/changeClass",{id:bcId,baby_id:babyId,class_id:classId,status:'D',gradeNew: $("input[name='gradeChange']:checked").val(),cnumNew:$("#cnumChange").val()},function(data){
			var json = eval('('+data+')');
			alert(json.msg);
			search();
		});
   	});
   	
</script>

</head>
<body>
<div class="wrap1">
  <div class="panel panel-default panel-expand1">
   <div class="panel-body panel-body-expand1">
    <form id="pjformSearch" class="" role="form">
     <div class="row">
     	<label class="control-label col-sm-1 label-expand "  for="pjyear">所在年级</label>
     	<div class="col-sm-3 text-expand">
     		<label class="" style="margin-left:20px;">
				<input type="radio" name="grade" id="grade1" value="大">大班</label>
		   	<label class="" style="margin-left:20px;">
				<input type="radio" name="grade" id="grade2" value="中">中班</label>
			<label class="" style="margin-left:20px;">
				<input type="radio" name="grade" id="grade3" value="小">小班</label>
      	</div>
      	<label class="control-label col-sm-1 label-expand "  for="pjyear">所在班级</label>
     	<div id="classNum" class="col-sm-3 text-expand">
     		<!-- <label class="" style="margin-left:20px;">
				<input type="radio" name="cnum" id="cnum1" value="1">1</label>
		   	<label class="" style="margin-left:20px;">
				<input type="radio" name="cnum" id="cnum2" value="2">2</label>
			<label class="" style="margin-left:20px;">
				<input type="radio" name="cnum" id="cnum3" value="3">3</label> -->
      	</div>
     </div>
    </form>
    </div>
  </div>
</div>

<div id="toolbar" class="row" style="height:50px;padding:10px 15px;">
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

<!--弹出添加班级窗口-->
<div class="modal fade" id="changeClassModal" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">调班</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">年级：</label>
							<div class="col-xs-4">
								<label class="" style="padding-top:5px;">
									<input type="radio" name="gradeChange" id="grade1" value="大">大班</label>
							   	<label class="" style="margin-left:20px;">
									<input type="radio" name="gradeChange" id="grade2" value="中">中班</label>
								<label class="" style="margin-left:20px;">
									<input type="radio" name="gradeChange" id="grade3" value="小">小班</label>
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">班号：</label>
							<div class="col-xs-4">
								<select  name="term" id="cnumChange" class="form-control">
						        	<!-- <option value="上学期">上学期</option>   
						            <option value="下学期">下学期</option>    -->                      
						         </select>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button id="classChange" type="button" class="btn btn-sm btn-primary">调入</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取 消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


</body>
</html>