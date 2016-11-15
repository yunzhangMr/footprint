<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>宝宝班级调整</title>

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap-table.min.css" rel="stylesheet"/>   


<script type="text/javascript">
    // When document has loaded, initialize pagination and form 
    $(document).ready(function() {
    	
    	var $table = $('#table');
        $table.bootstrapTable({
        url: "${pageContext.request.contextPath}/adminController/classManage", 
        dataType: "json",
        pagination: true, //分页
        singleSelect: true,
        search: true, //显示搜索框
        sidePagination: "server", //服务端处理分页
              columns: [
                      {
                        title: '序号',
                          field: 'classid',
                          align: 'center',
                          valign: 'middle'
                      }, 
                      {
                          title: '班级名称',
                          field: 'name',
                          align: 'center',
                          valign: 'middle',
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
                          align: 'center',
                      },
                      {
                          title: '操作',
                          field: 'id',
                          align: 'center',
                          formatter:function(value,row,index){  
                       var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.classid + '\')">编辑</a> ';  
                       var d = '<a href="#" mce_href="#" onclick="del(\''+ row.classid +'\')">删除</a> ';  
                            return e+d;  
                        } 
                      }
                  ]
          });
    	
        });

    </script>
</head>
<style>
input{width:250px;}
</style>
<body>
  <div>
  <table id="table"></table>
   </div>
  <div class="modal-body">
	<div class="container-fluid">
		<form class="form-horizontal">
		    <div class="form-group">
				
				<label for="paixu" style="float:left;">排序:&nbsp;</label>
				<select class=" form-control" style="width:100px;">
					<option>地区</option>
					<option>地区</option>
					<option>班期</option>
					<option>性别</option>
					<option>年龄</option>
					<option>份数</option>
				</select>
				<div class="col-xs-8">
				<label for="situation" class="col-xs-3 control-label">学期：</label>
					<label class="control-label" for="anniu">
						<input type="radio" name="situation" id="normal">上学期</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">下学期</label>
				</div>
			</div>
			<div class="form-group ">
				<label for="sName" class="col-xs-3 control-label">班级年级：</label>
				<div class="col-xs-8 ">
					<input type="email" style="width:180px;float:left;" class="form-control input-sm" id="sName" placeholder="大">
					<input type="email" style="width:180px;float:left;" class="form-control input-sm" id="sName" placeholder="中">
					<input type="email" style="width:180px;" class="form-control input-sm" id="sName" placeholder="小">
				</div>
			</div>
			<div class="form-group">
				<label for="sLink" class="col-xs-3 control-label">年级班数：</label>
				<div class="col-xs-8 ">
					<input type="" style="width:180px;float:left;" class="form-control input-sm" id="sLink" placeholder="大">
					<input type="" style="width:180px;float:left;" class="form-control input-sm" id="sLink" placeholder="中">
					<input type="" style="width:180px;" class="form-control input-sm" id="sLink" placeholder="小">
				</div>
			</div>
			<div class="form-group">
				<label for="sOrd" class="col-xs-3 control-label">班级名称格式：</label>
				<div class="col-xs-8">
					<input type="" style="width:180px;float:left;" class="form-control input-sm" id="sOrd" placeholder="大">
					<input type="" style="width:180px;float:left;" class="form-control input-sm" id="sOrd" placeholder="中">
					<input type="" style="width:180px;" class="form-control input-sm" id="sOrd" placeholder="小">
				</div>
			</div>
		
		</form>
	</div>
</div>
<div class="modal-footer">
		<button type="button" style="width:120px;height:40px;" class="btn btn-xs btn-green">创建</button>
</div>
   
</body>
</html>