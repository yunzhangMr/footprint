<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
<div class="wrap" >
  <div class="panel panel-default">
  	<div class="panel-heading">
		<h3 class="panel-title">
			创建班级
		</h3>
	</div>
   	<div class="panel-body">
	<div class="content">
        <form class="" role="form">
           <div class="row" >
              <div class="col-xs-1 col-xs-offset-2">
                <div class="form-group form-group-sm">
                  <label for="createYear" class="control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group">
                 	<label for="inputEmail1" class="form-control tAlign">${sessionScope.sessionInfo.createyear }-${sessionScope.sessionInfo.createyear+1 }</label>
                </div>
                
              </div>
             </div>
             
            <div class="row" >
              <div class="col-xs-1 col-xs-offset-2">
                <div class="form-group form-group-sm">
                  <label for="" class="control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group">
                 	<label for="inputEmail1" class="form-control tAlign">${sessionScope.sessionInfo.term}</label>
                </div>
              </div>
            </div>
           
            <div class="row">
              <div class="col-xs-1 col-xs-offset-2">
                <div class="form-group form-group-sm">
                  <label for="inputEmail1" class="control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <!-- <input name="" type="text" value="大" placeholder="大" class="form-control tAlign" /> -->
                  <label for="inputEmail1" class="form-control tAlign">大</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <!-- <input name="" type="text" value="中" placeholder="中" class="form-control tAlign" /> -->
                  <label for="inputEmail1" class="form-control tAlign">中</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                <!--   <input name="" type="text" value="小" placeholder="小" class="form-control tAlign" /> -->
                  <label for="inputEmail1" class="form-control tAlign">小</label>
                </div>
              </div>
            </div>
            
            <div class="row">
             <div class="col-xs-1 col-xs-offset-2">
              <div class="form-group form-group-sm">
                <label for="inputEmail1" class="control-label">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数</label>
              </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <input id="seniorClassNum" name="seniorClassNum"  type="text" value="" placeholder="" class="form-control tAlign" />
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <input id="middleClassNum" name="middleClassNum" type="text" value="" placeholder="" class="form-control tAlign" />
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <input id="primaryClassNum" name="primaryClassNum" type="text" value="" placeholder="" class="form-control tAlign" />
                </div>
              </div>
            </div>
            
            
            <div id="note-row" class="row">
             <div class="col-xs-1 col-xs-offset-2">
              </div>
              <div class="col-xs-2">
                	<span id="seniorClassNumNote" class="tAlign" style="color: red;font-size: 12px;"></span>
              </div>
              <div class="col-xs-2">
                	<span id="middleClassNumNote" class="tAlign" style="color: red;font-size: 12px;"></span>
              </div>
              <div class="col-xs-2">
                	<span id="primaryClassNumNote"  class="tAlign" style="color: red;font-size: 12px;"></span>
              </div>
            </div>
            
            
            
           <div class="row">
              <div class="col-xs-1 col-xs-offset-2">
                <div class="form-group form-group-sm">
                  <label for="inputEmail1" class="control-label">名称格式</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <!-- <input type="text" value="" placeholder="大（1）班" class="form-control tAlign" /> -->
                  <label for="inputEmail1" class="form-control tAlign">大（1）班</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm">
                  <!-- <input type="text" value="" placeholder="中（1）班" class="form-control tAlign" /> -->
                   <label for="inputEmail1" class="form-control tAlign">中（1）班</label>
                </div>
              </div>
              <div class="col-xs-2">
                <div class="form-group form-group-sm ">
                  <!-- <input type="text" value="" placeholder="小（1）班" class="form-control tAlign" /> -->
                   <label for="inputEmail1" class="form-control tAlign">小（1）班</label>
                </div>
              </div>
            </div>
            
            <div class="row row-btn">
           		<button id="submit" type="button" class="col-xs-2 col-md-offset-3 btn btn-primary">创建
           		</button>
            </div>
            
           <!--  <div style="text-align:center;">
                <a href="#fakelink" class="btn btn-primary">创建</a>
            </div> -->

      	</form>
      </div> <!-- /row -->
	</div>
  </div>
</div> 

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
					<span>创建班级成功！</span>
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

<script type="text/javascript">
	$(function () {
		
		//表单提交
		$("#submit").on("click",function(){
			if($("#primaryClassNum").val()==''||$("#primaryClassNumNote").text()!=''){
				$("#primaryClassNum").focus();
				$("#primaryClassNumNote").text("请输入一个1~99的数字");
			}
			if($("#middleClassNum").val()==''||$("#middleClassNumNote").text()!=''){
				$("#middleClassNum").focus();
				$("#middleClassNumNote").text("请输入一个1~99的数字");
			}
			if($("#seniorClassNum").val()==''||$("#seniorClassNumNote").text()!=''){
				$("#seniorClassNum").focus();
				$("#seniorClassNumNote").text("请输入一个1~99的数字");
			}
			if(($("#seniorClassNumNote").text()=='')&&($("#middleClassNumNote").text()=='')&&($("#primaryClassNumNote").text()=='')){
				$.post("${pageContext.request.contextPath}/classController/classCreate",$("form").serialize(),function(data){
					/* alert("创建班级成功"); */
					$("#success").modal('show');
				});
			}
			
		});
		
		/* $("[id$='ClassNum']").on("blur",function(){
			$this = $(this);
			if($this.val()===''||isNaN($this.val())||Number($this.val())<=0||Number($this.val())>100){
				$("#"+$this.attr("id")+"Note").text("请输入一个1~99的数字");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
				$this.val(parseInt($this.val()));
			} 
		}); */
		
		/* onkeyup='this.value=this.value.replace(/\D/gi,"")' */
		
		$("[id$='ClassNum']").on("keyup",function(){
			$this = $(this);
			$this.val($this.val().replace(/\D/gi,""));
			if($this.val()==0||$this.val()>99){
				/* $this.val($this.val().replace(/\D/gi,"")); */
				$("#"+$this.attr("id")+"Note").text("请输入一个1~99的数字");
			}else{
				$("#"+$this.attr("id")+"Note").text('');
				$this.val(parseInt($this.val()));
			}
		});
		
		
	});
</script>
</body>
</html>