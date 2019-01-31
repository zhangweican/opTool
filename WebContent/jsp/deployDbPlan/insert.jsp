<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<%@include file="../../head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>list</title>
<meta content='target-densitydpi=device-dpi, width=640' name='viewport'>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="white">
<meta name="format-detection" content="telephone=no">   
<link href="css/style/css.css" rel="stylesheet" type="text/css" />
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>   
<body>
<h3><font color=red>${msg }</font></h3>
<br>
<center>
<form action="insertUpdate" method="post">
	<c:if test="${deployDbPlan == null}">
	<table style="width: 100%;">
			<tr><td>版本</td><td>
				<input type="text" name="version" id="version">
				<div id="versionsDiv">
				<a href="javascript:add('主线')" class="sel_btn">主线</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</tr>
			<tr><td>库名</td>
			<td>
			<select name="dbName">
					<option value="idc_cmdb">idc_cmdb</option>
					<option value="idc_work_order">idc_work_order</option>
					<option value="idc_knowledge_base">idc_knowledge_base</option>
					<option value="idc_operation_management">idc_operation_management</option>
					<option value="usercenter">usercenter</option>
					<option value="passport">passport</option>
					<option value="activiti">activiti</option>
				</select>
			</td>
			</tr>
			<tr><td>是否执行在开发DB</td><td>
				<select name="isDoDeployDB">
					<option value="0">无操作</option>
					<option value="1">待执行</option>
					<option value="2">已执行</option>
				</select>
			</td></tr>
			<tr><td>是否执行在测试DB</td><td>
				<select name="isDoTestDB">
					<option value="0">无操作</option>
					<option value="1">待执行</option>
					<option value="2">已执行</option>
				</select>
			</td></tr>
			<tr><td>是否执行在预发布DB</td><td>
							<select name="isDoPlatformDB">
					<option value="0">无操作</option>
					<option value="1">待执行</option>
					<option value="2">已执行</option>
				</select>
			</td></tr>
			<tr><td>是否执行在生成DB</td><td>
							<select name="isDoProductDB">
					<option value="0">无操作</option>
					<option value="1">待执行</option>
					<option value="2">已执行</option>
				</select>
			</td></tr>
			<tr><td>标题</td><td><input type="text" name="title"></td></tr>
			<tr><td>新增者</td><td>
				<select name="addUser">
					<option value="1" <c:if test="${cookie.addUser.value == '1'}">selected</c:if>>江金鹏</option>
					<option value="2" <c:if test="${cookie.addUser.value == '2'}">selected</c:if>>张伟灿</option>
					<option value="3" <c:if test="${cookie.addUser.value == '3'}">selected</c:if>>陈贤林</option>
					<option value="4" <c:if test="${cookie.addUser.value == '4'}">selected</c:if>>赖雪丹</option>
				</select>
				</select>
			</td></tr>
			<tr><td>内容</td><td>
				<textarea rows="10" cols="130" name="content"></textarea>
	</table>
	</c:if>
	<c:if test="${deployDbPlan != null}">
	<table style="width: 100%;">
			<tr><td>主键</td><td><input type="hidden" name="id" value="${deployDbPlan.id}">${deployDbPlan.id}</td></tr>
			<tr><td>版本</td><td>
				<input type="text" name="version" value="${deployDbPlan.version}" id="version">
				
				<div id="versionsDiv">
				<a href="javascript:add('主线')" class="sel_btn">主线</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				
			</tr>
			<tr><td>库名</td>
			<td>
			<select name="dbName">
					<option value="idc_cmdb" <c:if test="${deployDbPlan.dbName == 'idc_cmdb'}">selected</c:if>>idc_cmdb</option>
					<option value="idc_work_order" <c:if test="${deployDbPlan.dbName == 'idc_work_order'}">selected</c:if>>idc_work_order</option>
					<option value="idc_knowledge_base" <c:if test="${deployDbPlan.dbName == 'idc_knowledge_base'}">selected</c:if>>idc_knowledge_base</option>
					<option value="idc_operation_management" <c:if test="${deployDbPlan.dbName == 'idc_operation_management'}">selected</c:if>>idc_operation_management</option>
					<option value="usercenter" <c:if test="${deployDbPlan.dbName == 'usercenter'}">selected</c:if>>usercenter</option>
					<option value="passport" <c:if test="${deployDbPlan.dbName == 'passport'}">selected</c:if>>passport</option>
					<option value="activiti" <c:if test="${deployDbPlan.dbName == 'activiti'}">selected</c:if>>activiti</option>
				</select>
			</td>
			</tr>
			<tr><td>是否执行在开发DB</td><td>
				<select name="isDoDeployDB" style="width:100px;">
					<c:if test="${deployDbPlan.isDoDeployDB == 2}">
						<option value="2" <c:if test="${deployDbPlan.isDoDeployDB == 2}">selected</c:if>>已执行</option>
					</c:if>
					<c:if test="${deployDbPlan.isDoDeployDB != 2}">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${deployDbPlan.isDoDeployDB == 1}">selected</c:if>>待执行</option>
						<option value="2" <c:if test="${deployDbPlan.isDoDeployDB == 2}">selected</c:if>>已执行</option>
					</c:if>
				</select>
			</td></tr>
			<tr><td>是否执行在测试DB</td><td>
				<select name="isDoTestDB" style="width:100px;">
					<c:if test="${deployDbPlan.isDoTestDB == 2}">
						<option value="2" <c:if test="${deployDbPlan.isDoTestDB == 2}">selected</c:if>>已执行</option>
					</c:if>
					<c:if test="${deployDbPlan.isDoTestDB != 2}">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${deployDbPlan.isDoTestDB == 1}">selected</c:if>>待执行</option>
						<option value="2" <c:if test="${deployDbPlan.isDoTestDB == 2}">selected</c:if>>已执行</option>
					</c:if>
				</select>
			</td></tr>
			<tr><td>是否执行在预发布DB</td><td>
				<select name="isDoPlatformDB" style="width:100px;">
					<c:if test="${deployDbPlan.isDoPlatformDB == 2}">
						<option value="2" <c:if test="${deployDbPlan.isDoPlatformDB == 2}">selected</c:if>>已执行</option>
					</c:if>
					<c:if test="${deployDbPlan.isDoPlatformDB != 2}">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${deployDbPlan.isDoPlatformDB == 1}">selected</c:if>>待执行</option>
						<option value="2" <c:if test="${deployDbPlan.isDoPlatformDB == 2}">selected</c:if>>已执行</option>
					</c:if>
				</select>
			</td></tr>
			<tr><td>是否执行在生成DB</td><td>
				<select name="isDoProductDB" style="width:100px;">
					<c:if test="${deployDbPlan.isDoProductDB == 2}">
						<option value="2" <c:if test="${deployDbPlan.isDoProductDB == 2}">selected</c:if>>已执行</option>
					</c:if>
					<c:if test="${deployDbPlan.isDoProductDB != 2}">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${deployDbPlan.isDoProductDB == 1}">selected</c:if>>待执行</option>
						<option value="2" <c:if test="${deployDbPlan.isDoProductDB == 2}">selected</c:if>>已执行</option>
					</c:if>
				</select>
			</td></tr>
			<tr><td>标题</td><td><input type="text" name="title"  value="${deployDbPlan.title}" size="100"></td></tr>
			<tr><td>新增者</td><td>
				<select name="addUser">
					<option value="1" <c:if test="${deployDbPlan.addUser == '1'}">selected</c:if>>江金鹏</option>
					<option value="2" <c:if test="${deployDbPlan.addUser == '2'}">selected</c:if>>张伟灿</option>
					<option value="3" <c:if test="${deployDbPlan.addUser == '3'}">selected</c:if>>陈贤林</option>
					<option value="4" <c:if test="${deployDbPlan.addUser == '4'}">selected</c:if>>赖雪丹</option>
				</select>
			</td></tr>			
			<tr><td>内容</td><td>
				<textarea rows="10" cols="130" name="content">${deployDbPlan.content}</textarea></td>
			<tr><td>创建日期</td><td>
			<fmt:formatDate value="${deployDbPlan.creatTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />
				</td>
		</tr>
	</table>
	</c:if>
	<br>
	<br>
	<input type="submit" value="保存" name="button">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" name="button" onclick="goList()">
	</form>
	
	</center>
</body>
<script>
       function goList(){
    	   window.location.href='list';
       }
	   function add(version){
		   document.getElementById("version").value = version;
	   }
	   $.post("${cxt}/deployDbPlan/getVersions",{},function(result){
		  var json = JSON.parse(result);
		  //alert(json);
		  for(var i=0,l=json.length;i<l;i++){
			  	var str = "<a href=\"javascript:add('" + json[i].version +"')\" class=\"sel_btn\">" + json[i].version + "</a>&nbsp;&nbsp;&nbsp;&nbsp";
			  	$('#versionsDiv').append(str);
			  }
		  
		}); 
	   
</script>
  <style type="text/css">
        table{
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th{
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th{
            background-color: #CCE8EB;
            width: 250px;
        }
        table tr:nth-child(odd){
            background: #fff;
        }
        table tr:nth-child(even){
            background: #F5FAFA;
        }
        
 .sel_btn{
            height: 21px;
            line-height: 21px;
            padding: 0 11px;
            background: #e4e4e4;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            font-size: 12px;
            outline: none;
        }       
    </style>


</html>
