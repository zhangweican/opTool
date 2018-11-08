<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<%@include file="../../head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
<title>list</title>
<body>
<br>
<h3><font color=red>${msg }</font></h3>
	<form action="list" method="post" id="search">
	<table width="100%">
					<tr><td>版本</td><td>
				<input type="text" name="version" value="${deployDbPlan.version}">
				</select>
			</td>
			<td>库名</td>
			<td>
			<select name="dbName" style="width:100px;">
					<option value="">请选择</option>
					<option value="idc_cmdb" <c:if test="${deployDbPlan.dbName == 'idc_cmdb'}">selected</c:if>>idc_cmdb</option>
					<option value="idc_work_order" <c:if test="${deployDbPlan.dbName == 'idc_work_order'}">selected</c:if>>idc_work_order</option>
					<option value="idc_operation_management" <c:if test="${deployDbPlan.dbName == 'idc_operation_management'}">selected</c:if>>idc_operation_management</option>
					<option value="usercenter" <c:if test="${deployDbPlan.dbName == 'usercenter'}">selected</c:if>>usercenter</option>
					<option value="passport" <c:if test="${deployDbPlan.dbName == 'passport'}">selected</c:if>>passport</option>
				</select>
			</td>
			</tr>
			<tr><td>是否执行在开发DB</td><td>
				<select name="isDoDeployDB" style="width:100px;">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${deployDbPlan.isDoDeployDB == 1}">selected</c:if>>待执行</option>
					<option value="2" <c:if test="${deployDbPlan.isDoDeployDB == 2}">selected</c:if>>已执行</option>
				</select>
			</td>
			<td>是否执行在测试DB</td><td>
				<select name="isDoTestDB" style="width:100px;">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${deployDbPlan.isDoTestDB == 1}">selected</c:if>>待执行</option>
					<option value="2" <c:if test="${deployDbPlan.isDoTestDB == 2}">selected</c:if>>已执行</option>
				</select>
			</td></tr>
			<tr><td>是否执行在预发布DB</td><td>
				<select name="isDoPlatformDB" style="width:100px;">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${deployDbPlan.isDoPlatformDB == 1}">selected</c:if>>待执行</option>
					<option value="2" <c:if test="${deployDbPlan.isDoPlatformDB == 2}">selected</c:if>>已执行</option>
				</select>
			</td>
			<td>是否执行在生成DB</td><td>
				<select name="isDoProductDB" style="width:100px;">
					<option value="0">请选择</option>
					<option value="1" <c:if test="${deployDbPlan.isDoProductDB == 1}">selected</c:if>>待执行</option>
					<option value="2" <c:if test="${deployDbPlan.isDoProductDB == 2}">selected</c:if>>已执行</option>
				</select>
			</td></tr>
			<tr><td>标题</td><td><input type="text" name="title" value="${deployDbPlan.title}"></td>
			<td>是否已删除</td>
			<td>
			<select name="isDelete" style="width:100px;">
					<option value="">请选择</option>
					<option value="0" <c:if test="${deployDbPlan.isDelete == 0}">selected</c:if>>未删除</option>
					<option value="1" <c:if test="${deployDbPlan.isDelete == 1}">selected</c:if>>已删除</option>
				</select>
			</td></tr>
	</table>
	<br>
	<center><input type="submit" value="检索"></center>
	</form>
	<hr>
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="新增" onclick="add()">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记“开发库”为“待执行”" onclick="flag(1)" style="border-style:solid;border-width:2px;border-color:RED;color: RED">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记”测试库“为“待执行”" onclick="flag(2)" style="border-style:solid;border-width:2px;border-color:RED;color: RED">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记“预发布库”为“待执行”" onclick="flag(3)" style="border-style:solid;border-width:2px;border-color:RED;color: RED">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记”生产库“为“待执行”" onclick="flag(4)" style="border-style:solid;border-width:2px;border-color:RED;color: RED">
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记“开发库”为“已执行”" onclick="flagOK(1)" style="border-style:solid;border-width:2px;border-color:GREEN;color: GREEN">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记”测试库“为“已执行”" onclick="flagOK(2)" style="border-style:solid;border-width:2px;border-color:GREEN;color: GREEN">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记“预发布库”为“已执行”" onclick="flagOK(3)" style="border-style:solid;border-width:2px;border-color:GREEN;color: GREEN">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="标记”生产库“为“已执行”" onclick="flagOK(4)" style="border-style:solid;border-width:2px;border-color:GREEN;color: GREEN">
	<br>
	<table style="width: 100%;">
		<tr style="background: #C4E1FF; color: #fff;">
			<td><input type="checkbox" name='allselect' onclick="selectAll()"></td>
			<td>主键</td>
			<td>版本</td>
			<td>库名</td>
			<td>是否执行在开发DB</td>
			<td>是否执行在测试DB</td>
			<td>是否执行在预发布DB</td>
			<td>是否执行在生成DB</td>
			<td>标题</td>
			<td>新增者</td>
			<td>创建日期</td>
			<td colspan="3">操作</td>
		</tr>
		<c:forEach var="v" items="${list}">
			<tr>
				<td><input type="checkbox" name='ids' value='${v.id}' ></td>
				<td>${v.id}</td>
				<td>${v.version}</td>
				<td>${v.dbName}</td>
				<td>
					<c:choose><c:when test="${v.isDoDeployDB==1}"><font color=red>待执行</font></c:when><c:when test="${v.isDoDeployDB==2}"><font color=green>已执行</font></c:when></c:choose></td>
				<td>
					<c:choose><c:when test="${v.isDoTestDB==1}"><font color=red>待执行</font></c:when><c:when test="${v.isDoTestDB==2}"><font color=green>已执行</font></c:when></c:choose></td>
				<td>
					<c:choose><c:when test="${v.isDoPlatformDB==1}"><font color=red>待执行</font></c:when><c:when test="${v.isDoPlatformDB==2}"><font color=green>已执行</font></c:when></c:choose></td>
				<td>
					<c:choose><c:when test="${v.isDoProductDB==1}"><font color=red>待执行</font></c:when><c:when test="${v.isDoProductDB==2}"><font color=green>已执行</font></c:when></c:choose></td>
				<td>${v.title}</td>
				<td>
					<c:choose><c:when test="${v.addUser=='1'}">江金鹏</c:when><c:when test="${v.addUser=='2'}">张伟灿</c:when><c:when test="${v.addUser=='3'}">陈贤林</c:when><c:when test="${v.addUser=='4'}">赖雪丹</c:when></c:choose></td>
				<td><fmt:formatDate value="${v.creatTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" /> </td>
				<td><a href="preInsetUpdate?id=${v.id}">编辑</a></td>
				<td>
<textarea id="sendMsg${v.id}" style="display:none;">【${v.id}】【${v.version}】<c:if test="${v.isDoDeployDB==1}">【开发】</c:if><c:if test="${v.isDoTestDB==1}">【测试】</c:if><c:if test="${v.isDoPlatformDB==1}">【预发布】</c:if><c:if test="${v.isDoProductDB==1}">【线上】</c:if>【${v.dbName}】${v.title}

${v.content}

</textarea> 
				<a href="javascript:sendQQ(${v.id})" id="sendMsgA${v.id}">发送数据库操作群</a></td>
				<td><c:if test="${v.isDelete == 0}"><a href="delete?id=${v.id}">删除</a></c:if><c:if test="${v.isDelete == 1}">删除</c:if></td>
			</tr>
		</c:forEach>
		
	</table>
		<iframe src="" name="iframe" id="iframe" style="display:none;"></iframe>
	<script type="text/javascript">
	    function add(){
	 	   window.location.href='preInsetUpdate';
	    }
	    function flag(f){
	    	var arr = new Array();
	    	$('input[name="ids"]:checked').each(function(i){
                arr[i] = $(this).val();
            });
            var vals = arr.join(",");
            $.post("flag", {
				ids:vals,
				f: f
			}, function(result) {
				if(result == 0) {
					alert("标记成功");
				}
	            document.getElementById("search").submit();
			});
	    }
	    function flagOK(f){
	    	var arr = new Array();
	    	$('input[name="ids"]:checked').each(function(i){
                arr[i] = $(this).val();
            });
            var vals = arr.join(",");
            $.post("flagOK", {
				ids:vals,
				f: f
			}, function(result) {
				if(result == 0) {
					alert("标记成功");
				}
	            document.getElementById("search").submit();
			});
	    }
	    var iSelect=true;
		function selectAll(){
			var arr =document.getElementsByName('ids');
			if(iSelect==true){
				for(var i=0;i<arr.length;i++){
				arr[i].checked=true;
				}
				iSelect=false;
			}else if(iSelect==false){
				for(var i=0;i<arr.length;i++){
					arr[i].checked=false;
				}
				iSelect=true;
			}	
		}
		function sendQQ(id) {
			var msg = document.getElementById("sendMsg" + id).value;
			msg = msg + "  \n\n操作请打开链接：  ${basePath}deployDbPlan/preInsetUpdate?id=" + id;
			//alert("msg====" + msg);
			copyToClipboard(msg);
			//location.href = "tencent://message/?uin=3004168832&Site=在线QQ&amp;Menu=yes";
			$("#iframe").attr("src","https://jq.qq.com/?_wv=1027&k=529BzX5");
		}

		function copyToClipboard(text) {
			var textArea = document.createElement("textarea");
			textArea.style.position = 'fixed';
			textArea.style.top = '0';
			textArea.style.left = '0';
			textArea.style.width = '2em';
			textArea.style.height = '2em';
			textArea.style.padding = '0';
			textArea.style.border = 'none';
			textArea.style.outline = 'none';
			textArea.style.boxShadow = 'none';
			textArea.style.background = 'transparent';
			textArea.value = text;
			document.body.appendChild(textArea);
			textArea.select();

			try {
				var successful = document.execCommand('copy');
				var msg = successful ? '成功复制到剪贴板，请CTR + V 粘贴到 “数据库操作群”' : '该浏览器不支持点击复制到剪贴板';
				alert(msg);
			} catch (err) {
				alert('该浏览器不支持点击复制到剪贴板');
			}

			document.body.removeChild(textArea);
		}
	</script>
</body>
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
    </style>

</html>
