<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" />
<%-- <script src="${pageContext.request.contextPath}/resource/datetimepicker/bootstrap-datetimepicker.js"></script> --%>

</head>
<script type="text/javascript">
$(document).ready(function() {
	 //控制文本框是否可编辑
	 var action = $('#action').val();
	 if(action=='btn-look-evaluate'){
		 $('#height').attr('readonly',true);
		 $('#weight').attr('readonly',true);
		 $('#HB').attr('readonly',true);
		 $('#allcaries').attr('readonly',true);
		 $('#newcaries').attr('readonly',true);
		 $('#lefteyesight').attr('readonly',true);
		 $('#righteyesight').attr('readonly',true);
		 $('#mark').attr('readonly',true);
	 }
	 
	 $("#edit-evaluate").click(function(){

		 $.ajax({ 
	         type : "POST",
	         url :  '${pageContext.request.contextPath}/doctorEvaluateController/doSaveEvaluate',
	         data :  $("#evaluateform").serialize(),//序列化表单提交input 值
			 success : function(data) {
				 $('#tb_departments').bootstrapTable('refresh');
			 },
	         error:function(data){
	        	 alert("请求出错");   
	         }
		
		});
		 
		 
	  });
	 
		//先选出 textarea 和 统计字数 dom 节点
        var wordCount = $("#wordCount"),
           textArea = wordCount.find("textarea"),
           word = wordCount.find(".word");
        //调用
        statInputNum(textArea,word);
	 
 });
 
 //字数验证
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
<style>
.row{padding-top:10px;}
.wordCount{ position:relative;width: 100%; }
.wordCount textarea{ width: 100%; height: 100px;}
.wordCount .wordwrap{ position:absolute; right: 6px; bottom: 6px;}
.wordCount .word{ color: red; padding: 0 4px;;}
.lb{text-align:right; }
.lab{text-align:right;}
</style>
<body>
<div class="modal-dialog"  role="document" aria-hidden="true" style="width:62%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">宝宝评价</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
				<div class="wrap1">
				 <div class="panel panel-default panel-expand1">
				  <div class="row">   
				     <label class="lab control-label col-sm-2 label-expand" >宝宝姓名：</label>
				     <label class="control-label col-sm-2 label-expand" >${bname }</label>
				     <label class="lab control-label col-sm-2 label-expand" >宝宝性别：</label>
				     <label class="control-label col-sm-2 label-expand" >${gender }</label>				     
				     <label class="lab control-label col-sm-2 label-expand" >所属学年：</label>
				     <label class="control-label col-sm-2 label-expand" >${createyear }</label>
				   </div>
				   <div class="row">  
				      <label class="lab control-label col-sm-2 label-expand" >所属学期：</label>
				     <label class="control-label col-sm-2 label-expand" >${term }</label> 
				     <label class="lab control-label col-sm-2 label-expand" >所在年级：</label>
				     <label class="control-label col-sm-2 label-expand" >${grade }</label>
				     <label class="lab control-label col-sm-2 label-expand" >所在班级：</label>
				     <label class="control-label col-sm-2 label-expand" >${cname }</label>				     
				   </div>

				</div>			   
				</div>
				<div class="wrap2">
				 <form id="evaluateform" >
				 <div class="panel panel-default panel-expand2">
				 
				   <input type="hidden" id="id" name="id" value="${map.id}">
				   <input type="hidden" id="baby_id" name="baby_id" value="${id}">
				   <input type="hidden" id="baby_name" name="baby_name" value="${bname}">
				   <input type="hidden" id="gender" name="gender" value="${gender}">
				   <input type="hidden" id="createyear" name="createyear" value="${createyear}">
				   <input type="hidden" id="term" name="term" value="${term}">
				   <input type="hidden" id="grade" name="grade" value="${grade}">
				   <input type="hidden" id="class_id" name="class_id" value="${classid}">
				   <input type="hidden" id="cname" name="cname" value="${cname}">
				   <input type="hidden" id="action" name="action" value="${action}">
				   
				  <div class="row"> 
				     <label class="control-label col-sm-2 label-expand lb"  for="height">身高（厘米）：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="height" value="${map.height }" name="height"/>
				      </div>
				      <label class="control-label col-sm-2 label-expand lb"  for="weight">体重（千克）：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="weight" value="${map.weight }" name="weight"/>
				      </div>
				 </div>
				 
				  <div class="row"> 
				     <label class="control-label col-sm-2 label-expand lb"  for="HB">血红素（克）：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="HB" value="${map.HB }" name="HB"/>
				      </div>
				  </div>
				 
				 <div class="row"> 
				     <label class="control-label col-sm-2 label-expand lb"  for="allcaries">共有龋齿颗数：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="allcaries" value="${map.allcaries }" name="allcaries"/>
				      </div>				      
				      <label class="control-label col-sm-2 label-expand lb"  for="newcaries">本学期新增龋齿颗数：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="newcaries" name="newcaries" value="${map.newcaries }" />
				      </div>
				  </div>
				  
				  <div class="row"> 
				     <label class="control-label col-sm-2 label-expand lb"  for="lefteyesight">左眼视力：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="lefteyesight" name="lefteyesight" value="${map.lefteyesight }" />
				      </div>				      
				      <label class="control-label col-sm-2 label-expand lb"  for="righteyesight">右眼视力：</label>
				     <div class="col-sm-4 text-expand">
				        <input type="text" maxlength="10" class="form-control input-sm" id="righteyesight" name="righteyesight" value="${map.righteyesight }" />
				      </div>
				  </div>
				  
				   <div class="row" style="padding-bottom:10px;"> 
				     <label class="control-label col-sm-2 label-expand lb"  for="mark">备注：</label>
				     <div class="col-sm-8 text-expand ">
				      <div class="wordCount" id="wordCount">
						    <textarea rows=5 placeholder="textarea还剩余字数统计" class="form-control input-sm" id="mark"  name="mark">${map.mark }</textarea>
						    <span class="wordwrap"><var class="word">200</var>/200</span>
					   </div>
					   <span id="clock"></span>
				     </div>				      	 
				  </div>
				 
				 </div>
				</div>
			    </div>	
			    <div class="wrap3">	
			      <div class="panel panel-default panel-expand3">
			        <label class="control-label label-expand"  >
			        <span style="color:red;">
                                                                     此表的数据应由保健医生填写<br/>
                                                                    如有需向家长特别说明的情况，请写在备注栏</span>
                    </label>

			    </div>			
				</form>
				</div>
			</div>
			<div class="modal-footer">
				<button id="edit-evaluate" type="button" class="btn btn-sm btn-primary" data-dismiss="modal" >保 存</button>
				<button type="button" class="btn btn-sm btn-link" data-dismiss="modal">关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</body>