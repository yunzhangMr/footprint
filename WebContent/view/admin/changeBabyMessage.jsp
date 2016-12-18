<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />
<title>宝宝班级调整</title>

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<%-- <link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/> 
 --%>
<script type="text/javascript">
    
    $(function () {
    	
   /*  	$(".pagination-detail").hide();
    	alert($(".pagination-detail")); */
    	 
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
    	   url: '${pageContext.request.contextPath}/adminController/classManage',   //请求后台的URL（*）
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
               title: '班级名称',
               field: 'name',
               align: 'center',
               valign: 'middle'
           }, 
           {
               title: '老师一',
               field: 'teacher1name',
               align: 'center'
           },
           {
               title: '老师二',
               field: 'teacher2name',
               align: 'center'
           },
           {
               title: '老师三',
               field: 'teacher3name',
               align: 'center'
           },
           {
               title: '操作',
               field: 'id',
               align: 'center',
               formatter:function(value,row,index){  
	            var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.classid + '\')">修改</a> ';  
	                 return e;  
	             }
           }]
    	  });
    	  
    	  
    	 };
    	 
    	 //得到查询的参数
    	 oTableInit.queryParams = function (params) {

    	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	   limit: params.limit, //页面大小
    	   offset: params.offset, //页码
    	   name: $("#txt_search_nurseryName").val(),
    	   teacherName: $("#txt_search_teacherName").val()
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
       	  
     	/* $(".pagination-detail").hide();
    	alert($(".pagination-detail")); */
         
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
     <div>
      <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="txt_search_nurseryName">宝宝姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_nurseryName">
      </div>
      <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="txt_search_teacherName">家长姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_teacherName">
      </div>
      <div class="col-sm-1 col-sm-offset-2">
       <button type="button" id="btn_query" onclick="search()" class="btn btn-primary btn-sm">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;搜索
		</button>
      </div>
     </div>
    </form>
   </div>
  </div>  
</div>   
 <div id="toolbar" class="btn-group btn-group-row">
   <button id="btn_add" type="button" class="btn btn-default">
    <span class="glyphicon glyphicon-plus"></span>新增
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
<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">添加班级</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">学年：</label>
							<div class="col-xs-8">
								<select class=" form-control select-duiqi">
									<option value="">国际关系地区</option>
									<option value="">北京大学</option>
									<option value="">天津大学</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">年级：</label>
							<div class="col-xs-8">
								<select class=" form-control select-duiqi">
									<option value="">管理员</option>
									<option value="">普通用户</option>
									<option value="">游客</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">班数：</label>
							<div class="col-xs-8">
								<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
				<button type="button" class="btn btn-xs btn-green">保 存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- <div  style="width:100%;height: 40px;text-align: center;margin:15px 0;font-weight:bold;font-size:24px;background-color: ##F5F5F5;"> 
	创建班级
</div>
<div class="row">
        <div class="col-md-12">
          <form class="" role="form">
            
            <div class="row">
            <div class=" col-lg-6 ">
              <label for="inputEmail1" class="col-lg-2 control-label label-left-1">学年</label>
              <div class="col-lg-10">
                <select data-toggle="select" class="form-control select select-default">
                     <option>2015年9月 - 2016年3月</option>
                     <option>2015年9月 - 2016年3月</option>
                     <option>2015年9月 - 2016年3月</option>
                </select> 
              </div>
            </div>
           <div class="col-lg-6">
              <label for="inputEmail1" class="col-lg-2 control-label label-left-1">学期</label>
              <div class="col-lg-10"> 
                <label class="radio col-lg-5" for="radio4a">
                  <input type="radio" name="gender" data-toggle="radio" value="" id="radio4a" required checked>
                  上学期
                </label>
                <label class="radio col-lg-5" for="radio4b">
                  <input type="radio" name="gender" data-toggle="radio" value="" id="radio4b" required checked>
                  下学期
                </label>
              </div>
            </div>
            </div>
           
            <div class="row">
              <div class="col-xs-3">
                <div class="form-group form-group-sm label-left">
                  <label for="inputEmail1" class="control-label">班级年级</label>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="大" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="中" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="小" class="form-control" />
                </div>
              </div>
            </div>
            
            <div class="row">
             <div class="col-xs-3">
              <div class="form-group form-group-sm label-left">
                <label for="inputEmail1" class="control-label">年级班数</label>
              </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="1" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="1" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="1" class="form-control" />
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-3">
                <div class="form-group form-group-sm label-left">
                  <label for="inputEmail1" class="control-label">班级名称格式</label>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="大（1）班" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="中（1）班" class="form-control" />
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input type="text" value="" placeholder="小（1）班" class="form-control" />
                </div>
              </div>
            </div>
            
            
            <div style="text-align:center;">
                <a href="#fakelink" class="btn btn-primary">创建</a>
            </div>

        </form>
        </div>/col-md-12
      </div> /row
 
 --> 
</body>
</html>