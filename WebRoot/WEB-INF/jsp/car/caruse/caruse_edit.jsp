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
					
					<form action="caruse/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CARUSE_ID" id="CARUSE_ID" value="${pd.CARUSE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">车牌号:</td>
								<td><input type="text" name="CARNUMBER" id="CARNUMBER" value="${pd.CARNUMBER}" maxlength="10" placeholder="这里输入车牌号" title="车牌号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公里数:</td>
								<td><input type="number" name="KILOMETRE" id="KILOMETRE" value="${pd.KILOMETRE}" maxlength="32" placeholder="这里输入公里数" title="公里数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">使用日期:</td>
								<td><input class="span10 date-picker" name="USEDATE" id="USEDATE" value="${pd.USEDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="使用日期" title="使用日期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">使用时长:</td>
								<td><input type="text" name="USETIME" id="USETIME" value="${pd.USETIME}" maxlength="20" placeholder="这里输入使用时长" title="使用时长" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">目的地:</td>
								<td><input type="text" name="DESTINATION" id="DESTINATION" value="${pd.DESTINATION}" maxlength="255" placeholder="这里输入目的地" title="目的地" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">使用人:</td>
								<td><input type="text" name="USER" id="USER" value="${pd.USER}" maxlength="50" placeholder="这里输入使用人" title="使用人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作人:</td>
								<td><input type="text" name="CZR" id="CZR" value="${pd.CZR}" maxlength="32" placeholder="这里输入操作人" title="操作人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作时间:</td>
								<td><input class="span10 date-picker" name="CZSJ" id="CZSJ" value="${pd.CZSJ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="操作时间" title="操作时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
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
			if($("#CARNUMBER").val()==""){
				$("#CARNUMBER").tips({
					side:3,
		            msg:'请输入车牌号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARNUMBER").focus();
			return false;
			}
			if($("#KILOMETRE").val()==""){
				$("#KILOMETRE").tips({
					side:3,
		            msg:'请输入公里数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KILOMETRE").focus();
			return false;
			}
			if($("#USEDATE").val()==""){
				$("#USEDATE").tips({
					side:3,
		            msg:'请输入使用日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USEDATE").focus();
			return false;
			}
			if($("#USETIME").val()==""){
				$("#USETIME").tips({
					side:3,
		            msg:'请输入使用时长',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USETIME").focus();
			return false;
			}
			if($("#DESTINATION").val()==""){
				$("#DESTINATION").tips({
					side:3,
		            msg:'请输入目的地',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESTINATION").focus();
			return false;
			}
			if($("#USER").val()==""){
				$("#USER").tips({
					side:3,
		            msg:'请输入使用人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#CZR").val()==""){
				$("#CZR").tips({
					side:3,
		            msg:'请输入操作人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CZR").focus();
			return false;
			}
			if($("#CZSJ").val()==""){
				$("#CZSJ").tips({
					side:3,
		            msg:'请输入操作时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CZSJ").focus();
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