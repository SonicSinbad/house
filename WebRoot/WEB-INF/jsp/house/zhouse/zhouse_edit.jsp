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
								<td><input type="text" name="CZFY" id="CZFY" value="${pd.CZFY}" maxlength="255" placeholder="这里输入出租房源" title="出租房源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名称:</td>
								<td><input type="text" name="XQMC" id="XQMC" value="${pd.XQMC}" maxlength="255" placeholder="这里输入小区名称" title="小区名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">面积:</td>
								<td><input type="number" name="FWMJ" id="FWMJ" value="${pd.FWMJ}" maxlength="32" placeholder="这里输入面积" title="面积" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户室格局:</td>
								<td><input type="text" name="HSGJ" id="HSGJ" value="${pd.HSGJ}" maxlength="255" placeholder="这里输入户室格局" title="户室格局" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">楼层:</td>
								<td><input type="number" name="FLOOR" id="FLOOR" value="${pd.FLOOR}" maxlength="32" placeholder="这里输入楼层" title="楼层" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋朝向:</td>
								<td>
								<select  name="FWCX"" id="FWCX"  >  
											<option value="东" <c:if test="${pd.FWCX == '东' }">selected</c:if>>东</option>
											<option value="南" <c:if test="${pd.FWCX == '南' }">selected</c:if>>南</option>
											<option value="西" <c:if test="${pd.FWCX == '西' }">selected</c:if>>西</option>
											<option value="北" <c:if test="${pd.FWCX == '北' }">selected</c:if>>北</option>
											<option value="东南" <c:if test="${pd.FWCX == '东南' }">selected</c:if>>东南</option>
											<option value="东西" <c:if test="${pd.FWCX == '东西' }">selected</c:if>>东西</option>
											<option value="东北" <c:if test="${pd.FWCX == '东北' }">selected</c:if>>东北</option>
											<option value="南西" <c:if test="${pd.FWCX == '南西' }">selected</c:if>>南西</option>
											<option value="南北" <c:if test="${pd.FWCX == '南北' }">selected</c:if>>南北</option>
											<option value="西北" <c:if test="${pd.FWCX == '西北' }">selected</c:if>>西北</option>
									</select>
								
								
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">装修情况:</td>
								<td>
								<select  name="ZXQK" id="ZXQK"  >  
											<option value="毛坯" <c:if test="${pd.ZXQK == '毛坯' }">selected</c:if>> 毛坯</option>
											<option value="简装" <c:if test="${pd.ZXQK == '简装' }">selected</c:if>>简装</option>
											<option value="老式简装" <c:if test="${pd.ZXQK == '老式简装' }">selected</c:if>>老式简装</option>
											<option value="半装修" <c:if test="${pd.ZXQK == '半装修' }">selected</c:if>>半装修</option>
											<option value="精装" <c:if test="${pd.ZXQK == '精装' }">selected</c:if>>精装</option>
											<option value="老式精装" <c:if test="${pd.ZXQK == '老式精装' }">selected</c:if>>老式精装</option>
											<option value="豪华装修" <c:if test="${pd.ZXQK == '豪华装修' }">selected</c:if>>豪华装修</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">屋里物品:</td>
								<td><input type="text" name="WLWP" id="WLWP" value="${pd.WLWP}" maxlength="255" placeholder="这里输入屋里物品" title="屋里物品" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家用电器:</td>
								<td><input type="text" name="JYDQ" id="JYDQ" value="${pd.JYDQ}" maxlength="255" placeholder="这里输入家用电器" title="家用电器" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">月租金:</td>
								<td><input type="number" name="YZJ" id="YZJ" value="${pd.YZJ}" maxlength="32" placeholder="这里输入月租金" title="月租金" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">付款方式:</td>
								<td><input type="text" name="FKFS" id="FKFS" value="${pd.FKFS}" maxlength="255" placeholder="这里输入付款方式" title="付款方式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">押金金额:</td>
								<td><input type="number" name="YJJE" id="YJJE" value="${pd.YJJE}" maxlength="32" placeholder="这里输入押金金额" title="押金金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">水费示数:</td>
								<td><input type="number" name="SFSS" id="SFSS" value="${pd.SFSS}" maxlength="32" placeholder="这里输入水费示数" title="水费示数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电费示数:</td>
								<td><input type="number" name="DFSS" id="DFSS" value="${pd.DFSS}" maxlength="32" placeholder="这里输入电费示数" title="电费示数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物业归属:</td>
								<td><input type="text" name="WYGS" id="WYGS" value="${pd.WYGS}" maxlength="255" placeholder="这里输入物业归属" title="物业归属" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">供热归属:</td>
								<td><input type="text" name="GRGS" id="GRGS" value="${pd.GRGS}" maxlength="255" placeholder="这里输入供热归属" title="供热归属" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房主姓名:</td>
								<td><input type="text" name="FZXM" id="FZXM" value="${pd.FZXM}" maxlength="255" placeholder="这里输入房主姓名" title="房主姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系方式:</td>
								<td><input type="text" name="LXFS" id="LXFS" value="${pd.LXFS}" maxlength="255" placeholder="这里输入联系方式" title="联系方式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否委托:</td>
								<td><input type="text" name="YNKEY" id="YNKEY" value="${pd.YNKEY}" maxlength="255" placeholder="这里输入是否委托" title="是否委托" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
			if($("#CZFY").val()==""){
				$("#CZFY").tips({
					side:3,
		            msg:'请输入出租房源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CZFY").focus();
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
			if($("#FWMJ").val()==""){
				$("#FWMJ").tips({
					side:3,
		            msg:'请输入面积',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FWMJ").focus();
			return false;
			}
			if($("#HSGJ").val()==""){
				$("#HSGJ").tips({
					side:3,
		            msg:'请输入户室格局',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HSGJ").focus();
			return false;
			}
			if($("#FLOOR").val()==""){
				$("#FLOOR").tips({
					side:3,
		            msg:'请输入楼层',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FLOOR").focus();
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
			if($("#ZXQK").val()==""){
				$("#ZXQK").tips({
					side:3,
		            msg:'请输入装修情况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ZXQK").focus();
			return false;
			}
			if($("#WLWP").val()==""){
				$("#WLWP").tips({
					side:3,
		            msg:'请输入屋里物品',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WLWP").focus();
			return false;
			}
			if($("#JYDQ").val()==""){
				$("#JYDQ").tips({
					side:3,
		            msg:'请输入家用电器',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JYDQ").focus();
			return false;
			}
			if($("#YZJ").val()==""){
				$("#YZJ").tips({
					side:3,
		            msg:'请输入月租金',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YZJ").focus();
			return false;
			}
			if($("#FKFS").val()==""){
				$("#FKFS").tips({
					side:3,
		            msg:'请输入付款方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FKFS").focus();
			return false;
			}
			if($("#YJJE").val()==""){
				$("#YJJE").tips({
					side:3,
		            msg:'请输入押金金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YJJE").focus();
			return false;
			}
			if($("#SFSS").val()==""){
				$("#SFSS").tips({
					side:3,
		            msg:'请输入水费示数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SFSS").focus();
			return false;
			}
			if($("#DFSS").val()==""){
				$("#DFSS").tips({
					side:3,
		            msg:'请输入电费示数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DFSS").focus();
			return false;
			}
			if($("#WYGS").val()==""){
				$("#WYGS").tips({
					side:3,
		            msg:'请输入物业归属',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WYGS").focus();
			return false;
			}
			if($("#GRGS").val()==""){
				$("#GRGS").tips({
					side:3,
		            msg:'请输入供热归属',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRGS").focus();
			return false;
			}
			if($("#FZXM").val()==""){
				$("#FZXM").tips({
					side:3,
		            msg:'请输入房主姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FZXM").focus();
			return false;
			}
			if($("#LXFS").val()==""){
				$("#LXFS").tips({
					side:3,
		            msg:'请输入联系方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LXFS").focus();
			return false;
			}
			if($("#YNKEY").val()==""){
				$("#YNKEY").tips({
					side:3,
		            msg:'请输入是否委托',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#YNKEY").focus();
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