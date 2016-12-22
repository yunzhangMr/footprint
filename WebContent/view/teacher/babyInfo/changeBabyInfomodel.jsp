<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />

<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.css" rel="stylesheet"/>

</head>
<script type="text/javascript">

$(document).ready(function() {

	$("#birthday").
    datetimepicker({
        language:  'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
        startView: '2',
        minView:'2',
        maxView:'decade',
        forceParse:true
        });
	
	 $("#edit-babyInfo").click(function(){

		 $('#babyInfoform').data('bootstrapValidator').validate();  //手动调用验证
	        var flag = $('#babyInfoform').data('bootstrapValidator').isValid();   //获取验证状态
	        if(!flag){
	        	return ; 
	        }
	      
		 $.ajax({ 
	         type : "POST",
	         url :  '${pageContext.request.contextPath}/teacherChangeBabyInfoController/doSaveBabyInfo',
	         data :  $("#babyInfoform").serialize(),//序列化表单提交input 值
			 success : function(data) {
				 $("#editBabyInfo").modal('hide');   
				 $('#tb_departments').bootstrapTable('refresh');
			 },
	         error:function(data){
	        	 alert("请求出错");   
	         }
		
		});
		 	 
	  });
	 
});


$(function () {
	
	//
	$("#animalsign").val('${animalsign}');
	$("#gender").val('${gender}');
	
	//数据校验
    $('#babyInfoform').bootstrapValidator({
    	message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            bname: {
                message: '原密码名验证失败',
                validators: {
                    notEmpty: {
                        message: '宝宝姓名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 10,
                        message: '原密码长度必须在2到10位之间'
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
            birthday: {
                validators: {
                	notEmpty: {
                        message: '宝宝生日不能为空'
                    }
                }
            },
            parentname: {
                message: '家长姓名验证失败',
                validators: {
                    notEmpty: {
                        message: '家长姓名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 10,
                        message: '家长姓名长度必须在2到10位之间'
                    }
                }
            },
            parent_name: {
                message: '宝宝乳名验证失败',
                validators: {
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: '宝宝乳名长度必须在1到10位之间'
                    }
                }
            },
            nurture: {
                message: '抚养验证失败',
                validators: {
                    stringLength: {
                        min: 0,
                        max: 250,
                        message: '抚养方式不能超过250字'
                    }
                }
            }
        }
    });
});

function genderOranimalsign(){
	
	
}
</script>
<style>
.row{padding-top:10px;padding-bottom:10px;}
.lb{text-align:right; }
</style>
<body>
<div class="modal-dialog"   role="document" aria-hidden="true" style="width:50%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">修改宝宝信息</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">				
				<div class="wrap1">
				<form id="babyInfoform">
				 <div class="panel panel-default panel-expand1">
				 
				    <input  type="hidden" value="${parentid }" name="parent_id" id="parent_id" />
				    <input  type="hidden" value="${id }" name="id" id="id" />		

				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="bname">宝宝姓名：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text" class="form-control input-sm" id="bname" value="${bname }" name="bname"/>
				      </div>			    
				    </div>
				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="nickname">宝宝乳名：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text" class="form-control input-sm" id="nickname" value="${nickname }" name="nickname"/>
				      </div>			    
				    </div>
				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  >宝宝性别：</label>
				     <div class="col-sm-6 text-expand">
				        <%-- <input type="text" class="form-control input-sm" id="gender" value="${gender }" name="gender"/> --%>
				        <select style="width:90px;height:30px;" id="gender" name="gender" class=" show-tick form-control">
				         <option value="男">男</option>
				         <option value="女">女</option>
				         </select>
				      </div>			    
				    </div>
				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="birth">出生日期：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text"  class="form-control input-sm" readOnly="true"  id="birthday" value="${birth }" name="birthday"/>
				      </div>			    
				    </div>
				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="phone">手机号码：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text"  class="form-control input-sm" id="phone" value="${telephone }" name="phone"/>
				      </div>			    
				    </div>
				    <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  >宝宝属相：</label>
				     <div class="col-sm-6 text-expand">
				        <select style="width:90px;height:30px;" id="animalsign" name ="animalsign" class=" show-tick form-control">
				         <option value="">请选择</option> 
				         <option value="鼠">鼠</option>
				         <option value="牛">牛</option>
				         <option value="虎">虎</option>
				         <option value="兔">兔</option>
				         <option value="龙">龙</option>
				         <option value="蛇">蛇</option>
				         <option value="马">马</option>
				         <option value="羊">羊</option>
				         <option value="猴">猴</option>
				         <option value="鸡">鸡</option>
				         <option value="狗">狗</option>
				         <option value="猪">猪</option>
				        </select>
				      </div>			    
				    </div>
				     <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="parent_name">家长姓名：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text" class="form-control input-sm" id="parent_name" value="${parentname }" name="parent_name"/>
				      </div>			    
				    </div>
				     <div class="row"> 
				    <label class="control-label col-sm-4 label-expand lb"  for="nurture">抚养方式：</label>
				     <div class="col-sm-6 text-expand">
				        <input type="text" class="form-control input-sm" id="nurture" value="${nurture }" name="nurture"/>
				      </div>			    
				    </div>
				    
				    
				</div>			   
				</form>
				</div>						
				</div>
			</div>
			<div class="modal-footer">
				<button id="edit-babyInfo" type="button" class="btn btn-sm btn-primary"  >保 存</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</body>