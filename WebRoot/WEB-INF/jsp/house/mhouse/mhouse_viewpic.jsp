<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="zhouse/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ZHOUSE_ID" id="ZHOUSE_ID" value="${pd.MHOUSE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
						
							
						<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋坐落:</td>
								<td>${pd.FWZL}</td>
							</tr>
							
							
							
								<c:forEach items="${pathList}" var="var" varStatus="vs">
									<tr>
									<td style="width:50px;text-align: right;padding-top: 13px;">图片:</td>
									<td> 
											<a href="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" target="_blank"><img src="<%=basePath%>uploadFiles/uploadImgs/${var.PATH}" width="210"/></a>
											
									</td>
								</tr>
								
								</c:forEach>
							
							
							
							
							
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TFQZH").val()==""){
				$("#TFQZH").tips({
					side:3,
		            msg:'请输入图符丘幢号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TFQZH").focus();
			return false;
			}
			if($("#XQMC").val()==""){
				$("#XQMC").tips({
					side:3,
		            msg:'请输入小区名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#XQMC").focus();
			return false;
			}
			if($("#FWZL").val()==""){
				$("#FWZL").tips({
					side:3,
		            msg:'请输入房屋坐落',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FWZL").focus();
			return false;
			}
			if($("#SZCS").val()==""){
				$("#SZCS").tips({
					side:3,
		            msg:'请输入所在层数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SZCS").focus();
			return false;
			}
			if($("#ZCS").val()==""){
				$("#ZCS").tips({
					side:3,
		            msg:'请输入总层数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ZCS").focus();
			return false;
			}
			if($("#FWCX").val()==""){
				$("#FWCX").tips({
					side:3,
		            msg:'请输入房屋朝向',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FWCX").focus();
			return false;
			}
			if($("#JZMJ").val()==""){
				$("#JZMJ").tips({
					side:3,
		            msg:'请输入建筑面积',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JZMJ").focus();
			return false;
			}
			if($("#JCNF").val()==""){
				$("#JCNF").tips({
					side:3,
		            msg:'请输入建成年份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JCNF").focus();
			return false;
			}
			if($("#FYHS").val()==""){
				$("#FYHS").tips({
					side:3,
		            msg:'请输入房源户式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FYHS").focus();
			return false;
			}
			if($("#CQLB").val()==""){
				$("#CQLB").tips({
					side:3,
		            msg:'请输入产权类别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CQLB").focus();
			return false;
			}
			if($("#QZNX").val()==""){
				$("#QZNX").tips({
					side:3,
		            msg:'请输入权证年限',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QZNX").focus();
			return false;
			}
			if($("#ISONLYONE").val()==""){
				$("#ISONLYONE").tips({
					side:3,
		            msg:'请输入是否为手套',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISONLYONE").focus();
			return false;
			}
			if($("#ZXCD").val()==""){
				$("#ZXCD").tips({
					side:3,
		            msg:'请输入装修程度',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ZXCD").focus();
			return false;
			}
			if($("#WYGS").val()==""){
				$("#WYGS").tips({
					side:3,
		            msg:'请输入物业公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WYGS").focus();
			return false;
			}
			if($("#YNKEY").val()==""){
				$("#YNKEY").tips({
					side:3,
		            msg:'请输入是否钥匙委托',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YNKEY").focus();
			return false;
			}
			if($("#TEL").val()==""){
				$("#TEL").tips({
					side:3,
		            msg:'请输入房主电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEL").focus();
			return false;
			}
			if($("#CQR").val()==""){
				$("#CQR").tips({
					side:3,
		            msg:'请输入产权人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CQR").focus();
			return false;
			}
			if($("#FWLY").val()==""){
				$("#FWLY").tips({
					side:3,
		            msg:'请输入房屋来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FWLY").focus();
			return false;
			}
			if($("#FYLB").val()==""){
				$("#FYLB").tips({
					side:3,
		            msg:'请输入房源类别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FYLB").focus();
			return false;
			}
			if($("#FYBH").val()==""){
				$("#FYBH").tips({
					side:3,
		            msg:'请输入房源保护',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FYBH").focus();
			return false;
			}
			if($("#BZ").val()==""){
				$("#BZ").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BZ").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>