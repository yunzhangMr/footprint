<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.aj.footprint.service.impl.DoctorEvaluateServicelmpl"%>
<%@page import="java.util.Calendar"%>

<%
//获取当前年份，月份
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
String createyear = year+"-"+(year+1);
int month = cal.get(Calendar.MONTH) + 1;

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
		    TableObj.oTableInit();
		    $("#btn_query").click(function () {
		        $("#tb_departments").bootstrapTable('destroy');
		        TableObj.oTableInit();
		        
		    });
		    		 
	
		});
		
		var TableObj = {
		    //初始化Table
		    oTableInit: function () {
		        $('#tb_departments').bootstrapTable({
		        	url: '${pageContext.request.contextPath}/teacherChangeBabyInfoController/findBabyList',   //请求后台的URL（*）
		     	   method: 'get',     //请求方式（*）
		     	   toolbar: '#toolbar',    //工具按钮用哪个容器
		     	   striped: true,      //是否显示行间隔色
		     	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     	   pagination: true,     //是否显示分页（*）
		     	   sortable: false,      //是否启用排序
		     	   sortOrder: "asc",     //排序方式	
		           queryParams: function (params) {  //传递参数（*）
	                return {
	                   limit: params.limit, //页面大小
	             	   offset: params.offset, //页码
	             	   parentname:$("#parentname").val(),
	             	   bname:$("#bname").val()
	                };
		            },	  
		     	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
		     	   pageNumber:1,      //初始化加载第一页，默认第一页
		     	   pageSize: 10,      //每页的记录行数（*）
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
		     	   /* onlyInfoPagination: true, //显示总数 */
		     	  /*  paginationPreText: '<<上一页', //上一页的说明文字
		     	   paginationNextText: '下一页>>',//下一页的说明文字 */
		     	   singleSelect: false, //禁止多选行 ,下面的列头自动隐藏
		            columns: [
		     	   {
		                title: '宝宝姓名',
		                field: 'bname',
		                align: 'center', 
		                valign: 'middle'
		            }, 
		            {
		                title: '宝宝乳名',
		                field: 'nickname',
		                align: 'center',
		            },
		            {
		                title: '性别',
		                field: 'gender',
		                align: 'center'
		            },
		            {
		                title: '出生日期',
		                field: 'birth',
		                align: 'center',
		            },
		            {
		                title: '手机号码',
		                field: 'telephone',
		                align: 'center',
		            },
		            {
		                title: '宝宝属相',
		                field: 'animalsign',
		                align: 'center',
		            },
		            {
		                title: '家长id',
		                field: 'parentid',
		                align: 'center',
		            },
		            {
		                title: '家长姓名',
		                field: 'parentname',
		                align: 'center',
		            },       
		            {
		                title: '入园前抚养方式',
		                field: 'nurture',
		                align: 'center',
		            },
		            {
		                title: '操作',
		                field: 'id',
		                align: 'center',
		                formatter:function (value,row,index){
		                	
		                	return "<a href='javascript:void(0);' onclick=\"edit("+index+");\">编辑</a>";;
		                }
		            }
		            ]
		        });
		        
		    }
		};
		
		
		function edit(index){

			var row = $('#tb_departments').bootstrapTable('getData')[index];
			var data = {"id":row.id,"bname":row.bname,"gender":row.gender,"telephone":row.telephone,"birth":row.birth,"parentid":row.parentid,"parentname":row.parentname,"animalsign":row.animalsign,"nickname":row.nickname,"nurture":row.nurture}; 
			$("#editBabyInfo").load("${pageContext.request.contextPath}/teacherChangeBabyInfoController/editBabyInfo",data,function(){
		   			
	   		        $("#editBabyInfo").modal('show');   
	   			
	   		    });
		}
    
   
    </script>
</head>
<style>
</style>
<body>

<div class="wrap1">
  <div class="panel panel-default panel-expand1">
   <div class="panel-body panel-body-expand1">
    <form id="pjformSearch" class="form-horizontal" role="form">
   
	 <div class="row" style="padding-top:10px;">   
     
      <label class="control-label col-sm-1 label-expand"  for="bname">宝宝姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="bname">
      </div>
      <label class="control-label col-sm-1 label-expand"  for="parentname">家长姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="parentname">
      </div>
      
      <div class="col-sm-1 col-sm-offset-1">
       <button type="button" id="btn_query"  class="btn btn-primary btn-sm">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;搜索
		</button>
      </div>
	 </div>
	 
     </div>
    </form>
   </div>
  </div>  


<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  			<table id="tb_departments" class="table table-bordered responsive"></table>
  	</div>
  </div>
</div>
 
 
<!--弹出添加班级窗口-->
<div class="modal fade" id="editBabyInfo" role="dialog" aria-labelledby="gridSystemModalLabel" >
</div>

</body>
</html>