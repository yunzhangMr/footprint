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
    	/* $(".modal").modal('hide'); */
    	
    	$("#edit-teacher").hide();
    	$("#add-teacher").hide();
    	var delId;
    	 
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
    	   url: '${pageContext.request.contextPath}/userController/teacherManage',   //请求后台的URL（*）
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
    	   uniqueId: "sid",      //每一行的唯一标识，一般为主键列
    	   showToggle: false,     //是否显示详细视图和列表视图的切换按钮
    	   cardView: false,     //是否显示详细视图
    	   detailView: false,     //是否显示父子表
    	   /* onlyInfoPagination: true, //显示总数 */
    	  /*  paginationPreText: '<<上一页', //上一页的说明文字
    	   paginationNextText: '下一页>>',//下一页的说明文字 */
    	  /*  singleSelect: true, //禁止多选行 ,下面的列头自动隐藏*/
    	   /* checkboxHeader: true, //设置false 将在列头隐藏check-all checkbox */
    	   columns: [{
    		   checkbox: true
    	   },
    	   {
               title: '姓名',
               field: 'username',
               align: 'center',
               valign: 'middle'
           }, 
           {
               title: '性别',
               field: 'gender',
               align: 'center'
           },
           {
               title: '登录号',
               field: 'id',
               align: 'center'
           },
           {
               title: '电话',
               field: 'telephone',
               align: 'center'
           },
           {
               title: '手机',
               field: 'mobile',
               align: 'center'
           },
           {
               title: '角色',
               field: 'roleids',
               align: 'center',
               formatter:function(value){  
   	            	if(value=='1'){return '园长';}
   	            	if(value=='2'){return '老师';}
   	            	if(value=='3'){return '医生';}
   	             }
           },
           {
               title: '操作',
               field: 'sid',
               align: 'center',
               formatter:function(value,row,index){  
	            var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.sid +'\',\'' + row.id +'\',\'' + row.username +'\',\'' + row.gender +'\',\'' + row.telephone +'\',\'' + row.mobile +'\',\'' + row.email +'\',\'' + row.roleids +'\')">修改</a> ';  
	           /*  var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">调离</a> ';   */
	            var i = '<input type="hidden" class="ids" value="'+ row.id + '"/>';
	            var s = '<input type="hidden" class="sid" value="'+ row.sid + '"/>';
	                 return e+i+s;  
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
    	   phone: encodeURI($("#txt_search_teacherName").val()),
    	   status:document.getElementById("check_search-status").checked==false?'Y':'N'
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
    		修改通用底层方法
    	*/
    	function editByCondition(json) {
			$.post("${pageContext.request.contextPath}/userController/editRole",json,function(data){
				/* alert(data); */
				$('#tb_departments').bootstrapTable('refresh');
			});
		}
    	
    	/*
    		设置为园长、医生、教师、以及重置密码
    	*/
    	$("#toolbar button[id^='btn-set']").on("click",function(){
    		$this = $(this);
    		var json = new Object();
    		var person = new Array();
    		if($this.attr("id").substring(8)=='principal'){json.roleids = '1';}
    		if($this.attr("id").substring(8)=='doctor'){json.roleids = '3';}
    		if($this.attr("id").substring(8)=='teacher'){json.roleids = '2';}
    		if($this.attr("id").substring(8)=='password'){json.password = '123456';}
    		$("input[data-index]:checked").each(function () {
				json.sid = $(this).parent().parent().find(".sid").val();
				person.push($(this).parent().parent().find(".ids").val());
				editByCondition(json);
			});
    		if($this.attr("id").substring(8)=='password'){
    			$("#changePassword").text('登录号为：'+person+' 的用户，重置密码为 123456 ');
    			$("#success").modal('show');
    		}
    	});
    	
    	/*
    		调离（更新状态为N）--- 不再使用
    	*/
    	/* function del(id) {
    		if(confirm("确认调离吗？")){
	    		var json = new Object();
	    		json.loginid = id;
	    		json.status = 'N';
	    		editByCondition(json);
    		}else{
  			   return;
  			}
		} */
    	
    	/*
			保存按钮（新增老师）
		*/
		$("#add-teacher").on("click",function(){
			if($("#username").val()==''){
				$("#username").focus();
				$("#usernameNote").text("请输入姓名");
				return;
			}
			if($("#mobile").val()==''){
				$("#mobile").focus();
				$("#mobileNote").text("请输入手机");
				return;
			}
			if($("#usernameNote").text()==''){
	    		/* alert($("#operation-form").serialize()); */
	    		$.post("${pageContext.request.contextPath}/userController/addTeacher",$("#operation-form").serialize(),function(data){
	    			/* alert(data); */
	    			$('#tb_departments').bootstrapTable('refresh');
	    		});
	    		
	    		$(".modal").modal('hide');
			}
		});
    	
    	/*
    		修改按钮（修改教师）
    	*/
    	$("#edit-teacher").on("click",function(){
    		if($("#username").val()==''){
				$("#username").focus();
				$("#usernameNote").text("请输入姓名");
				return;
			}
    		if($("#mobile").val()==''){
				$("#mobile").focus();
				$("#mobileNote").text("请输入手机");
				return;
			}
    		if($("#usernameNote").text()==''){
    			/* alert($("#operation-form").serialize()); */
        		$.post("${pageContext.request.contextPath}/userController/editBase",$("#operation-form").serialize(),function(data){
        			$('#tb_departments').bootstrapTable('refresh');
        		});
        		$("#addTeacher").modal('hide'); 
    		}
    	});
    	
    	
    	/*
    		新增老师信息
    	*/
    	$("#btn-add-teacher").on("click",function(){
    		$("#addTeacher").modal('show');
    		$("#del-teacher").hide();
    		$("#edit-teacher").hide();
        	$("#add-teacher").show();
        	$("#gridSystemModalLabel").text('新增信息');
    		$("#loginid").val('');
    		$("#username").val('');
    		$("#phone").val('');
    		$("#mobile").val('');
    		$("#email").val('');
    		document.getElementById('maleGender').checked=true;
    		document.getElementById('femaleGender').checked=false;
			document.getElementById('teacherRoleids').checked=true;
    		document.getElementById('doctorRoleids').checked=false;
			document.getElementById('leaderRoleids').checked=false;
    	});
    	
    	/*
    		修改教师信息
    	*/
    	function edit(sid,id,username,gender,telephone,mobile,email,roleids) {
    		delId = sid;
    		$("#addTeacher").modal('show');
    		$("#del-teacher").show();
    		$("#edit-teacher").show();
        	$("#add-teacher").hide();
        	$("#gridSystemModalLabel").text('修改信息');
			/* alert('id:'+id+',username:'+username+',gender:'+gender+',telephone:'+telephone+',mobile:'+mobile+',email:'+email); */
			$("#sid").val(sid=='undefined'?'':sid);
			$("#loginid").val(id=='undefined'?'':id);
			$("#username").val(username=='undefined'?'':username);
			$("#phone").val(telephone=='undefined'?'':telephone);
			$("#mobile").val(mobile=='undefined'?'':mobile);
			$("#email").val(email=='undefined'?'':email);
			document.getElementById('femaleGender').checked=false;
			document.getElementById('maleGender').checked=false;
			if(gender=='男'){document.getElementById('maleGender').checked=true;}
			if(gender=='女'){document.getElementById('femaleGender').checked=true;}
			document.getElementById('teacherRoleids').checked=false;
    		document.getElementById('doctorRoleids').checked=false;
			document.getElementById('leaderRoleids').checked=false;
			if(roleids=='1'){document.getElementById('leaderRoleids').checked=true;};
			if(roleids=='2'){document.getElementById('teacherRoleids').checked=true;};
			if(roleids=='3'){document.getElementById('doctorRoleids').checked=true;};
		}
    	
    	$("#username").on("keyup",function(){
    		if($("#username").val()!=''){
    			$("#usernameNote").text('');
    		}
    	});
    	$("#mobile").on("keyup",function(){
    		if($("#mobile").val()!=''){
    			$("#mobileNote").text('');
    		}
    	});
    	
    	$("#del-teacher").on("click",function(){
    		$("#confirm").modal('toggle');
    	});
    	
    	$("#confirmDel").on("click",function(){
    		var json = new Object();
    		json.sid = delId;
    		json.status = 'N';
    		editByCondition(json);
    		$("#addTeacher").modal('hide');
    		$("#confirm").modal('hide');
    	});
    	
    	
    	/* //姓名校验
    	$("#username").on("blur",function(){
			$this = $(this);
			var re = /^[\u4E00-\u9FA5]{2,4}$/;
			if(!re.test($this.val())){
				$("#"+$this.attr("id")+"Note").text("请输入一个2~4个字的姓名");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
			} 
		}); */
    	
    	/* //电话校验
    	$("#phone").on("blur",function(){
			$this = $(this);
			var re=  /(^[0-9]{3,4}\-[0-9]{8}$)|(^[0-9]{8}$)|(^[0-9]{3,4}[0-9]{8}$)|(^0{0,1}13[0-9]{9}$)/; 
			if(!re.test($this.val())){  
				$("#"+$this.attr("id")+"Note").text("请输入一个区号+座机号(010-48708312)的电话号码");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
			} 
		});
    	
    	//手机校验
    	$("#mobile").on("blur",function(){
			$this = $(this);
			var re=  /^(1\d{10})$/; 
			if(!re.test($this.val())){  
				$("#"+$this.attr("id")+"Note").text("请输入一个11位手机号码");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
			} 
		});
    	
    	//邮箱校验
    	$("#email").on("blur",function(){
			$this = $(this);
			var re=  /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; 
			if(!re.test($this.val())){  
				$("#"+$this.attr("id")+"Note").text("请输入一个正确格式的邮箱");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
			} 
		}); */
    	
    	/* $("#check_search-status").on("change",function(){
    		if(document.getElementById('check_search-status').checked){
    			$("#check_search-status-note").find("span").text("离职");
    		}else{
    			$("#check_search-status-note").find("span").text("在职");
    		}
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
      <label class="control-label col-sm-1 label-expand"  for="txt_search_nurseryName">姓名</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_nurseryName">
      </div>
      <label class="control-label col-sm-1 label-expand"  for="txt_search_teacherName">手机</label>
      <div class="col-sm-2 text-expand">
       <input type="text" class="form-control input-sm" id="txt_search_teacherName">
      </div>
      <label class="control-label col-sm-1 label-expand"  for="check_search-status"></label>
      <div class="checkbox col-sm-2">
	    <!-- <label id="check_search-status-note">
	      <input id="check_search-status" type="checkbox"><span>只显示离职人员</span>
	    </label> -->
	     <label class="">
			<input type="radio" name="check_search-status" id="onStatus" value="Y" checked>在职</label>
		 <label class="">
			<input type="radio" name="check_search-status" id="check_search-status" value="N">离职</label>
	  </div>
      <div class="col-sm-1 col-sm-offset-1">
       <button type="button" id="btn_query" onclick="search()" class="btn btn-primary btn-sm">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;搜索
		</button>
      </div>
     </div>
    </form>
   </div>
  </div>  
</div>   

<div id="toolbar" class="row" style="height:50px;padding:10px 15px;">
   <button id="btn-add-teacher" type="button" class="btn btn-primary btn-sm" style="margin-left:5px;">
    	新增老师
   </button>
   <button id="btn-set-principal" type="button" class="btn btn-primary btn-sm" style="margin-left:45px;">
  	  	设为园长
   </button>
   <button id="btn-set-doctor" type="button" class="btn btn-primary btn-sm" style="margin-left:10px;">
    	设为医生
   </button>
   <button id="btn-set-teacher" type="button" class="btn btn-primary btn-sm" style="margin-left:10px;">
    	设为老师
   </button>
   <button id="btn-set-password" type="button" class="btn btn-primary btn-sm" style="margin-left:10px;">
    	重置密码
   </button>
  
</div>

<div class="wrap2">
  <div class="panel panel-default panel-expand2">
  	<div class="panel-body panel-body-expand2">
  			<table id="tb_departments" class="table table-bordered responsive"></table>
  	</div>
  </div>
</div>
 
 
<!--弹出老师操作窗口-->
<div class="modal fade" id="addTeacher" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">添加老师</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<form id="operation-form" class="form-horizontal">
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">角色：</label>
							<div class="col-xs-8">
								<label class="" style="padding:5px 0 0 0;">
									<input type="radio" name="roleids" id="teacherRoleids" value="2" checked>老师</label>
								<label class="" style="padding:5px 0 0 10px;">
									<input type="radio" name="roleids" id="doctorRoleids" value="3">医生</label>
								<label class="" style="padding:5px 0 0 10px;">
									<input type="radio" name="roleids" id="leaderRoleids" value="1">园长</label>
							</div>
						</div>
						<div class="form-group">
							<input type="hidden" id="sid" name="sid" value="" />
							<input type="hidden" id="loginid" name="loginid" value="" />
							<label for="username" class="col-xs-3 control-label">姓名：</label>
							<div class="col-xs-8">
								<input name="username" type="text" class="form-control input-sm duiqi" id="username" placeholder="">
								<span id="usernameNote" class="tAlign" style="color: red;font-size: 12px;"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="sKnot" class="col-xs-3 control-label">性别：</label>
							<div class="col-xs-8">
								<label class=""  style="padding:5px 0 0 0;">
									<input type="radio" name="gender" id="maleGender" value="男" checked>男</label>
								<label class="" style="padding:5px 0 0 30px;">
									<input type="radio" name="gender" id="femaleGender" value="女">女</label>
							</div>
						</div>
						<div class="form-group">
							<label for="mobile" class="col-xs-3 control-label">手机：</label>
							<div class="col-xs-8">
								<input type="text" name="mobile" class="form-control input-sm duiqi" id="mobile" placeholder="">
								<span id="mobileNote" class="tAlign" style="color: red;font-size: 12px;"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-xs-3 control-label">电话：</label>
							<div class="col-xs-8">
								<input type="text" name="phone" class="form-control input-sm duiqi" id="phone" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-xs-3 control-label">email：</label>
							<div class="col-xs-8">
								<input type="text" name="email" class="form-control input-sm duiqi" id="email" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-xs-3 control-label"></label>
							<div class="col-xs-8">
								<button id="del-teacher" type="button" class="btn btn-sm btn-danger" >调&nbsp;&nbsp;&nbsp;&nbsp;离</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button id="edit-teacher" type="button" class="btn btn-sm btn-primary" >保 存</button>
				<button id="add-teacher" type="button" class="btn btn-sm btn-primary"  >保 存</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--弹出添加班级窗口-->
<div class="modal fade" id="success" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document" aria-hidden="true">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<span id="changePassword"></span>
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
				<button id="confirmDel" type="button" class="btn btn-sm btn-primary" >确定</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

</body>
</html>