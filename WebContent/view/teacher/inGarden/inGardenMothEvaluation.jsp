<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.aj.footprint.service.impl.DoctorEvaluateServicelmpl"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import=
"org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.aj.footprint.service.TeacherInGardenMonthEvaluateServiceI" %>
<%@page import="com.aj.footprint.model.vo.SessionInfo" %>

<%

SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
ApplicationContext context = WebApplicationContextUtils. getWebApplicationContext(application);
//获取当前年份，月份
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
String createyear = year+"-"+(year+1);
int month = cal.get(Calendar.MONTH) + 1;

//获得所在班级

TeacherInGardenMonthEvaluateServiceI teacherInGardenMonthEvaluateService = (TeacherInGardenMonthEvaluateServiceI)context.getBean("teacherInGardenMonthEvaluateService");

String cname = teacherInGardenMonthEvaluateService.getCname(sessionInfo.getLoginId());

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
    
		$(document).ready(function() {
			
			//判断当前学期
		       if('<%=month%>'<=2||'<%=month%>'>=8){
		    	   $('#term').val("上学期");
		       }else{
		    	   $('#term').val("下学期");
		       }  	       
		         //初始化月份
		       changeTerm();
		});
		
		
		$(function () {
		    TableObj.oTableInit();
		    $("#btn_query").click(function () {
		        $("#tb_departments").bootstrapTable('destroy');
		        TableObj.oTableInit();
		        
		    });

	         $("#pjbirth").
	         datetimepicker({
	             language:  'zh-CN',
	             format: 'yyyy-mm',
	             autoclose: true,
	             todayBtn: true,
	             startView: 'year',
	             minView:'year',
	             maxView:'decade',
	             forceParse:false
	             });
	        
         
		});
	
		
		var TableObj = {
				 
		    //初始化Table
		    oTableInit: function () {
		    	  	
		        $('#tb_departments').bootstrapTable({
		        	url: '${pageContext.request.contextPath}/teacherInGardenMonthEvaluateController/findBabyList',   //请求后台的URL（*）
		     	   method: 'get',     //请求方式（*）
		     	   //toolbar: '#toolbar',    //工具按钮用哪个容器
		     	   striped: true,      //是否显示行间隔色
		     	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     	   pagination: true,     //是否显示分页（*）
		     	   sortable: false,      //是否启用排序
		     	   sortOrder: "asc",     //排序方式	
		           queryParams: function (params) {  //传递参数（*）
		        	var year = $("#pjyear").val().split('-')[0];
	                return {
	                   limit: params.limit, //页面大小
	             	   offset: params.offset, //页码
	             	   year: year,
	             	   term:$("#term").val(),
	             	   birth:$("#pjbirth").val(),
	             	   gradeAndClass:$("#gradeAndClass").val(),
	             	   name:$("#bname").val(),
	             	   createmonth:$('#createmonth').val(),
	                };
		            },	  
		     	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
		     	   pageNumber:1,      //初始化加载第一页，默认第一页
		     	   pageSize: 5,      //每页的记录行数（*）
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
		     	   singleSelect: true, //禁止多选行 ,下面的列头自动隐藏
		            columns: [
		     	   {
		                title: '宝宝姓名',
		                field: 'bname',
		                align: 'center',
		                valign: 'middle'
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
		                title: '在园情况',
		                field: 'behavior',
		                align: 'center',
		                formatter:function(value,row,index){
		                	if(value==undefined){
		                		value='';
		                	}
			               return "<textarea rows='3' cols='30' id='behavior"+index+"' style='width:100%;'>"+value+"</textarea>"; 
				       
		                }
		            },
		            {
		                title: '给爸妈的意见',
		                field: 'suggestion',
		                align: 'center',
		                formatter:function(value,row,index){

		                	if(value==undefined){
		                		value='';
		                	}
		                	 return "<textarea rows='3' id='suggestion"+index+"' cols='30' style='width:100%;'>"+value+"</textarea>"; 
			           }
		            }, 
		            {
		                title: '评价id',
		                field: 'mid',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '班级id',
		                field: 'classid',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '班级名称',
		                field: 'classname',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '年级',
		                field: 'grade',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '学期',
		                field: 'term',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '学年',
		                field: 'createyear',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '教师id',
		                field: 'teacherid',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '评价教师',
		                field: 'teachername',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '创建日期',
		                field: 'createdate',
		                align: 'center',
		                valign: 'middle'
		            }, 
		            {
		                title: '操作',
		                field: 'id',
		                align: 'center',
		                formatter:function(value,row,index){
		                	return "<a href='javascript:void(0);' onclick=\"edit("+index+");\">保存</a>";;
		                }
		            }
		            ]
		        });
		        
		        //隐藏id列
		    	 $('#tb_departments').bootstrapTable('hideColumn', 'mid');
		         $('#tb_departments').bootstrapTable('hideColumn', 'classid');
		         //$('#tb_departments').bootstrapTable('hideColumn', 'classname');
		         $('#tb_departments').bootstrapTable('hideColumn', 'grade');
		         $('#tb_departments').bootstrapTable('hideColumn', 'term');
		         $('#tb_departments').bootstrapTable('hideColumn', 'createyear');
		         $('#tb_departments').bootstrapTable('hideColumn', 'teacherid');
		         //$('#tb_departments').bootstrapTable('hideColumn', 'teachername');
		         $('#tb_departments').bootstrapTable('hideColumn', 'createdate'); 
		    }
		};
		
		//保存修改
		function edit(index){
			var row = $('#tb_departments').bootstrapTable('getData')[index];
            var createmonth = $('#createmonth').val();
            var suggestion = $('#suggestion'+index).val();
            var behavior = $('#behavior'+index).val();
	
            /* alert('${sessionScope.sessionInfo.cname }'); */
			$.ajax({ 
   	         type : 'POST',
   	         datatype : 'JSON',
   	         url :  '${pageContext.request.contextPath}/teacherInGardenMonthEvaluateController/dosave',
   	         data : {"id":row.id,"bname":row.bname,"createyear":row.createyear,"term":row.term,"mid":row.mid,"grade":row.grade,
   	        	    "classid":row.classid,"classname":'${sessionScope.sessionInfo.cname }',"behavior":behavior,"suggestion":suggestion,"createmonth":createmonth},
   			 success : function(data) {
   				$('#tb_departments').bootstrapTable('refresh');
   			 },
   			 error : function(data){
   				 alert("请求出错！");
   				 }
   			 });
		}
 
		//学期修改联动月份
		function changeTerm(){
			
		       var term = $('#term').val();
		       var select = "";
		       $('#createmonth').empty();
		       if(term=='上学期'){
		    	   var select = " <option value='8'>八月</option><option value='9'>九月</option><option value='10'>十月</option>"
		    	   +"<option value='11'>十一月</option><option value='12'>十二月</option><option value='1'>一月</option>";
		       }
		       else{
		    	   var select = " <option value='2'>二月</option><option value='3'>三月</option><option value='4'>四月</option>"
			    	   +"<option value='5'>五月</option><option value='6'>六月</option><option value='7'>七月</option>";
			    	   
		       }
			    	   $('#createmonth').append(select);
			    	   $('#createmonth').val('<%=month%>');
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
     <div class="row">   
      <label class="control-label col-sm-1 label-expand"  for="pjyear">所在学年</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" value="<%=createyear %>" readonly id="pjyear">
      </div>
      
      <label class="control-label col-sm-1 label-expand"  for="term">所属学期</label>
      <div class="col-sm-2 text-expand">
       <!-- <select  name="term" id="term" class=" show-tick form-control"  onchange="changeTerm()" >
                 <option value="上学期">上学期</option>   
                 <option value="下学期">下学期</option>                         
         </select>  -->
         <input type="text" class="form-control input-sm"  readonly id="term">
      </div>
      
      <label class="control-label col-sm-1 label-expand "  for="pjbirth">出生日期</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm form_datetime_2"  id="pjbirth">
      </div>
      
	 </div>
	 
	 <div class="row" style="padding-top:10px;">   
      <label class="control-label col-sm-1 label-expand"  for="gradeAndClass">所在年级</label>
      <div class="col-sm-2 text-expand">         
         <input type="text" class="form-control input-sm" value="<%=cname%>" readonly id="gradeAndClass">     
       <!-- <input type="text" class="form-control input-sm" id="pjgrade"> -->
      </div>
      <label class="control-label col-sm-1 label-expand"  for="pjclass">评价月份</label>
      <div class="col-sm-2 text-expand">
       <select  name="createmonth" id="createmonth" class=" show-tick form-control" >                         
         </select> 
      </div>
      <label class="control-label col-sm-1 label-expand"  for="bname">宝宝姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="bname">
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
<div class="modal fade" id="editEvluate" role="dialog" aria-labelledby="gridSystemModalLabel" >
</div>

</body>
</html>