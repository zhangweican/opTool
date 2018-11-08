<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<%@include file="head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shell操控台</title>
<meta content='target-densitydpi=device-dpi, width=640' name='viewport'>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="white">
<meta name="format-detection" content="telephone=no">   
<link href="css/style/css.css" rel="stylesheet" type="text/css" />
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>   
<body>
    <div id="log-container" style="height: 70%;width:95%; overflow-y: scroll; ; color: #333; padding: 10px;border: 1px solid #ccc">
        <div id="output">
        </div>
    </div>
    <br>
	<input id="text" type="text" size="100" style="font-size: 16pt;border: 1px solid #ccc; padding: 7px 0px;border-radius: 3px; /*css3属性IE不支持*/"/>
	<button onclick="send()">发送</button><button onclick="closeWebSocket()">关闭</button><button onclick="clean()">清楚内容</button>
	<br>
	<br>
    <table style="border: 1px solid #ccc;">
    	<tr>
    		<td width="15%">
    			<select name="host" id="host">
				   	<option value='10.1.100.108' <c:if test="${param.host == '10.1.100.108'}">selected</c:if>>测试环境	10.1.100.108</option>
					<option value='10.1.100.109' <c:if test="${param.host == '10.1.100.109'}">selected</c:if>>测试环境	10.1.100.109</option>
					<option value='10.1.100.110' <c:if test="${param.host == '10.1.100.110'}">selected</c:if>>开发环境	10.1.100.110</option>
					<option value='10.1.100.111' <c:if test="${param.host == '10.1.100.111'}">selected</c:if>>开发环境	10.1.100.111</option>
					<option value='10.1.100.112' <c:if test="${param.host == '10.1.100.112'}">selected</c:if>>开发环境（SVN）	10.1.100.112</option>	
					<!-- 
					<option value='10.1.100.113' <c:if test="${param.host == '10.1.100.113'}">selected</c:if>>开发环境（打包等）	10.1.100.113</option>
					 -->
			   </select>
    		</td>
    		<td width="70%">	   
    			<!-- <button onclick="addText({'action':'cmd','message':'跟踪日志','params':'ipconfig /all'})">测试windows命令</button> -->
    			日志类---->
    			<button onclick="addCmdText('tail -n 300 /usr/local/tomcat/apache-tomcat-7.0.90/logs/catalina.out')">跟踪tomcat catalina日志</button>
    			<button onclick="addCmdText('tail -n 300 /usr/local/tomcat/apache-tomcat-7.0.90/logs/usercenter-war.log')">跟踪usercenter-war日志</button>
    			<button onclick="addCmdText('tail -n 300 /usr/local/tomcat/apache-tomcat-7.0.90/logs/operation-war.log')">跟踪operation-war日志</button>
    			<button onclick="addCmdText('tail -n 300 /usr/local/tomcat/apache-tomcat-7.0.90/logs/itop-war.log')">跟踪itop-war日志</button>
    			<button onclick="addCmdText('tail -n 300 /usr/local/tomcat/apache-tomcat-7.0.90/logs/workflow-war.log')">跟踪workflow-war日志</button>
    			<br>
    			进程查看类---->
    			<button onclick="addCmdText('ps -ef | grep apache-tomcat-7.0.90 | grep -v grep')">查看tomcat7进程</button>
    			<button onclick="addCmdText('ps -ef | grep zookeeper-3.4.12 | grep -v grep')">查看zookeeper-3.4.12进程</button>
    			<button onclick="addCmdText('ps -ef | grep redis-server | grep 6379 | grep -v grep')">查看redis进程</button>
    			<button onclick="addCmdText('ps -ef | grep httpd | grep -v grep')">查看apache进程</button>
    			<br>
    			进程操作类---->
    			<button onclick="addCmdText('echo \'itop1@3\' | sudo -S systemctl restart tomcat7')">重启tomcat7进程</button>
    			<button onclick="addCmdText('source /etc/profile;/usr/local/zookeeper/zookeeper-3.4.12/bin/zkServer.sh restart')">重启zookeeper-3.4.12进程</button>
    			<button onclick="addCmdText('kill -9 `ps -ef|grep redis-server|grep -v grep|grep -v kill|awk \'{print $2}\'`; /usr/local/redis/redis-stable/src/redis-server /usr/local/redis/redis-stable/redis.conf')">重启redis进程</button>
    			<button onclick="addCmdText('echo \'itop1@3\' | sudo -S systemctl restart httpd.service')">重启apache进程</button>
    			<!-- <button onclick="addCmdText('/usr/local/tomcat/apache-tomcat-7.0.90/bin/shutdown.sh')">关闭tomcat7进程</button>-->
    			<!-- <button onclick="addCmdText('/usr/local/tomcat/apache-tomcat-7.0.90/bin/startup.sh')">启动tomcat7进程</button> -->
    			<br>
    		</td>
    	</tr>
    	
    </table>
</body>
<script>
        // 指定websocket路径

    var websocket = null;
    
    //判断当前浏览器是否支持WebSocket
    if('WebSocket' in window){
    	websocket = new WebSocket('ws://${pageContext.request.serverName}:8080/opTool/webSocketServer');
    }
    else{
        alert('Not support websocket');
    }        
    websocket.onmessage = function(event) {
        // 接收服务端的实时日志并添加到HTML页面中
        $("#log-container div").append(event.data);
        // 滚动条滚动到最低部
        $("#log-container").scrollTop($("#log-container div").height() - $("#log-container").height());
    };
  	//关闭连接
    function closeWebSocket(){
        websocket.close();
    }
     
    //发送消息
    function send(){
        var message = document.getElementById('text').value;
        websocket.send(message);
    }
    //发送消息
    function sendJson(json){
        websocket.send(JSON.stringify(json));
    }
    //发送消息
    function addText(json){
    	 document.getElementById('text').value = JSON.stringify(json);
    }
    function clean(json){
    	 document.getElementById('text').value = "";
    	 document.getElementById('output').innerHTML = "";
    }
    function addCmdText(params){
    	var obj = document.getElementById("host"); //定位id
    	var host = obj.options[obj.selectedIndex].value; // 选中值
    	if(host == null){
    		alert("请选择要执行命令的主机")
    	}else{
    		var json = {};
    		json.action = "SSHShell";
    		//json.message = "远程执行命令";
    		json.params = host + " " + params;
    		document.getElementById('text').value = JSON.stringify(json);
    		send();
    	}
    }


</script>


</html>
