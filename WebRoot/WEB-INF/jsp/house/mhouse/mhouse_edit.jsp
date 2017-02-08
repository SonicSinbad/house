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
					
					<form action="mhouse/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MHOUSE_ID" id="MHOUSE_ID" value="${pd.MHOUSE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:100px;text-align: right;padding-top: 13px;">房屋编号:</td>
								<td><input type="text" name="TFQZH" id="TFQZH" value="${pd.TFQZH}" maxlength="255" placeholder="这里输入图符丘幢号" title="图符丘幢号" onblur="hasN()"  style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名称:</td>
								<td><input type="text" name="XQMC" id="XQMC" value="${pd.XQMC}" maxlength="255" placeholder="这里输入小区名称" title="小区名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋坐落:</td>
								<td><input type="text" name="FWZL" id="FWZL" value="${pd.FWZL}" maxlength="255" placeholder="这里输入房屋坐落" title="房屋坐落" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所在层数:</td>
								<td><input type="number" name="SZCS" id="SZCS" value="${pd.SZCS}" maxlength="32" placeholder="这里输入所在层数" title="所在层数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">总层数:</td>
								<td><input type="number" name="ZCS" id="ZCS" value="${pd.ZCS}" maxlength="32" placeholder="这里输入总层数" title="总层数" style="width:98%;"/></td>
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
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建筑面积:</td>
								<td><input type="number" name="JZMJ" id="JZMJ" value="${pd.JZMJ}" maxlength="32" placeholder="这里输入建筑面积" title="建筑面积" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">建成年份:</td>
								<td><input type="text" name="JCNF" id="JCNF" value="${pd.JCNF}" maxlength="255" placeholder="这里输入建成年份" title="建成年份" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房源户式:</td>
								<td><input type="text" name="FYHS" id="FYHS" value="${pd.FYHS}" maxlength="255" placeholder="这里输入房源户式" title="房源户式" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产权类别:</td>
								<td>
							
							<select  name="CQLB"" id="CQLB"  >  
											<option value="公产" <c:if test="${pd.CQLB == '公产' }">selected</c:if>>公产</option>
											<option value="私产小照" <c:if test="${pd.CQLB == '私产小照' }">selected</c:if>>私产小照</option>
											<option value="私产大照" <c:if test="${pd.CQLB == '私产大照' }">selected</c:if>>私产大照</option>
											<option value="合同发票" <c:if test="${pd.CQLB == '合同发票' }">selected</c:if>>合同发票</option>
											<option value="认购协议" <c:if test="${pd.CQLB == '认购协议' }">selected</c:if>>认购协议</option>
											<option value="动迁安置协议" <c:if test="${pd.CQLB == '动迁安置协议' }">selected</c:if>>动迁安置协议</option>
											<option value="顶账合同" <c:if test="${pd.CQLB == '顶账合同' }">selected</c:if>>顶账合同</option>
											<option value="公司产权" <c:if test="${pd.CQLB == '公司产权' }">selected</c:if>>公司产权</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">权证年限:</td>
								<td>
							  <select  name="QZNX"" id="QZNX"  >  
											<option value="40年" <c:if test="${pd.QZNX == '40年' }">selected</c:if>>40年</option>
											<option value="50年" <c:if test="${pd.QZNX == '50年' }">selected</c:if>>50年</option>
											<option value="70年" <c:if test="${pd.QZNX == '70年' }">selected</c:if>>70年</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否为首套:</td>
								<td>
							<select  name="ISONLYONE"" id="ISONLYONE"  >  
											<option value="是" <c:if test="${pd.ISONLYONE == '是' }">selected</c:if>>是</option>
											<option value="否" <c:if test="${pd.ISONLYONE == '否' }">selected</c:if>>否</option>
									</select>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">装修程度:</td>
								<td>
							<select  name="ZXCD"" id="ZXCD"  >  
											<option value="毛坯" <c:if test="${pd.ZXCD == '毛坯' }">selected</c:if>> 毛坯</option>
											<option value="简装" <c:if test="${pd.ZXCD == '简装' }">selected</c:if>>简装</option>
											<option value="老式简装" <c:if test="${pd.ZXCD == '老式简装' }">selected</c:if>>老式简装</option>
											<option value="半装修" <c:if test="${pd.ZXCD == '半装修' }">selected</c:if>>半装修</option>
											<option value="精装" <c:if test="${pd.ZXCD == '精装' }">selected</c:if>>精装</option>
											<option value="老式精装" <c:if test="${pd.ZXCD == '老式精装' }">selected</c:if>>老式精装</option>
											<option value="豪华装修" <c:if test="${pd.ZXCD == '豪华装修' }">selected</c:if>>豪华装修</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">物业公司:</td>
								<td><input type="text" name="WYGS" id="WYGS" value="${pd.WYGS}" maxlength="255" placeholder="这里输入物业公司" title="物业公司" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否钥匙委托:</td>
								<td>
									<select  name="YNKEY"" id="YNKEY"  >  
											<option value="是" <c:if test="${pd.YNKEY == '是' }">selected</c:if>>是</option>
											<option value="否" <c:if test="${pd.YNKEY == '否' }">selected</c:if>>否</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房主电话:</td>
								<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="100" placeholder="这里输入房主电话" title="房主电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">产权人:</td>
								<td><input type="text" name="CQR" id="CQR" value="${pd.CQR}" maxlength="255" placeholder="这里输入产权人" title="产权人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋来源:</td>
								<td><input type="text" name="FWLY" id="FWLY" value="${pd.FWLY}" maxlength="255" placeholder="这里输入房屋来源" title="房屋来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房源类别:</td>
							<!-- <td><input type="text" name="FYLB" id="FYLB" value="${pd.FYLB}" maxlength="255" placeholder="这里输入房源类别" title="房源类别" style="width:98%;"/></td>
							 -->
								<td>
									<select  name="FYLB"" id="fylb"  >  
											<option value="住宅" <c:if test="${pd.FYLB == '住宅' }">selected</c:if>>住宅</option>
											<option value="门市" <c:if test="${pd.FYLB == '门市' }">selected</c:if>>门市</option>
											<option value="车库" <c:if test="${pd.FYLB == '车库' }">selected</c:if>>车库</option>
											<option value="别墅" <c:if test="${pd.FYLB == '别墅' }">selected</c:if>>别墅</option>
											<option value="写字楼" <c:if test="${pd.FYLB == '写字楼' }">selected</c:if>>写字楼</option>
									</select>

								</td>							 	
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房源保护:</td>
								<td>
								<select  name="FYBH"" id="fybh"  >
											<option value="0" <c:if test="${pd.FYBH == '0' }">selected</c:if>>否</option>
											<option value="1" <c:if test="${pd.FYBH == '1' }">selected</c:if>>是</option>
											</select>
								</td>
							</tr>
							<!-- 
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">层数性质:</td>
								<td>
									<select  name="CSXZ"" id="csxz"  >  
											<option value="别墅" <c:if test="${pd.CSXZ == '别墅' }">selected</c:if>>别墅</option>
											<option value="洋房" <c:if test="${pd.CSXZ == '洋房' }">selected</c:if>>洋房</option>
											<option value="电梯洋房" <c:if test="${pd.CSXZ == '电梯洋房' }">selected</c:if>>电梯洋房</option>
											<option value="多层" <c:if test="${pd.CSXZ == '多层' }">selected</c:if>>多层</option>
											<option value="小高" <c:if test="${pd.CSXZ == '小高' }">selected</c:if>>小高</option>
											<option value="大高" <c:if test="${pd.CSXZ == '大高' }">selected</c:if>>大高</option>
									</select>

								</td>
							</tr>
							 -->
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">行政区:</td>
								<td>
								<select  name="AREA"" id="AREA"  >  
											<option value="船营区" <c:if test="${pd.AREA == '船营区' }">selected</c:if>>船营区</option>
											<option value="昌邑区" <c:if test="${pd.AREA == '昌邑区' }">selected</c:if>>昌邑区</option>
											<option value="高新区" <c:if test="${pd.AREA == '高新区' }">selected</c:if>>高新区</option>
											<option value="丰满区" <c:if test="${pd.AREA == '丰满区' }">selected</c:if>>丰满区</option>
											<option value="龙潭区" <c:if test="${pd.AREA == '龙潭区' }">selected</c:if>>龙潭区</option>
											
									</select>
									
								</td></tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房屋总价:</td>
								<td><input type="number" name="FWZJ" id="FWZJ" value="${pd.FWZJ}" maxlength="32" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="BZ" id="BZ" value="${pd.BZ}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
	<script src="static/ace/js/ace/ace.js"></script>
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
		            msg:'请输入房屋编号',
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
		            msg:'请输入是否为首套',
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
		//判断编码是否存在
	function hasN(){
		var TFQZH = $.trim($("#TFQZH").val()); 
		$.ajax({
			type: "POST",
			url: '<%=basePath%>mhouse/bhIsOne.do',
	    	data: {TFQZH:TFQZH},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#TFQZH").tips({
							side:3,
				            msg:'编号 '+TFQZH+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#TFQZH").val('');
				 }
			}
		});
	}
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>