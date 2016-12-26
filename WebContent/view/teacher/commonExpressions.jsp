<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.aj.footprint.service.impl.DoctorEvaluateServicelmpl"%>
<%@page import="java.util.Calendar"%>

<%
//获取当前年份，月份
/* Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
String createyear = year+"-"+(year+1);
int month = cal.get(Calendar.MONTH) + 1; */

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
<script src="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<%-- <link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/> 
 --%>
<script type="text/javascript">
    
		$(function () {
			$("#type").val(type);
		    TableObj.oTableInit();
			/* alert(type); */
		});
		
		var TableObj = {
		    //初始化Table
		    oTableInit: function () {
		        $('#tb_com_exps').bootstrapTable({
		        	url: '${pageContext.request.contextPath}/CommonExpressionsController/getComExps',   //请求后台的URL（*）
		     	   method: 'get',     //请求方式（*）
		     	   //toolbar: '#toolbar',    //工具按钮用哪个容器
		     	   striped: true,      //是否显示行间隔色
		     	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     	   pagination: false,     //是否显示分页（*）
		     	   sortable: false,      //是否启用排序
		     	   sortOrder: "asc",     //排序方式	
		           queryParams: function (params) {  //传递参数（*）
		                return {
		             	   type:$("#type").val()
		                };
		            },	  
		     	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
		     	   //pageNumber:1,      //初始化加载第一页，默认第一页
		     	   //pageSize: 10,      //每页的记录行数（*）
		     	   //pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
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
		     	   singleSelect: true, //禁止多选行 ,下面的列头自动隐藏
		            columns: [{
		     		   checkbox: true
		     	   },
		     	   {
		                title: '类别',
		                field: 'type',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '常用语',
		                field: 'content',
		                align: 'center'
		            },
		            {
		                title: '排序',
		                field: 'displayorder',
		                align: 'center'
		            }]
		        });
		        
		        /* $('#tb_com_exps').bootstrapTable('onDblClickRow', function(row, $element) {
					alert(0);
				}); */
		    }
		};
		
		function search() {
			$('#tb_com_exps').bootstrapTable('refresh');
		}
		
		$("#type").on("change",function(){
			search();
		});
		
		$("button[id$='-ComExp']").on("click",function(data){
			$this = $(this);
			/* alert(type); */
			var rows;
			if($this.attr("id").split("-ComExp")[0]!='add'&&$this.attr("id").split("-ComExp")[0]!='save'){
				rows = $('#tb_com_exps').bootstrapTable('getSelections');
				if(rows.length==0){
	   	    		alert("请选择一位宝宝！");
	   	    		return ;
	   	    	}
			}
			if($this.attr("id").split("-ComExp")[0]=='insert'){
				var value = $("#"+item).val();
				$("#"+item).val(value+rows[0].content);
			}
			if($this.attr("id").split("-ComExp")[0]=='add'){
				$("#id").val('');
				$("#type").val(type);
				$("#contentCE").val('');
				$("#displayorder").val('');
			}
			if($this.attr("id").split("-ComExp")[0]=='update'){
				$("#id").val(rows[0].id);
				$("#type").val(rows[0].type);
				$("#contentCE").val(rows[0].content);
				$("#displayorder").val(rows[0].displayorder);
			}
			if($this.attr("id").split("-ComExp")[0]=='delete'){
				alert(rows[0].id);
				$.post("${pageContext.request.contextPath}/CommonExpressionsController/deleteComExps",{id:rows[0].id},function(data){
					search();
				});
			}
			if($this.attr("id").split("-ComExp")[0]=='save'){
				if($("#type").val()==''){
					alert('请选择具体类别，不能选择全部');
					return;
				}
				if($("#id").val()==''){
					$.post("${pageContext.request.contextPath}/CommonExpressionsController/insertComExps",{type:$("#type").val(),content:$("#contentCE").val(),displayorder:$("#displayorder").val()},function(data){
						search();
					});
				}else{
					$.post("${pageContext.request.contextPath}/CommonExpressionsController/updateComExps",{id:$("#id").val(),type:$("#type").val(),content:$("#contentCE").val(),displayorder:$("#displayorder").val()},function(data){
						search();
					});
				}
			}
		});
		
    </script>
</head>
<style>

</style>
<body>
<div class="row">
   <div class="col-sm-11">
	<div class="wrap1">
	  <div class="panel panel-default panel-expand1">
	   <div class="panel-body panel-body-expand1">
 		 <div class="row">
   		  <!-- <label class="control-label col-sm-2 label-expand"  for="term">所属学期</label>
	      <div class="col-sm-2 text-expand"  style="padding-top:5px;">
		      
	      </div>
	      <label class="control-label col-sm-2 label-expand"  for="term">所属学期</label>
	      <div class="col-sm-2 text-expand"  style="padding-top:5px;">
		      <input type="text" class="form-control input-sm" id="teacherNameSelect">
	      </div>
	      <label class="control-label col-sm-2 label-expand"  for="term">所属学期</label>
	      <div class="col-sm-2 text-expand"  style="padding-top:5px;">
		      <input type="text" class="form-control input-sm" id="teacherNameSelect">
	      </div> -->
	      <input type="hidden" id="id"/>
	      <label class="col-sm-1 text-right" style="margin: 5px 0;padding-right:0px;padding-left:0px;"  for="txt_search_nurseryName">类别</label>
		  <div class="col-sm-2 ">
			  <select  name="type" id="type" class=" form-control select select-sm input-sm"  >
		          <option value="">全选</option>
		          <option value="闪光点">闪光点</option>
		          <option value="进步方面">进步方面</option>
		          <option value="个别指导">个别指导</option>  
		          <option value="影响因素">影响因素</option>
		          <option value="指导计划">指导计划</option>                                
	          </select>     
          </div>
		  <label class=" col-sm-1 text-right"  style="margin: 5px 0;padding-right:0px;padding-left:0px;" for="txt_search_teacherName">常用语</label>
		  <div class="col-sm-5 ">
		  	<input type="text" class="form-control input-sm" id="contentCE">
		  </div>
		  <label class=" col-sm-1 text-right"  style="margin: 5px 0;padding-right:0px;padding-left:0px;" for="txt_search_teacherName">排列序号</label>
		  <div class="col-sm-1 ">
		  	<input type="text" class="form-control input-sm" id="displayorder">
		  </div>
	      
   		</div>
	   </div>
	  </div>
	</div>  

	<div class="wrap2">
	  <div class="panel panel-default panel-expand2">
	  	<div class="panel-body panel-body-expand2" style="max-height:300px;overflow-y: scroll;">
	  			<table id="tb_com_exps" class="table table-bordered responsive" ></table>
	  	</div>
	  </div>
	</div>

 </div>

	<div class="col-sm-1">
		<div class="row" style="padding-top:20px;">
			<button id="insert-ComExp" class="btn btn-sm btn-primary">插入</button>
		</div>
		<div class="row" style="padding-top:40px;">
			<button id="add-ComExp" class="btn btn-sm btn-primary">增加</button>
		</div>
		<div class="row" style="padding-top:20px;">
			<button id="update-ComExp" class="btn btn-sm btn-primary">修改</button>
		</div>
		<div class="row" style="padding-top:20px;">
			<button id="delete-ComExp" class="btn btn-sm btn-primary">删除</button>
		</div>
		<div class="row" style="padding-top:40px;">
			<button id="save-ComExp" class="btn btn-sm btn-primary">保存</button>
		</div>
		<div class="row" style="padding-top:50px;">
			<button class="btn btn-sm btn-link" data-dismiss="modal">关闭</button>
		</div>
	</div>
</div>

</body>
</html>