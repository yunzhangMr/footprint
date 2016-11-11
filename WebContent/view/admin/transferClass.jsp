<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%-- <script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/js/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap-3.3.0-dist/dist/css/bootstrap-table.min.css" rel="stylesheet"/>  --%>   

<title>调离班级</title>
<script type="text/javascript">

$(document).ready(function() {
	
	var $table = $('#table1');
    $table.bootstrapTable({
    url: "${pageContext.request.contextPath}/adminController/classManage", 
    dataType: "json",
    pagination: true, //分页
    singleSelect: true,
    search: false, //显示搜索框
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
                      title: '宝宝姓名',
                      field: 'teacher1name',
                      align: 'center'
                  },
                  {
                      title: '家长姓名',
                      field: 'teacher2name',
                      align: 'center'
                  },
                  {
                      title: '家长姓名',
                      field: 'teacher3name',
                      align: 'center',
                  },
                  {
                      title: '操作',
                      field: 'id',
                      align: 'center',
                      formatter:function(value,row,index){  
                   var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.classid + '\')">调班</a> ';  
                   var d = '<a href="#" mce_href="#" onclick="del(\''+ row.classid +'\')">离园</a> ';  
                        return e+d;  
                    } 
                  }
              ]
      });
	
    });
</script>

</head>
<body>
<div class="modal-body">
	<div class="container-fluid">
			<div class="form-group ">
				<div class="col-xs-8">
				<label for="situation" class="col-xs-3 control-label">所在年级：</label>
					<label class="control-label" for="anniu">
						<input type="radio" name="situation" id="normal">大班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">中班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">小班</label>
				</div>
			</div>
			<div class="form-group ">
				<div class="col-xs-8">
				<label for="situation" class="col-xs-3 control-label">所在班级：</label>
					<label class="control-label" for="anniu">
						<input type="radio" name="situation" id="normal">1班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">2班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">3班</label>
				</div>
			</div>
			<div class="form-group ">
				<div class="col-xs-8">
				<label for="situation" class="col-xs-3 control-label">调入班级：</label>
					<label class="control-label" for="anniu">
						<input type="radio" name="situation" id="normal">1班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">2班</label>
					<label class="control-label" for="meun">
						<input type="radio" name="situation" id="forbid">3班</label>
				</div>
			</div>
		
		 <div class="form-group ">
			 <table id="table1"></table>
		</div>

	</div>
</div>


</body>
</html>