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
						<input type="hidden" name="ZHOUSE_ID" id="ZHOUSE_ID" value="${pd.ZHOUSE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出租房源:</td>
								<td>${pd.CZFY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名称:</td>
								<td>${pd.XQMC}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">面积:</td>
								<td>${pd.FWMJ}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户室格局:</td>
								<td>${pd.HSGJ}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">楼层:</td>
								<td>${pd.FLOOR}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋朝向:</td>
								<td>
								${pd.FWCX }
								
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">装修情况:</td>
								<td>
								${pd.ZXQK}
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">屋里物品:</td>
								<td>${pd.WLWP}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家用电器:</td>
								<td>${pd.JYDQ}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">月租金:</td>
								<td>${pd.YZJ}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付款方式:</td>
								<td>${pd.FKFS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">押金金额:</td>
								<td>${pd.YJJE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">水费示数:</td>
								<td>${pd.SFSS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电费示数:</td>
								<td>${pd.DFSS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物业归属:</td>
								<td>${pd.WYGS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供热归属:</td>
								<td>${pd.GRGS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房主姓名:</td>
								<td>${pd.FZXM}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系方式:</td>
								<td>${pd.LXFS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否委托:</td>
								<td>${pd.YNKEY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td>${pd.REMARK}></td>
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
		</script>
</body>
</html>