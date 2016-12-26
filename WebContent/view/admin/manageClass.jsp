<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />
<title>宝宝班级调整</title>

<script src="${pageContext.request.contextPath}/resource/jquery-1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<%-- <link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-table.min.css" rel="stylesheet"/> 
 --%>
<script type="text/javascript">
    
    $(function () {
    	
    	var rowData = new Object();
/*     	rowArrays = ['id','cname','nursery_id','nursery_name','createdate','createyear','grade','term','cnum','teacher1id','teacher2id','teacher3id','teacher1name','teacher2name','teacher3name','previous_id','status']; */

		$("#addClass").hide();
    	$("#addClassBtn").hide();
    	$("#editClassBtn").hide();
    	var currentNum;
    	var tercher1loginid;
		var tercher2loginid;
		var tercher3loginid;
    	
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
    	   url: '${pageContext.request.contextPath}/classController/classManage',   //请求后台的URL（*）
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
    	   uniqueId: "id",      //每一行的唯一标识，一般为主键列
    	   showToggle:false,     //是否显示详细视图和列表视图的切换按钮
    	   cardView: false,     //是否显示详细视图
    	   detailView: false,     //是否显示父子表
    	   columns: [{
               title: '班级名称',
               field: 'cname',
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
	            var e = '<a href="#" mce_href="#" onclick="edit('+ JSON.stringify(row).replace(/\"/g,"'") +')">修改</a> ';  
	            var d = '<a href="#" mce_href="#" onclick="del('+JSON.stringify(row).replace(/\"/g,"'") +')">撤销</a> ';   /*  JSON.stringify(  .replace("\'id\'","\'classid\'").replace("\'cname\'","\'name\'").replace("\'nursery_id\'","\'nuseryid\'").replace("\'nursery_name\'","\'nurseryName\'").replace("\'previous_id\'","\'previousId\'") */
	                 return e+'&nbsp;|&nbsp;&nbsp;'+d;  
	             }
           }]
    	  });
    	  
    	  
    	 };
    	 
    	 //得到查询的参数
    	 oTableInit.queryParams = function (params) {

    	  var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	   limit: params.limit, //页面大小
    	   offset: params.offset, //页码
    	   name: encodeURI($("#txt_search_nurseryName").val()),
    	   teacherName: encodeURI($("#txt_search_teacherName").val())
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
    	
    	/*
    		删除一个班级(每列的修改超链接)，这里是把class的可用状态修改掉了
    	*/
    	var delRow;
    	function del(row) {
    		delRow = row;
    		$("#confirm").modal('show');
		}
    	
    	/*
    		模态框里删除具体操作
    	*/
    	$("#confirmDel").on("click",function(){
    		$.post("${pageContext.request.contextPath}/classController/checkHaveBaby",{id:delRow.id},function(data){
    			/* alert(data); */
    			var json = eval('('+data+')');
    			if(json.obj==0){
    				var row = delRow;
    				delete row.createdate;
       	    		$.post("${pageContext.request.contextPath}/classController/classDel",row,function(data){
       	    			$('#tb_departments').bootstrapTable('refresh');
       	    		}); 
    			}else{
    				$("#warning").modal('show');
    			}
    		});
    	});
    	
    	/*
    		修改班级信息(每列的修改超链接)
    	*/
    	function edit(row){
    		currentNum = row.cnum;
    		/* alert('id='+id+' grade='+grade+' cnum'+cnum+' cname='+cname+' teacher1name'+teacher1name+' teacher2name'+teacher2name+' teacher3name'+teacher3name); */
    		$("#addClass").show();
    		$("#title-head").text('修改班级信息');
    		$("#editClassBtn").show();
    		$("#addClassBtn").hide();
    		/*  alert(JSON.stringify(row)); */
    		//将operation-form的字段的值设为空
    		var rowArrays = ['id','cname','nursery_id','nursery_name','createdate','createyear','grade','term','cnum','teacher1id','teacher2id','teacher3id','teacher1name','teacher2name','teacher3name','previous_id','status']; 
    		for(var i in rowArrays){
    			$("#"+rowArrays[i]).val('');
    		}
    		for(var i in row){
    			
    			if(i=='grade'){
    				document.getElementById("seniorGrade").checked = false;
    				document.getElementById("middleGrade").checked = false;
    				document.getElementById("primaryGrade").checked = false;
    				if(row[i]=='大'){document.getElementById("seniorGrade").checked = true;}
    				if(row[i]=='中'){document.getElementById("middleGrade").checked = true;}
    				if(row[i]=='小'){document.getElementById("primaryGrade").checked = true;}
    			} else {
    				if(i!='createdate'){$("#"+i).val(row[i]);}
    				if(i=='teacher1id'){$("#teacher1idOld").val(row[i]);}
    				if(i=='teacher2id'){$("#teacher2idOld").val(row[i]);}
    				if(i=='teacher3id'){$("#teacher3idOld").val(row[i]);}
    			}
    		}
    		tercher1loginid='';
			tercher2loginid='';
			tercher3loginid='';
    		$.post("${pageContext.request.contextPath}/classController/getCNum",{createyear:$("#createyear").val(),grade:$("input[name='grade']:checked").val(),term:$("#term").val()},function(data){
				var json = eval('('+data+')');
				var text = '已有班级编号为：';
				for(var i in json.obj){
					if(i!=0){text += ',';}
					text += json.obj[i].cnum;
				}
				$("#hasCNum").text(text);
			}); 
			/* $('#tb_departments').bootstrapTable('refresh'); */
    		/* 
    		$("#classid").val(id=='undefined'?'':id);
    		$("#grade").val(grade=='undefined'?'':grade);
    		$("#cnum").val(cnum=='undefined'?'':cnum);
    		$("#name").val(cname=='undefined'?'':cname);
    		 $("#teacher1name").val(teacher1name=='undefined'?'':teacher1name);
    		$("#teacher2name").val(teacher2name=='undefined'?'':teacher2name);
    		$("#teacher3name").val(teacher3name=='undefined'?'':teacher3name); */
    	}
    	
    	/*
    		新增班级（查询栏的新增班级按钮）
    	*/
    	function add(){
    		$("#addClass").show();
    		$("#title-head").text('新增班级');
    		$("#addClassBtn").show();
    		$("#editClassBtn").hide();
    		//将operation-form的字段的值设为空
    		var rowArrays = ['id','cname','nursery_id','nursery_name','createdate','createyear','grade','term','cnum','teacher1id','teacher2id','teacher3id','teacher1name','teacher2name','teacher3name','previous_id','status']; 
    		for(var i in rowArrays){
    			$("#"+rowArrays[i]).val('');
    		}
    		document.getElementById("seniorGrade").checked = true;
			document.getElementById("middleGrade").checked = false;
			document.getElementById("primaryGrade").checked = false;
			$.post("${pageContext.request.contextPath}/classController/getCNum",{createyear:'${sessionScope.sessionInfo.createyear }',grade:'大',term:'${sessionScope.sessionInfo.term}'},function(data){
				var json = eval('('+data+')');
				var text = '已有班级编号为：';
				for(var i in json.obj){
					if(i!=0){text += ',';}
					text += json.obj[i].cnum;
				}
				$("#hasCNum").text(text);
			}); 
			tercher1loginid='';
			tercher2loginid='';
			tercher3loginid='';
    		/* $("#grade").val("");
    		$("#cnum").val("");
    		$("#name").val("");
    		$("#teacher1name").val("");
    		$("#teacher2name").val("");
    		$("#teacher3name").val("");
    		$("#teacher1id").val("");
    		$("#teacher2id").val("");
    		$("#teacher3id").val(""); */
    	}
    	
    	/*
			关闭新增班级（操作界面的取消超链接）
		*/
    	$("#closeAdd").on("click",function(){
    		$("#addClass").hide();
    	});
    	
    	$("#cnum").on("keyup",function(){
			$this = $(this);
			$this.val($this.val().replace(/\D/gi,""));
			if($this.val()==''){
				$("#cunmNote").text("请输入一个正确的班号");
			}else{
				$("#cunmNote").text('');
				$this.val(parseInt($this.val()));
			}
		});
    	
    	/*
			新增（操作界面的新增按钮）
		*/
		$("#addClassBtn").on("click",function(){
			if($("#cnum").val()===''||Number($("#cnum").val())==0||$.inArray($("#cnum").val(),$("#hasCNum").text().split(","))!=-1){
				$("#cunmNote").text("请输入一个正确的班号");
				$("#cnum").focus();
			}else{
				$("#addClass").hide();
				$.post("${pageContext.request.contextPath}/classController/classAdd",$("#operation-form").serialize(),function(data){
					/* alert(data); */
					$('#tb_departments').bootstrapTable('refresh');
				});
			}
			$('#tb_departments').bootstrapTable('refresh');
		});
	
		/*
			修改（操作界面的修改按钮）
		*/
		$("#editClassBtn").on("click",function(){
			/* alert($.inArray($("#cnum").val(),$("#hasCNum").text().split(","))!=-1); */
			if($("#cnum").val()===''||Number($("#cnum").val())==0||($.inArray($("#cnum").val(),$("#hasCNum").text().split(","))!=-1&&$("#cnum").val()!=currentNum)){
				$("#cunmNote").text("请输入一个正确的班号");
				$("#cnum").focus();
			}else{
				$("#addClass").hide();
				/* alert($("#operation-form").serialize());//{id:51,cname:'小小'} */
				$.post("${pageContext.request.contextPath}/classController/classEdit",$("#operation-form").serialize(),function(data){
					/* alert(data); */
					$('#tb_departments').bootstrapTable('refresh');
				});
			}
			$('#tb_departments').bootstrapTable('refresh');
		});
    	
		
    	/*
    		选择当前教师
    	*/
    	function selectClick(sid,username,buttonId){
    		var num = buttonId.substring(13);
    		/* alert(num);alert("#teacher"+num+"id");alert("#teacher"+num+"name"); */
    		$("#teacher"+num+"id").val(sid);
    		$("#teacher"+num+"name").val(username);
    		if(num==1){tercher1loginid=sid;}
    		if(num==2){tercher2loginid=sid;}
    		if(num==3){tercher3loginid=sid;}
    	}
    	
    	$("button[id^='teacherSelect'],#btn-query-teacher").on("click",function(){
    		$this = $(this);
    		if($this.attr("id")!='btn-query-teacher'){$("#teacherNameSelect").val('');$("#teacherMobileSelect").val('');}
    		$.post("${pageContext.request.contextPath}/userController/getTeachers",{name:$("#teacherNameSelect").val(),mobile:$("#teacherMobileSelect").val()},function(data){
    			var json = eval(data);
    			$("#teacherList").empty();
   				for(var i=0;i<json.length;i++){
       				if(json[i].sid!=tercher1loginid&&json[i].sid!=tercher2loginid&&json[i].sid!=tercher3loginid){
   	    				$li = '<li class="list-group-item">'
   	    				    +'<div class="row" >'
   	    				    +'<div class="col-xs-3 col-xs-offset-1">'
   	    				    +'<label for="" class="control-label">'+json[i].username+'</label>'
   	    				    +'</div>'
   	    				    +'<div class="col-xs-3 col-xs-offset-1">'
   	    				    +'<label for="" class="control-label">'+json[i].mobile+'</label>'
   	    				    +'</div>'
   	    				    +'<div class="col-xs-3 col-xs-offset-1">'
   	    				    +'<button id="teacherSelect" onClick="selectClick(\''+json[i].sid+'\',\''+json[i].username+'\',\''+$this.attr("id")+'\')" type="button" class="btn btn-primary btn-xs" data-dismiss="modal" aria-label="Close">选择'
   	    				    +'</button>'
   	    				    +'</div>'
   	   						+'</div>'
   							+'</li>';
   						$("#teacherList").append($li);
       				}
       			}
    			if($("#teacherList").html()==''){
    				$li = '<li class="list-group-item">'
    				    +'<div class="row" >'
    				    +'<span>无符合条件的内容！</span>'
    				    +'</div>'
						+'</li>';
    				$("#teacherList").append($li);
    			}
    			
    			
	    	});
    		$("#addTeacher").modal('show');
    	});
    	
    	/*
			radio（change事件）年级变动时，得到已创建班级
		*/
		 $("input[name='grade']").on("change",function(){
			$this = $(this);
			$.post("${pageContext.request.contextPath}/classController/getCNum",{createyear:$("#createyear").val(),grade:$this.val(),term:$("#term").val()},function(data){
				var json = eval('('+data+')');
				
				var text = '已有班级编号为：';
				for(var i in json.obj){
					if(i!=0){text += ',';}
					text += json.obj[i].cnum;
				}
				$("#hasCNum").text(text);
			});
		});  
    	
    	/* $("#btn-query-teacher").on("click",function(){
    		alert(0);
    		alert($("#teacherNameSelect").val());
    		alert($("#teacherMobileSelect").val());
    	}); */
    	
    	/* 获取教师
    	$("#tb_teachers").bootstrapTable({
    		striped: true,
    		sortOrder: "asc",
    		uniqueId: "id", 
    		pagination: false,
    		columns: [
            {
                title: '老师ID',
                field: 'teacher1name',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '老师名称',
                field: 'teacher2name',
                align: 'center'
            },
            {
                title: '操作',
                field: 'id',
                align: 'center',
                formatter:function(value,row,index){  
 	            var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">选择</a> ';  
 	                 return e;  
 	             }
            }],
            data:data
    	}); */
    	
    	
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
      <label class="control-label col-sm-1 label-expand"  for="txt_search_nurseryName">班级名称</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_nurseryName">
      </div>
      <label class="control-label col-sm-1 label-expand"  for="txt_search_teacherName">教师名称</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_teacherName">
      </div>
      <div class="col-sm-1 search-expand">
       <button type="button" id="btn_query" onclick="search()" class="btn btn-primary btn-sm">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;搜索
		</button>
      </div>
      <div class="col-sm-1 btn-expand">
       <button type="button" id="btn_query" onclick="add()" class="btn btn-primary btn-sm" ><!-- data-toggle="modal" data-target="#addUser" -->
			<!-- <span class="glyphicon glyphicon-plus" aria-hidden="true"> --></span>新增班级
		</button>
      </div>
     </div>
    </form>
   </div>
  </div>  
</div>   
 

<div id="addClass" class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-heading">
		<h3 id="title-head" class="panel-title">
			新增班级
		</h3>
	</div>
  	<div class="panel-body panel-body-expand2">
  	<div class="content-modal">
  		<form id="operation-form" class="" role="form">
           	 <div class="row content" >
              <div class="col-xs-1 col-xs-offset-3">
                <div class="form-group form-group-sm label-expand-form">
                	<!-- id放到隐藏域中供修改时使用 -->
                	<input id="id" name="id" value="" type="hidden"/>
                	<input id="cname" name="cname" value="" type="hidden"/>
                	<input id="nursery_id" name="nursery_id" value="" type="hidden"/>
                	<input id="nursery_name" name="nursery_name" value="" type="hidden"/>
                	<!-- <input id="createdate" name="createdate" value="" type="hidden"/> -->
                	<input id="createyear" name="createyear" value="" type="hidden"/>
                	<input id="term" name="term" value="" type="hidden"/>
                	<input id="previous_id" name="previous_id" value="" type="hidden"/>
                	<input id="status" name="status" value="" type="hidden"/>
                  <label for="grade" class="control-label">年级</label>
                </div>
              </div>
               <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <!-- <input id="grade" name="grade" type="text" value="" placeholder="" class="form-control tAlign" /> -->
                  	<label class="" >
					<input type="radio" name="grade" id="seniorGrade" value="大">大班</label>
					<label class="radio-expand" >
					<input type="radio" name="grade" id="middleGrade" value="中">中班</label>
					<label class="radio-expand" >
					<input type="radio" name="grade" id="primaryGrade" value="小">小班</label>
                </div>
              </div>
            </div>
           
             <div class="row" >
              <div class="col-xs-1 col-xs-offset-3">
                <div class="form-group form-group-sm label-expand-form">
                  <label for="cnum" class="control-label">班号</label>
                </div>
              </div>
               <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input id="cnum" name="cnum" type="text" value="" placeholder="" class="form-control tAlign" onkeyup='this.value=this.value.replace(/\D/gi,"")'/>
                </div>
              </div>
              <div class="col-xs-5">
                <label id="hasCNum" class="control-label"></label>
              </div>
            </div>
            
            <div class="row" >
              <div class="col-xs-1 col-xs-offset-3">
              </div>
               <div class="col-xs-3">
                  <span id="cunmNote" style="color: red;font-size: 12px;"></span>
              </div>
            </div>
            
             <div class="row" >
              <div class="col-xs-1 col-xs-offset-3">
                <div class="form-group form-group-sm label-expand-form">
                  <label for="" class="control-label">教师一</label>
                </div>
              </div>
               <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input id="teacher1name" name="teacher1name" readonly=true type="text" value="" placeholder="" class="form-control tAlign" />
                	<input id="teacher1id" name="teacher1id" type="hidden" value=""/>
                	<input id="teacher1idOld" name="teacher1idOld" type="hidden" value=""/>
                </div>
              </div>
              <div class="col-xs-5">
                <button id="teacherSelect1" type="button" class="col-xs-2 btn btn-default btn-sm" >选择教师
           		</button>
              </div>
            </div>
            
             <div class="row" >
              <div class="col-xs-1 col-xs-offset-3">
                <div class="form-group form-group-sm label-expand-form">
                  <label for="" class="control-label">教师二</label>
                </div>
              </div>
               <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  	<input id="teacher2name" name="teacher2name" readonly=true type="text" value="" placeholder="" class="form-control tAlign" />
                	<input id="teacher2id" name="teacher2id" type="hidden" value=""/>
                	<input id="teacher2idOld" name="teacher2idOld" type="hidden" value=""/>
                </div>
              </div>
               <div class="col-xs-5">
                <button id="teacherSelect2" type="button" class="col-xs-2 btn btn-default btn-sm" >选择教师
           		</button>
              </div>
            </div>
            
             <div class="row" >
              <div class="col-xs-1 col-xs-offset-3">
                <div class="form-group form-group-sm label-expand-form">
                  <label for="" class="control-label">教师三</label>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group form-group-sm">
                  <input id="teacher3name" name="teacher3name" readonly=true type="text" value="" placeholder="" class="form-control tAlign" />
                  <input id="teacher3id" name="teacher3id" type="hidden" value=""/>
                  <input id="teacher3idOld" name="teacher3idOld" type="hidden" value=""/>
                </div>
              </div>
              <div class="col-xs-5">
                <button id="teacherSelect3" type="button" class="col-xs-2 btn btn-default btn-sm">选择教师
           		</button>
              </div>
            </div>
        </form>
        	 <div class="row row-btn">
           		<button id="addClassBtn" type="button" class="col-xs-1 col-md-offset-4 btn btn-primary btn-sm">保存
           		</button>
           		<button id="editClassBtn" type="button" class="col-xs-1 col-md-offset-4 btn btn-primary btn-sm">保存
           		</button>
           		<button id="closeAdd" type="button" class="col-xs-1 btn btn-link btn-sm">取消
           		</button>
            </div>
  	</div>
  </div>
  </div>
</div>

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  			<table id="tb_departments" class="table table-bordered responsive"></table>
  	</div>
  </div>
</div>
 
 <!-- 选择教师窗口（模态框） -->
 <div class="modal fade" id="addTeacher" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">选择老师</h4>
			</div>
			<div class="modal-body">
				<div class="" style="overflow-y:auto;height:400px;">
					<div class="" style="margin-bottom:10px;width:100%;height:30px;">
						<label class="col-sm-2 text-right" style="margin: 5px 0;"  for="txt_search_nurseryName">姓名</label>
				       		<input type="text" class=" col-sm-2 input-sm" id="teacherNameSelect">
				      	<label class=" col-sm-2 text-right"  style="margin: 5px 0;" for="txt_search_teacherName">手机</label>
					       <input type="text" class=" col-sm-3 input-sm" id="teacherMobileSelect">
					       <button type="button" id="btn-query-teacher" class="col-sm-1 col-sm-offset-1 btn btn-primary btn-sm" >
								搜索
							</button>
					</div>
					<ul id="teacherList" class="list-group">
					    
            			
					</ul>
				</div>
			</div>
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
							<label for="sKnot" class="col-xs-3 control-label">年级：</label>
							<div class="col-xs-8">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">班号：</label>
							<div class="col-xs-8">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">班级名称：</label>
							<div class="col-xs-8">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">老师一：</label>
							<div class="col-xs-8">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">老师二：</label>
							<div class="col-xs-8">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">老师三：</label>
							<div class="col-xs-3">
								<input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder="">
							</div>
							<div class="col-xs-3 col-xs-offset-1">
								<input type="text" class="form-control input-sm " id="sKnot" placeholder="">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-primary">保 存</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取 消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出确认删除窗口-->
<div class="modal fade" id="confirm" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<span>确定要删除吗？</span>
				</div>
			</div>
			<div class="modal-footer">
				<button id="confirmDel" type="button" class="btn btn-sm btn-primary" data-dismiss="modal">确定</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出警告窗口-->
<div class="modal fade" id="warning" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<span style="color: red;">班级下有学生不能删除！</span>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">确定</button>
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