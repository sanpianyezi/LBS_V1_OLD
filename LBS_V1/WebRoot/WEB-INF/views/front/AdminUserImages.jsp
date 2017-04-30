<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title>用户详细信息管理 - Powered By JeeSite</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://jeesite.com/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<script src="<%=request.getContextPath() %>/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/static/bootstrap/2.3.1/css_cerulean/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/static/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
<!--[if lte IE 7]><link href="<%=request.getContextPath() %>/static/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="<%=request.getContextPath() %>/static/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
<link href="<%=request.getContextPath() %>/static/jquery-select2/3.5.4/select2.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/jquery-select2/3.5.4/select2.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/static/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/static/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/common/mustache.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/static/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
<script src="<%=request.getContextPath() %>/static/bootstrap-table/bootstrap-table.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<link href="<%=request.getContextPath() %>/static/common/jeesite.min.css" type="text/css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/static/common/jeesite.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/static/jquery/jquery-form.js" type="text/javascript"></script>
<script type="text/javascript">var ctx = '<%=request.getContextPath() %>/a', ctxStatic='<%=request.getContextPath() %>/static';</script>		
	<!-- Baidu tongji analytics --><script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
	
	
	<meta name="decorator" content="default"/>
	<link href="<%=request.getContextPath() %>/static/fileinput/css/fileinput.css" media="all" type="text/css" rel="stylesheet" />
	<script src="<%=request.getContextPath() %>/static/fileinput/js/fileinput.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/static/fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	function loadCheck() {
		
		var marriageStatus = $('#marriageStatus').val();
        if (null != marriageStatus && "" != marriageStatus && "2" == marriageStatus) {//已婚
        	$('#marriedType').attr("disabled",false);
        }
        
		/* var gynecopathyListArrChk = $("input[name='gynecopathyList']:checked");
    	var gynecopathyListIndex = 0;
        $(gynecopathyListArrChk).each(function(){
           	if (this.value == "20") {
           		gynecopathyListIndex = 1;
           	}
       });
        if (gynecopathyListIndex == 1) {//妇科疾病-其他
       		$('#gynecopathyOther').attr("disabled",false);
       	}
        
        var familyMedicalHistoryListArrChk = $("input[name='familyMedicalHistoryList']:checked");
    	var familyMedicalHistoryListIndex = 0;
        $(familyMedicalHistoryListArrChk).each(function(){
           	if (this.value == "26") {
           		familyMedicalHistoryListIndex = 1;
           	}
       });
        if (familyMedicalHistoryListIndex == 1) {//家族病史-其他
       		$('#familyMedicalHistoryOther').attr("disabled",false);
       	} */
	}
		$(document).ready(function() {
			//$("#name").focus();
			loadCheck();
			$("#inputForm").validate({
				submitHandler:function(form){
					$('#btnSubmit').attr({"disabled":"disabled"});
					//$("#marriedType").removeAttr("disabled"); //去除disabled
					//$("#gynecopathyOther").removeAttr("disabled"); 
					//$("#familyMedicalHistoryOther").removeAttr("disabled"); 
					loading('正在提交，请稍等...');
					$(form).ajaxSubmit(function(data){
				    	closeTip();
				    	if(data.success){
				    		$.jBox.prompt('上传成功！', '提示', 'success', { closed: function () {
				    				$('#btnSubmit', window.parent.document).click();
				    				window.parent.window.jBox.close();
								} 
				    		});
				    	}else{
				    		alertx(data.message);
				    		$("#btnSubmit").removeAttr("disabled");
				    	}
				    }); 
			    },
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
			
		
			
			
			
			
			$("#btnCancel").click(function(){
				window.parent.window.jBox.close();
			});
			$("#_newsImage").fileinput({
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary btn-lg",
				'allowedFileExtensions' : ['jpg', 'png'],
		        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
			});
		});
		
		$(function(){
            $('#marriageStatus').change(function(e){
            	var marriageStatus = $('#marriageStatus').val();
                if (null != marriageStatus && "" != marriageStatus && "2" == marriageStatus) {//已婚
                	$('#marriedType').attr("disabled",false);
                } else {
                	//$('#marriedType').empty();
                	///$("#marriedType").get(0).selectedIndex=0;
                	$("#marriedType").val("");
                	$("#s2id_marriedType").find(".select2-chosen").html("");
                	$('#marriedType').attr("disabled",true);
                }
            })
        });
		
		/* $(function(){
            $("[name='gynecopathyList']").change(function(e){
            	var arrChk = $("input[name='gynecopathyList']:checked");
            	var index = 0;
                $(arrChk).each(function(){
                   	if (this.value == "20") {
                   		index = 1;
                   	}
               });
                if (index == 1) {//妇科疾病-其他
               		$('#gynecopathyOther').attr("disabled",false);
               	} else {
                   	$("#gynecopathyOther").val("");
                   	$('#gynecopathyOther').attr("disabled",true);
               }
            })
        });
		
		$(function(){
            $("[name='familyMedicalHistoryList']").change(function(e){
            	var arrChk = $("input[name='familyMedicalHistoryList']:checked");
            	var index = 0;
                $(arrChk).each(function(){
                   	if (this.value == "26") {
                   		index = 1;
                   	}
               });
                if (index == 1) {//家族病史-其他
               		$('#familyMedicalHistoryOther').attr("disabled",false);
               	} else {
                   	$("#familyMedicalHistoryOther").val("");
                   	$('#familyMedicalHistoryOther').attr("disabled",true);
               }
            })
        }); */
		
	</script>

</head>
<body>
<div class="form-actions">
	<h4 color="green">用户头像配置:</h4>
	</div>
	<form id="inputForm" class="form-horizontal" action="<%=request.getContextPath() %>/front/uploadImages" method="post" enctype="multipart/form-data" novalidate="novalidate">


<script type="text/javascript">top.$.jBox.closeTip();</script>
		
		
		
				<input id="userId" name="userId" class="input-xlarge " type="hidden" value="${userInfo.id}" maxlength="100">
		<div class="control-group">
			<label class="control-label">头像图：</label>
			<div class="controls">
				<img src='<%=request.getContextPath() %>/images/upload/${userInfo.imagePath}' onerror="javascript:this.src='<%=request.getContextPath() %>/images/11.png';" width='100' height='100'/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上传图片：</label>
			<div class="controls">
				<input id="userPhoto" name="userPhoto" class="input-xlarge " type="file" accept="image/jpeg ,image/png" value="">
			</div>
		</div>
		
		
		 <div class="control-group">
			<label class="control-label">&nbsp;</label>
			<div class="controls">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存">&nbsp;
			</div>
		</div>
		
	</form>
	
	
	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){
				top.$.jBox('get:<%=request.getContextPath() %>/a/sys/menu/treeselect;JSESSIONID=18b23410a80b4158bb737ded9d52f64f', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("<%=request.getContextPath() %>/a/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		}//-->
	</script>

</body>
</html>