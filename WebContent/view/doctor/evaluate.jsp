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
		        	url: '${pageContext.request.contextPath}/doctorEvaluateController/findBabyList',   //请求后台的URL（*）
		     	   method: 'get',     //请求方式（*）
		     	   toolbar: '#toolbar',    //工具按钮用哪个容器
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
	             	   term:$("input[name='pjterm']:checked").val(),
	             	   birth:$("#pjbirth").val(),
	             	   grade:$("#pjgrade").val(),
	             	   classid:$("#pjclass").val(),
	             	   name:$("#pjname").val()
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
		     	   singleSelect: true, //禁止多选行 ,下面的列头自动隐藏
		            columns: [{
		     		   checkbox: true,
		     	   },
		     	   {
		                title: '宝宝id',
		                field: 'id',
		                align: 'center',
		                valign: 'middle'
		            },
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
		                title: '所属年度',
		                field: 'createyear',
		                align: 'center',
		                formatter:function(value){
		             	   return value+'-'+(parseInt(value)+1)+'年';
		                }
		            },
		            {
		                title: '所属年级',
		                field: 'grade',
		                align: 'center'
		            },
		            {
		                title: '所属学期',
		                field: 'term',
		                align: 'center'
		            },
		            {
		                title: '班级id',
		                field: 'classid',
		                align: 'center'
		            },   
		            {
		                title: '所属班级',
		                field: 'cname',
		                align: 'center'
		            },
		            {
		                title: '出生日期',
		                field: 'birth',
		                align: 'center',
		            },         
		            {
		                title: '评价状态',
		                field: 'healthid',
		                align: 'center',
		                formatter:function(value){
		             	   if(value=='-1'){return '未评价';}
		             	   else{return '<span style=\"color:red\">已评价</span>';}
		                }
		            }
		            ]
		        });
		        
		      //隐藏id列
		    	 $('#tb_departments').bootstrapTable('hideColumn', 'id');
		         $('#tb_departments').bootstrapTable('hideColumn', 'classid');
		    }
		};
    
    	//model添加事件
   	    function doevaluate(obj){
    		
   	        var rows = $('#tb_departments').bootstrapTable('getSelections');
   	    	if(rows.length==0){
   	    		alert("请选择一位宝宝！");
   	    		return ;
   	    	}
   	    	var createyear = rows[0].createyear+"-"+(parseInt(rows[0].createyear)+1);
   	    	var data = {"action":obj.id,"healthid":rows[0].healthid,"gender":rows[0].gender,"createyear":createyear,"id":rows[0].id,
   	    			"term":rows[0].term,"grade":rows[0].grade,"classid":rows[0].classid,"bname":rows[0].bname,"cname":rows[0].cname};

   	    	if(obj.id=="btn-add-evaluate"&&rows[0].healthid!="-1"){
   	    		alert("已评价的宝宝不允许再次评价！");
   	    		return ;
   	    	}
   	    	if(obj.id!="btn-add-evaluate"&&rows[0].healthid=="-1"){
   	    		alert("不可查看或修改未评价过的宝宝！");
   	    		return ;
   	    	} 
   	    	
   		    $("#editEvluate").load("${pageContext.request.contextPath}/doctorEvaluateController/editEvaluate",data,function(){
   			
   		        $("#editEvluate").modal('show');   
   			
   		    });
   		
   	 }
    	
    	function getTClass(){
    		var pjgrade = $('#pjgrade').val();
    		if(pjgrade==''){
    			$('#pjclass').empty();
			 	var defaultselect = " <option value=''>请选择</option> ";
			 	$('#pjclass').append(defaultselect);
    			return ;
    		}
    		$.ajax({ 
    	         type : 'POST',
    	         datatype : 'JSON',
    	         url :  '${pageContext.request.contextPath}/doctorEvaluateController/getTClassList',
    	         data : {grade:pjgrade},
    			 success : function(data) {
    			 	var obj = jQuery.parseJSON(data);
    			 	console.log(obj);
    			 	$('#pjclass').empty();
    			 	var defaultselect = " <option value=''>请选择</option> ";
    			 	$('#pjclass').append(defaultselect);
    				for(var i in obj){ 
    					var cname = obj[i]['cname'];
                        var id = obj[i]['id'];
                        select = " <option value='"+id+"'>"+cname+"</option> ";
    				    $('#pjclass').append(select);
    				}
    	    
    			 },
    	         error:function(data){
    	        	 alert("菜单加载出错，请刷新页面");   
    	         }
    		
    		});
    	}
   
    </script>
</head>
<style>
</style>
<body>

<div class="wrap1">
  <div class="panel panel-default panel-expand1">
   <div class="panel-body panel-body-expand1 container">
    <form id="pjformSearch" class="form-horizontal" role="form">
     <div class="row">   
      <label class="control-label col-sm-1 label-expand"  for="pjyear">所在学年</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" value="<%=createyear %>" readonly id="pjyear">
      </div>
      
      <label class="control-label col-sm-1 label-expand"  for="term">所属学期</label>
      <div class="col-sm-2 text-expand"  style="padding-top:5px;">
	      <input id="pjterm1" name="pjterm" <%if(month<=2||month>=7){ %>checked="checked" <%} %> value="上学期" type="radio"><span>上学期</span>
	      <input id="pjterm2" name="pjterm" <%if(month>2&&month<7){ %>checked="checked" <%} %> value="下学期" type="radio"><span>下学期</span>
      </div>
      
      <label class="control-label col-sm-1 label-expand "  for="pjbirth">出生日期</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm form_datetime_2"  id="pjbirth">
      </div>
      
	 </div>
	 
	 <div class="row" style="padding-top:10px;">   
      <label class="control-label col-sm-1 label-expand"  for="pjgrade">所在年级</label>
      <div class="col-sm-2 text-expand">         
         <select  name="pjgrade" id="pjgrade" onchange="getTClass()"  class=" show-tick form-control"  >
                 <option value="">请选择</option>
                 <option value="大">大班</option>
                 <option value="中">中班</option>
                 <option value="小">小班</option>                                  
         </select>       
       <!-- <input type="text" class="form-control input-sm" id="pjgrade"> -->
      </div>
      <label class="control-label col-sm-1 label-expand"  for="pjclass">所在班级</label>
      <div class="col-sm-2 text-expand">
       <select  name="pjclass" id="pjclass" class=" show-tick form-control"  >
                 <option value="">请选择</option>                                 
         </select> 
      </div>
      <label class="control-label col-sm-1 label-expand"  for="pjname">宝宝姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="pjname">
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

<div id="toolbar" class="row" style="height:50px;padding:10px 20px;">
   <button id="btn-add-evaluate" onclick="doevaluate(this)" type="button" class="btn btn-primary btn-sm" >
    	开始评价
   </button>&nbsp;&nbsp;
   <button id="btn-edit-evaluate" onclick="doevaluate(this)" type="button" class="btn btn-primary btn-sm" >
  	  	修改评价
   </button>&nbsp;&nbsp;
   <button id="btn-look-evaluate" onclick="doevaluate(this)" type="button" class="btn btn-primary btn-sm" >
    	查看评价
   </button>&nbsp;&nbsp;
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