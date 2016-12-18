<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import=
"org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.aj.footprint.service.DoctorInfoServicel" %>
<%@page import="com.aj.footprint.model.vo.SessionInfo" %>
<%@page import="java.util.Map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css" />
<link type="text/css" href="${pageContext.request.contextPath}/resource/bootstrapValidator/bootstrapValidator.min.css" rel="stylesheet"/>

<style type="text/css">

</style>
</head>
<% 
SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");

ApplicationContext context = WebApplicationContextUtils. getWebApplicationContext(application);
DoctorInfoServicel doctorInfoService = (DoctorInfoServicel)context.getBean("doctorInfoService");

Map<String,Object> map = doctorInfoService.findUserInfoById(sessionInfo.getLoginId());
%>

<script type="text/javascript">
 
$(function () {
    $('#ownInfoForm').bootstrapValidator({
    	message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            lastpassword: {
                message: '原密码名验证失败',
                validators: {
                    notEmpty: {
                        message: '原密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 18,
                        message: '原密码长度必须在6到18位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '原密码只能包含大写、小写、数字和下划线'
                    }
                }
            },
            email: {
                validators: {
                	stringLength: {
                        max: 40,
                        message: '邮箱最大长度不可超过40位'
                    },
                    emailAddress: {
                        message: '邮箱地址格式有误'
                    }
                }
            },
            password: {
                validators: {
                	stringLength: {
                        min: 6,
                        max: 18,
                        message: '密码长度必须在6到18位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '密码只能包含大写、小写、数字和下划线'
                    }
                }
            },
            phone: {
                validators: {
                	stringLength: {
                        min: 6,
                        max: 18,
                        message: '电话号码长度必须在5到15位之间'
                    },
                    regexp: {
                        regexp: /^[0-9_]+$/,
                        message: '电话号只能包含数字'
                    }
                }
            },
            mobile: {
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
            confirmpassword: {
                validators: {
                	 identical: {
                     	field: 'password',
                     	message: '两次输入的密码不一致'
                     	}
                }
            }
        }
    });
});
 
 function saveOrUpdate(){

//	console.log(window.parent.document.getElementById("content"));获取父页面div对象	
        $('#ownInfoForm').data('bootstrapValidator').validate();  //手动调用验证
        var flag = $('#ownInfoForm').data('bootstrapValidator').isValid();   //获取验证状态
        if(!flag){
        	return ; 
        }
      
	    $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/doctorInfoController/saveOrUpdate",
                dataType: "json",
                data:$('#ownInfoForm').serialize(),
                error: function(data){
                     alert("服务器异常，更新失败！");
                },
                success: function(data){
				   // var obj = jQuery.parseJSON(data);
				    
					if (data.success) {
						alert("更新成功！");
					}
					else{
						if(data.msg=='-1'){//密码有误
							alert("请输入正确密码");
						}
						else{
							alert("服务器异常，更新失败！");
						}
					} 
					                   
                }
          });     
 }


</script>

<body>
<div class="wrap" >
  <div class="panel panel-default">
  	<div class="panel-heading">
		<h3 class="panel-title">
			修改个人信息
		</h3>
	</div>
   	<div class="panel-body">
		<div class="content">
	        <form class="" role="form" id="ownInfoForm">
	        <input type="hidden" name="loginid" id="loginid" value="<%=map.get("id")==null?"":map.get("id") %>" />
	        	<div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="mobile" class="control-label">手机</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="text" value="<%=map.get("mobile")==null?"":map.get("mobile").toString() %>" name="mobile" id="mobile" placeholder="" class="form-control tAlign" />
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="phone" class="control-label">电话</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="text" value="<%=map.get("telephone")==null?"":map.get("telephone").toString() %>" name="phone" id="phone" placeholder="" class="form-control tAlign" />
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="inputEmail1" class="control-label">邮件</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="text" value="<%=map.get("email")==null?"":map.get("email").toString() %>"  name="email" id="email" placeholder="" class="form-control tAlign input-sm" />
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="lastpassword" class="control-label">原密码</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="password" value="" placeholder="" name="lastpassword" id="lastpassword" class="form-control tAlign" />
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="password" class="control-label" >新密码</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="password" value="" name="password" id="password" placeholder="" class="form-control tAlign" />
	                </div>
	              </div>
	            </div>
	            <div class="row">
	              <div class="col-xs-1 col-xs-offset-3">
	                <div class="form-group form-group-sm label-expand-form">
	                  <label for="confirmpassword" class="control-label">确认密码</label>
	                </div>
	              </div>
	              <div class="col-xs-4">
	                <div class="form-group form-group-sm">
	                  <input type="password" value="" placeholder="" name="confirmpassword" id="confirmpassword" class="form-control tAlign" />
	                </div>
	              </div>
	            </div>
	           
	            <div class="row row-btn">
	           		<a class="col-xs-2 col-md-offset-4 btn btn-primary" onclick="saveOrUpdate()">保存
	           		</a>
	            </div>            
	      	</form>
		</div>
	</div>
  </div>
</div> 
</body>
</html>