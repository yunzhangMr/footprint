<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/resource/js/transform.js"></script>
<script src="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<link type="text/css" href="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css" />
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.css" rel="stylesheet"/>
<title>宝宝入园登记</title>
</head>
<script type="text/javascript">

$(function(){
	
	$("#bbirth").
    datetimepicker({
        language:  'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
        startView: 2,
        minView:2,
        maxView:'decade',
        forceParse:true
        });
	
	
	    $('#registerform').bootstrapValidator({
	    	message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {	            

	        	bname: {
	                message: '姓名不能为空',
	                validators: {
	                    notEmpty: {
	                        message: '姓名不能为空'
	                    },
	                    stringLength: {
	                        min: 1,
	                        max: 10,
	                        message: '姓名长度必须在1到10位之间'
	                    }
	                }
	            },
	            namespell: {
	                message: '姓名拼音不能为空',
	                validators: {
	                    notEmpty: {
	                        message: '姓名拼音不能为空'
	                    },
	                    stringLength: {
	                        min: 1,
	                        max: 30,
	                        message: '姓名拼音必须在1到30位之间'
	                    }
	                }
	            },
	            phone: {
	                validators: {
	                	stringLength: {
	                        min: 11,
	                        max: 11,
	                        message: '手机号长度必须是11位'
	                    },
	                    regexp: {
	                        regexp: /^[1][0-9]{10}$/,
	                        message: '手机号只能以1开头的数字'
	                    }
	                }
	            },
	            bbirth: {
	                validators: {
	                	notEmpty: {
	                        message: '出生日期不能为空'
	                    },
	                }
	            }
	        }
	    });
	
});

//获得宝宝拼音
function changeToSpell(){
	
	var bname = $('#bname').val();
	var bnamespell = ConvertPinyin(bname);
	if(bname==''){
		$('#namespell').val("");
		return ;
	}
	//TODO 校验 
	$.ajax({
		type : 'POST',
        datatype : 'JSON',
        url :  '${pageContext.request.contextPath}/teacherRegisterController/checkNameSpell',
        data : {"bnamespell":bnamespell},
		 success : function(data) {
			var obj = jQuery.parseJSON(data);
	         $('#namespell').val(obj);				  
		 },
        error:function(data){
       	 alert("验证失败");   
        }
		
	});
	
}

//TODO修改姓名拼音校验


function dosave(){

	var isused = $('#isused').text();
	if(isused=='不可用'){
		return ;
	}
	$('#registerform').data('bootstrapValidator').validate();  //手动调用验证
    var flag = $('#registerform').data('bootstrapValidator').isValid();   //获取验证状态
    if(!flag){
    	return ; 
    }
    
	$.ajax({
		type : 'POST',
        datatype : 'JSON',
        url :  '${pageContext.request.contextPath}/teacherRegisterController/doSaveBaby',
        data : $("#registerform").serialize(),
		 success : function(data) {
			var obj = jQuery.parseJSON(data);
	        if(obj=='success'){
	        	$('#bname').val("");
	        	$('#namespell').val("");
	        	$('#phone').val("");
	        	$('#bbirth').val("");
	        	alert("保存成功！");
	        }
	        else if(obj=='fail'){
	        	alert("已经存在该用户,保存失败！");
	        }else{
	        	alert("保存失败！");
	        }
		 },
        error:function(data){
       	 alert("保存失败");   
        }
	});
}

function checknamespellchange(){
	
	var namespell = $('#namespell').val();
	if(namespell==''){
		return;
	}
	$.ajax({
		type : 'POST',
        datatype : 'JSON',
        url :  '${pageContext.request.contextPath}/teacherRegisterController/checkSpell',
        data : {"namespell":namespell},
		 success : function(data) {
			 var obj = jQuery.parseJSON(data);
			 if(obj){			 
			     $('#isused').text("可用");
			 }else{
			     $('#isused').text("不可用");
			 }
		 },
        error:function(data){
       	 alert("验证失败");   
        }
		
	});
}

</script>

<body>

<div class="wrap">
  <div class="panel panel-default panel-expand1">
  <div class="panel-heading">
		<h3 class="panel-title">
			宝宝入园登记
		</h3>
	</div>
   <div class="panel-body panel-body-expand1 container">
    <form id="registerform" class="form-horizontal" role="form">
     <div class="row">   
      <label class="control-label col-sm-2 label-expand"  for="bname">宝宝姓名</label>
      <div class="col-sm-3 text-expand">
       <input type="text" class="form-control input-sm" value="" onchange="changeToSpell()" id="bname" name="bname">
      </div>
      
    <label class="control-label col-sm-2 label-expand "  for="bbirth">出生日期</label>
      <div class="col-sm-3 text-expand">
       <input type="text" class="form-control input-sm form_datetime_2" readOnly="true"  id="bbirth" name="bbirth">
      </div> 
	 </div>
	 
	 <div class="row" style="padding-top:10px;">   
       
      <label class="control-label col-sm-2 label-expand "  for="namespell">姓名拼音</label>
      <div class="col-sm-3 text-expand">
       <input type="text" class="form-control input-sm " onBlur="checknamespellchange()" id="namespell" name="namespell">
       <span id="isused" style="color:red;"></span>
      </div>  
        <label class="control-label col-sm-2 label-expand"  for="phone">电话号码</label>
      <div class="col-sm-3 text-expand">
       <input type="text" class="form-control input-sm" id="phone" name="phone">
      </div>
    
        
	 </div>
	 
	 <div class="row" style="padding-top:10px;">   
	 
	  <label class="control-label col-sm-2 label-expand"></label>
      <div class="col-sm-3 text-expand "><span style="color:red;">保存时根据宝宝名字的汉语拼音自动生成家长登陆号，初始密码为123456</span>
      </div>	
	  <label class="control-label col-sm-2 label-expand"  for="gender">性别</label>
      <div class="col-sm-3 text-expand"  style="padding-top:5px;">
	      <input id="bsex1" name="gender"  value="男" type="radio"><span>男</span>&nbsp;&nbsp;
	      <input id="bsex2" name="gender"  value="女" type="radio"><span>女</span>
      </div>
      	
     	 
       <a class="col-sm-2  btn btn-primary" style="width:150px;" onclick="dosave()">保存</a>
      
	 </div>
	   
     </div>
    </form>
   
   </div>
  </div>  
</body>
</html>