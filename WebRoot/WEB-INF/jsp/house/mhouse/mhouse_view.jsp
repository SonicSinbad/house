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
								<td style="width:100px;text-align: right;padding-top: 13px;">图符丘幢号:</td>
								<td>${pd.TFQZH}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名称:</td>
								<td>${pd.XQMC}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋坐落:</td>
								<td>${pd.FWZL}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所在层数:</td>
								<td>${pd.SZCS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总层数:</td>
								<td>${pd.ZCS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋朝向:</td>
								<td>${pd.FWCX}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建筑面积:</td>
								<td>${pd.JZMJ}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建成年份:</td>
								<td>${pd.JCNF}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房源户式:</td>
								<td>${pd.FYHS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产权类别:</td>
								<td>${pd.CQLB}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">权证年限:</td>
								<td>${pd.QZNX}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否为手套:</td>
								<td>${pd.ISONLYONE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">装修程度:</td>
								<td>${pd.ZXCD}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物业公司:</td>
								<td>${pd.WYGS}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否钥匙委托:</td>
								<td>${pd.YNKEY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房主电话:</td>
								<td>
								<c:choose>
								<c:when test="${isuserid == '0' }">
										${pd.TEL}
								</c:when>
								<c:otherwise>
									<c:if test="${pd.FYBH == '0' }">${pd.TEL}</c:if>
									<c:if test="${pd.FYBH == '1' }">*******</c:if>
								</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产权人:</td>
								<td>
								<c:choose>
								<c:when test="${isuserid == '0' }">
										${pd.CQR}
								</c:when>
								<c:otherwise>
									<c:if test="${pd.FYBH == '0' }">${pd.CQR}</c:if>
									<c:if test="${pd.FYBH == '1' }">*************</c:if>
								</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋来源:</td>
								<td>${pd.FWLY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房源类别:</td>
								<td>${pd.FYLB}</td>
							</tr>
						<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">层数性质:</td>
								<td>${pd.CSXZ}

								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">行政区:</td>
								<td>${pd.AREA}
									
								</td></tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋总价:</td>
								<td>${pd.FWZJ}</td>
							</tr>
							<tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td>${pd.BZ}</td>
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

		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>