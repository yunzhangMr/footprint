<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />
<title>学期评价</title>

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/>  

<script type="text/javascript">
    
    $(function () {
    	 
    	 //1.初始化Table
    	 var oTable = new TableInit();
    	 oTable.Init();
    	 
    	 //2.初始化Button的点击事件
    	 var oButtonInit = new ButtonInit();
    	 oButtonInit.Init();
    	 
    	  //文本域计数器
         //先选出 textarea 和 统计字数 dom 节点

          var wordCount = $("#wordCount"),
          textArea = wordCount.find("textarea"),
          word = wordCount.find(".word");
          //调用
          statInputNum(textArea,word);
          //文本域计数器end
    	 
    	});
    	 
    	 
    	 var TableInit = function () {
    	 var oTableInit = new Object();
    	 //初始化Table
    	 oTableInit.Init = function () {
    	  $('#tb_departments').bootstrapTable({
    	   url: '${pageContext.request.contextPath}/adminController/classManage',   //请求后台的URL（*）
    	   method: 'get',      //请求方式（*）
    	   //toolbar: '#toolbar',    //工具按钮用哪个容器
    	   striped: true,      //是否显示行间隔色
    	   cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
    	   pagination: true,     //是否显示分页（*）
    	   sortable: false,      //是否启用排序
    	   sortOrder: "asc",     //排序方式
    	   queryParams: oTableInit.queryParams,//传递参数（*）
    	   pageNumber:1,      //初始化加载第一页，默认第一页
    	   pageSize: 5,      //每页的记录行数（*）
    	   pageList: [5,15],  //可供选择的每页的行数（*）
    	   sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）  	   
    	   search: false,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
    	   strictSearch: true,
    	   //showColumns: true,     //是否显示所有的列
    	   showRefresh: false,     //是否显示刷新按钮
    	   minimumCountColumns: 2,    //最少允许的列数
    	   clickToSelect: true,    //是否启用点击选中行
    	   singleSelect:true,  //行单选
    	   //height: 500,      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
    	   uniqueId: "classid",      //每一行的唯一标识，一般为主键列
    	   showToggle:false,     //是否显示详细视图和列表视图的切换按钮
    	   cardView: false,     //是否显示详细视图
    	   detailView: false,     //是否显示父子表
    	   columns: [
    	             /* {
    		 checkbox:true,
    	   }, */
    	    {
    		   title: '序号',
               field: 'classid',
               align: 'center',
               valign: 'middle',
           }, 
           {
               title: '宝宝姓名',
               field: 'name',
               align: 'center',
               valign: 'middle',
           }, 
           {
               title: '出生年月',
               field: 'teacher1name',
               align: 'center',
           },
           {
               title: '录入日期',
               field: 'teacher2name',
               align: 'center',
           },

           {
               title: '操作',
               field: 'classid',
               align: 'center',
               formatter:function(value,row,index){  
                       /* var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.classid + '\')">编辑</a> ';  
                       var d = '<a href="#" mce_href="#" onclick="del(\''+ row.classid +'\')">删除</a> ';   */
                       var e = '<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource" >修改</button>&nbsp;';
                       var d = '<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource">删除</button>';
                            return e+d;  
                        }
           },
            ]
    	  });
    	  
    	  
    	 };
    	 
    	 //得到查询的参数
    	 oTableInit.queryParams = function (params) {

    	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	   limit: params.limit, //页面大小
    	   offset: params.offset, //页码
    	   nurseryName: $("#txt_search_nurseryName").val(),
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
         
         });
    	 
    	 function countnum(obj){
    		 alert(obj.id);
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
<style type="text/css">
.wordCount{ position:relative;width:90%; }
.wordCount textarea{ width: 100%; height: 100px;}
.wordCount .wordwrap{ position:absolute; right: 6px; bottom: 6px;}
.wordCount .word{ color: red; padding: 0 4px;;}
</style>
<body>
<!-- <div class="panel-body" style="padding-bottom:0px;">
          <h3>在园学期总结  </h3>
  </div> -->
<!-- 此处为查询条件  -->
  <div class="panel-body" style="padding-bottom:0px;">
  <div class="panel panel-default" style="padding-top:5px;">
   <!-- <div class="panel-heading">查询条件</div> -->
    <form id="formSearch" class="form-horizontal">
     <div class="form-group" style="margin-top:0px">
     		
			<label for="paixu" class="col-sm-1 control-label">所属学年:</label>
			<div class="col-sm-3">
			<select class=" form-control" style="width:200px;">
				<option>地区</option>
				<option>班期</option>
				<option>性别</option>
				<option>年龄</option>
				<option>份数</option>
			</select>
			</div>
		

			<label for="term" class="col-sm-1 control-label">所属学期：</label>
			<div class="col-sm-3">
		    <label class="control-label" for="anniu">
			<input type="radio" name="term" id="normal" value="1">上学期</label>
		    <label class="control-label" for="meun">
			<input type="radio" name="term" id="forbid" value="2">下学期</label>
			</div>

             
			<label  class="col-sm-1 control-label">所在班级：</label>
			<div class="col-sm-3">
			 <label class="control-label" ><span>小（6）班</span></label>
			</div>
	    </div>  
	    <div class="form-group" style="margin-top:0px">   
		   <label class="control-label col-sm-1" for="txt_search_nurseryName">宝宝姓名：</label>
	       <div class="col-sm-3">
	       <input type="text" class="form-control" id="txt_search_nurseryName" style="width:200px;">
	       </div>
	       <label class="control-label col-sm-1" for="txt_search_teacherName">出生日期：</label>
	       <div class="col-sm-3">
			<select class=" form-control" style="width:100px;float:left;margin-right:10px;">
				<option>年</option>
				<option>2016</option>
				<option>性别</option>
				<option>年龄</option>
				<option>份数</option>
			</select>
			<select class=" form-control" style="width:100px;">
				<option>月</option>
				<option>班期</option>
				<option>性别</option>
				<option>年龄</option>
				<option>份数</option>
			</select>
			</div>     
     
      <div class="col-sm-4" style="text-align:left;">
       <button type="button" style="margin-left:50px;width:100px;" id="btn_query" onclick="search()" class="btn btn-primary">查询</button>
      </div>
     </div>
    </form>
  </div>  
 </div>
 
<table id="tb_departments"></table>

<div class="panel-body" style="padding-bottom:0px;">

<label class="control-label" ><font style="font-size:20px;">孩子的闪光点（轶事记录）</font>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和家长共同欣赏。</label>
<div class="form-group" style="margin-top:0px">

<div class="wordCount" id="wordCount">
<textarea placeholder="textarea还剩余字数统计" ></textarea>
<span class="wordwrap"><var class="word">300</var>/300</span>  
</div>
<select class=" form-control" style="width:90px;">
		<option>常用语</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
	</select>
<span id="clock"></span>
</div>

<div class="form-group" style="margin-top:0px">
<label class="control-label" ><font style="font-size:20px;">期末幼儿发展分析</label>
</div>
<label class="control-label" ><font style="font-size:16px;">本学期内有哪些明显进步的方面：</label>
<div class="form-group" style="margin-top:0px">
<div class="wordCount" id="wordCount">
<div class="col-sm-1">
	<select class=" form-control" style="width:100px;">
		<option>常用语</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
	</select>
    </div>
    <textarea placeholder="textarea还剩余字数统计" ></textarea>
    <span class="wordwrap"><var class="word">200</var>/200</span>
</div>
<span id="clock"></span>
</div>
<label class="control-label" ><font style="font-size:16px;">本学期内有哪些明显进步的方面：</label>
<div class="form-group" style="margin-top:0px">
<div class="wordCount" id="wordCount">
<div class="col-sm-1">
	<select class=" form-control" style="width:100px;">
		<option>常用语</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
	</select>
    </div>
    <textarea placeholder="textarea还剩余字数统计" ></textarea>
    <span class="wordwrap"><var class="word">200</var>/200</span>
</div>
<span id="clock"></span>
</div>
<label class="control-label" ><font style="font-size:16px;">需要加强个别指导的方面：</label>

<div class="form-group" style="margin-top:0px">
<div class="wordCount" id="wordCount">
<div class="col-sm-1">
	<select class=" form-control" style="width:100px;">
		<option>常用语</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
		<option>本学期内，孩子在家里曾经做过哪些令人感到和难忘的事？请随时记录在这里，和</option>
	</select>
    </div>
    <textarea placeholder="textarea还剩余字数统计" ></textarea>
    <span class="wordwrap"><var class="word">200</var>/200</span>
</div>
<span id="clock"></span>
</div>

<div style="text-align:center;">
     <button type="button" class="btn btn-xs btn-white" style="width:140px;height:50px;font-size:30px;">取 消</button>
	<button type="submit" id="submit" style="width:140px;height:50px;font-size:30px;" class="btn btn-xs btn-green">保存</button>
</div>
</div>



<!--  <div id="toolbar" class="btn-group">
   <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#changeSource">
    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
   </button>
  <button id="btn_edit" type="button" class="btn btn-default">
    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
   </button>
   <button id="btn_delete" type="button" class="btn btn-default">
    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
   </button> 
  </div>  -->
 

 
 <!-- 
  <div class="modal-body">
	<div class="container-fluid">
		<form class="form-horizontal" >
		    <div class="form-group">				
				<label for="paixu" class="col-xs-2 control-label">评价所属学年:</label>
				<select class=" form-control" style="width:100px;">
					<option>地区</option>
					<option>班期</option>
					<option>性别</option>
					<option>年龄</option>
					<option>份数</option>
				</select>
			</div> 
			<div class="form-group">
			<label for="situation" class="col-xs-2 control-label">评价所属学期：</label>
				<label class="control-label" for="anniu">
					<input type="radio" name="term" id="normal" value="1">上学期</label>
				<label class="control-label" for="meun">
					<input type="radio" name="term" id="forbid" value="2">下学期</label>
			</div>
			
			<div class="form-group ">
				<label for="sName" class="col-xs-2 control-label">班级年级：</label>
				<div class="col-xs-8 ">
					<input type="text" style="width:180px;float:left;" class="form-control input-sm" name="grade" id="grade" placeholder="请输入年级">
				</div>
			</div>
			<div class="form-group">
				<label for="sLink" class="col-xs-2 control-label">年级班数：</label>
				<div class="col-xs-8 ">
					<input type="text" style="width:180px;float:left;" class="form-control input-sm" name="cnum" id="cnum" placeholder="请输入班级">
				</div>
			</div>
			<div class="form-group">
				<label for="sOrd" class="col-xs-2 control-label">学年：</label>
				<div class="col-xs-8">
					<input type="text" style="width:180px;float:left;" class="form-control input-sm" name="createyear" id="createyear" placeholder="请输入学年">
				</div>
			</div>
		  <div style="text-align:center;">
		  <button type="submit" id="submit" style="width:120px;height:40px;" class="btn btn-xs btn-green">创建</button>
		  </div>
		</form>
	</div>
</div>
  -->
 <!-- 弹框 -->
 <!--修改资源弹出窗口-->
<div class="modal fade" id="changeSource" role="dialog" aria-labelledby="gridSystemModalLabel">
	<script type="text/javascript">
	     $("#changeSource").load("../view/admin/editClass.jsp");
	</script>
</div>

<!--弹出删除资源警告窗口-->
<div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" >
		<div class="modal-content" style="width: 800px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					确定要删除该资源？删除后不可恢复！
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
				<button type="button" class="btn btn-xs btn-danger" >保 存</button> 
			</div>
		</div>
	</div>
</div>
 
</body>
</html>