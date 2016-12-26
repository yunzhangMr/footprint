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
		    TableObj.oTableInit();
		    var type;
		    var item;
		   
		    
	         $("#pjbirth").datetimepicker({
	             language:  'zh-CN',
	             format: 'yyyy-mm',
	             autoclose: true,
	             todayBtn: true,
	             startView: 'year',
	             minView:'year',
	             maxView:'decade',
	             forceParse:false
	             }); 
	         
	         //文本域计数器
	         //先选出 textarea 和 统计字数 dom 节点
	          var wordCount = $("#wordCount"),
	          textArea = wordCount.find("textarea"),
	          word = wordCount.find(".word");
	          //调用
	          statInputNum(textArea,word);
	          //文本域计数器end
	
		});
		
		var TableObj = {
		    //初始化Table
		    oTableInit: function () {
		        $('#tb_departments').bootstrapTable({
		        	url: '${pageContext.request.contextPath}/commentTTController/getCommentTT',   //请求后台的URL（*）
		     	   method: 'get',     //请求方式（*）
		     	   //toolbar: '#toolbar',    //工具按钮用哪个容器
		     	   striped: true,      //是否显示行间隔色
		     	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		     	   pagination: false,     //是否显示分页（*）
		     	   sortable: false,      //是否启用排序
		     	   sortOrder: "asc",     //排序方式	
		           queryParams: function (params) {  //传递参数（*）
	                return {
	             	   name:$("#pjname").val().trim()
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
		     	   /* onlyInfoPagination: true, //显示总数 */
		     	  /*  paginationPreText: '<<上一页', //上一页的说明文字
		     	   paginationNextText: '下一页>>',//下一页的说明文字 */
		     	   singleSelect: true, //禁止多选行 ,下面的列头自动隐藏
		            columns: [{
		     		   checkbox: true
		     	   },
		     	   {
		                title: '宝宝姓名',
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
		            }],
		            onClickRow:function(row,$element){
		            	/* alert(JSON.stringify(row)); */
		            	$("#commentid").val(row.id);
		            	$("#sgd").val(row.sparkle);
		            	$("#jbfm").val(row.progress);
		            	$("#gbzd").val(row.guidance);
		            	$("#yxys").val(row.factors);
		            	$("#zdjh").val(row.plan);
		            }
		        });
		        
		      //隐藏id列
		    	/*  $('#tb_departments').bootstrapTable('hideColumn', 'id');
		         $('#tb_departments').bootstrapTable('hideColumn', 'classid'); */
		    }
		};
		
		function search() {
			$('#tb_departments').bootstrapTable('refresh');
		}
		
		$("button[id^='btn_comExp_']").on("click",function(){
			type = $(this).attr("title");
			item = $(this).attr("id").substring(11);
			$("#com-exp-modal").load("${pageContext.request.contextPath}/view/teacher/commonExpressions.jsp",null,function(data){
				$("#comExp").modal('show');
			});
		});
		
		$("#btn_insert").on("click",function(){
			/*  alert($("input[data-index]:checked").val()); */
			$.post("${pageContext.request.contextPath}/commentTTController/createCommentTT",null,function(data){
				alert(data);
				search();
			});
		});
		
		function save() {
			alert(0);
        	$.post("${pageContext.request.contextPath}/commentTTController/changeCommentTT",{id:$("#commentid").val(),sparkle:$("#sgd").val(),progress:$("#jbfm").val(),guidance:$("#gbzd").val(),factors:$("#yxys").val(),plan:$("#zdjh").val()},function(data){
        		alert(data);
        		search();
        	});
		}
		
		
		
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
    	
    	/*
         * 剩余字数统计
         * 注意 最大字数只需要在放数字的节点哪里直接写好即可 如：<var class="word">200</var>
         */

         function statInputNum(textArea,numItem) {

             var max = numItem.text(),
             curLength;
             textArea[0].setAttribute("maxlength", max);
             curLength = textArea.val().length;
             numItem.text(max - curLength);
             textArea.on('input propertychange', function () {
             numItem.text(max - $(this).val().length);

             });

         }
   
    </script>
</head>
<style>
/* .wordCount{ position:relative;width:90%; } */
.wordCount textarea{ width: 100%; height: 100px;}
.wordCount .wordwrap{ position:absolute; right: 30px; bottom: 6px;}
.wordCount .word{ color: red; padding: 0 4px;}
</style>
<body>

<div class="wrap1">
  <div class="panel panel-default panel-expand1">
   <div class="panel-body panel-body-expand1">
    <form id="pjformSearch" class="" role="form">
     <div class="row">   
      <label class="control-label col-sm-1 label-expand "  for="pjyear">所在学年</label>
      <div class="col-sm-2 text-expand">
       <!-- <input type="text" class="form-control input-sm" value="" readonly id="pjyear"> -->
       <label id="">${sessionScope.sessionInfo.createyear }-${sessionScope.sessionInfo.createyear+1 }学年</label>
      </div>
      
      <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="term">所属学期</label>
      <div class="col-sm-2 text-expand">
	     <%--  <input id="pjterm1" name="pjterm" <%if(month<=2||month>=7){ %>checked="checked" <%} %> value="上学期" type="radio"><span>上学期</span>
	      <input id="pjterm2" name="pjterm" <%if(month>2&&month<7){ %>checked="checked" <%} %> value="下学期" type="radio"><span>下学期</span> --%>
	      <label id="">${sessionScope.sessionInfo.term}</label>
      </div>
      
     <label class="control-label col-sm-1 col-sm-offset-1 label-expand"  for="pjgrade">所在班级</label>
     <div class="col-sm-2 text-expand" >
	     <%--  <input id="pjterm1" name="pjterm" <%if(month<=2||month>=7){ %>checked="checked" <%} %> value="上学期" type="radio"><span>上学期</span>
	      <input id="pjterm2" name="pjterm" <%if(month>2&&month<7){ %>checked="checked" <%} %> value="下学期" type="radio"><span>下学期</span> --%>
	      <label id="">${sessionScope.sessionInfo.cname}</label>
      </div>
      
	 </div>
	 
	 <div class="row" style="padding-top:10px;">   
	 
	 	 <label class="control-label col-sm-1 label-expand"  for="pjname">宝宝姓名</label>
	     <div class="col-sm-2 text-expand">
	      <input type="text" class="form-control input-sm" id="pjname">
	     </div>
	 
	      <div class="col-sm-2 col-sm-offset-1">
	       <button type="button" id="btn_insert"  class="btn btn-primary btn-sm">
				开始评测
			</button>
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

<!-- <div id="toolbar" class="row" style="height:50px;padding:10px 20px;">
   <button id="btn-edit-evaluate" onclick="doevaluate(this)" type="button" class="btn btn-primary btn-sm" >
  	  	修改信息
   </button>&nbsp;&nbsp;
   <button id="btn-look-evaluate" onclick="doevaluate(this)" type="button" class="btn btn-primary btn-sm" >
    	查看结果
   </button>&nbsp;&nbsp;
</div> -->

 <div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2" style="max-height:450px;overflow-y: scroll;">
  			<table id="tb_departments" class="table table-bordered responsive" ></table>
  	</div>
  </div>
</div>

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
		<label class="control-label" ><font style="font-size:14px;">孩子的闪光点（轶事记录）</font><font style="font-size:12px;">本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和家长共同欣赏。</font></label>
		<div class="row" >
			<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
				<button id="btn_comExp_sgd" title="闪光点" class="btn btn-sm btn-primary">常用语</button>
				<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button>
			</div>
			<div class="wordCount col-sm-10" id="wordCount">
				<textarea id="sgd" placeholder="textarea还剩余字数统计"></textarea>
				<span class="wordwrap"><var class="word">300</var>/300</span>  
			</div>
		</div>
	</div>
  </div>
</div>

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  		<div class="row" style="padding:10px 15px 0;">
  			<div class="col-sm-3">
  				<label class="control-label" ><span style="font-size:14px;">期末幼儿发展分析</span></label>
  			</div>
  			<!-- <div class="col-sm-1 col-sm-offset-7">
		       <button type="button" id="btn_comExp_" class="btn btn-primary btn-sm">
					保存
				</button>
	     	</div> -->
	     	<input id="commentid" type="hidden" />
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">本学期内有哪些明显进步的方面：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<button id="btn_comExp_jbfm" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button>
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="jbfm" placeholder="textarea还剩余字数统计"></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">需要加强个别指导的方面：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<button id="btn_comExp_gbzd" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button>
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="gbzd" placeholder="textarea还剩余字数统计"></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">影响因素分析：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<button id="btn_comExp_yxys" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button>
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="yxys" placeholder="textarea还剩余字数统计"></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
  		<div class="row" style="padding:10px 15px 0;">
  			<label class="control-label" ><span style="font-size:12px;">个别指导计划：</span></label>
			<div class="row" >
				<div class="col-sm-1" style="height:60px;padding:20px 0 20px 30px;">
					<button id="btn_comExp_zdjh" title="进步方面" class="btn btn-sm btn-primary">常用语</button>
					<button type="button" id="btn_save" onclick="save()" class="btn btn-primary btn-sm" style="margin-top:10px;">保存</button>
				</div>
				<div class="wordCount col-sm-10" id="wordCount">
					<textarea id="zdjh" placeholder="textarea还剩余字数统计"></textarea>
					<span class="wordwrap"><var class="word">300</var>/300</span>  
				</div>
			</div>
  		</div>
  		
	</div>
  </div>
</div>

<!--常用语窗口-->
<div class="modal fade" id="comExp" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true" style="width:1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">常用语</h4>
			</div>
			<div id="com-exp-modal" class="modal-body">
				
			</div>
			<div class="modal-footer">
				<!-- <button id="confirmDel" type="button" class="btn btn-sm btn-primary" >确定</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取消</button> -->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
 
<!--弹出添加班级窗口-->
<div class="modal fade" id="editEvluate" role="dialog" aria-labelledby="gridSystemModalLabel" >
</div>

</body>
</html>