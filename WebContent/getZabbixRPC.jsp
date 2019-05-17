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
<script>
var auth;
var host108,host109,host110,host111;
var data = {
"jsonrpc": "2.0",
"method": "user.login",
"params": {
	"user": "zhangwc",
	"password": "zabbix"
},
"id": 1,
"auth": null
}; 

//登录获取auth	
post(data,function(result){
	auth = result.result;
	getHost();
});

function getHost(){
	var data = {
		"jsonrpc": "2.0",
		"method": "host.get",
		"params": {
		"output": ["hostid","host"],
		"selectInterfaces": ["interfaceid","ip"]
		},
		"id": 2,
		"auth": auth
	}	
	post(data,function(result){
	var hosts = result.result;
	for(var i =0;i < hosts.length;i++){
		var host = hosts[i];
		//alert(JSON.stringify(host.host));
		if(host.host == "Agent_108"){
			host108 = host.hostid;	
		}else if(host.host == "Agent_109"){
			host109 = host.hostid;	
		}else if(host.host == "Agent_110"){
			host110 = host.hostid;	
		}else if(host.host == "Agent_111"){
			host111 = host.hostid;	
		}
		//getItem(host.hostid);
	}
	//alert( host108 + " " + host109 + " " + host110 + " " + host111);

	//没10秒查询一次状态
	self.setInterval("getItem()",10 * 1000)
});
}

function getItem(){
	var data = 
	{
		"jsonrpc": "2.0",
		"method": "item.get",
		"params": {
		"output": "extend",
		"hostids": [host108,host109,host110,host111],
		"search": {
		"key_": "net.tcp.listen"// #in为入流量，out为出流量#
		},
		"sortfield": "name"
		},
		"auth": auth,
		"id": 1
	}
	post(data,function(result){
		//$("#msg").html(JSON.stringify(result));
		//alert(JSON.stringify(result));
		var items = result.result;
		for(var i =0;i < items.length;i++){
			var item = items[i];
			//alert(JSON.stringify(host.host));
			if(item.hostid == host108){
				if(item.key_.indexOf("6379") != -1){	//redis
					//alert(item.hostid + "  " + item.itemid);
					setColor(108,6379,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("2181") != -1){	//zookeeper
					//alert(item.hostid + "   " + item.itemid);
					setColor(108,2181,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("8080") != -1){	//tomcat
					//alert(item.hostid + "  " + item.itemid);
					setColor(108,8080,item.hostid,item.itemid,item.lastvalue);
				}		
			}else if(item.hostid == host109){
				if(item.key_.indexOf("6379") != -1){	//redis
					//alert(item.hostid + "  " + item.itemid);
					setColor(109,6379,item.hostid,item.itemid,item.lastvalue);
				}else if(item.key_.indexOf("2181") != -1){	//zookeeper
					//alert(item.hostid + "   " + item.itemid);
					setColor(109,2181,item.hostid,item.itemid,item.lastvalue);
				}else if(item.key_.indexOf("8080") != -1){	//tomcat
					//alert(item.hostid + "  " + item.itemid);
					setColor(109,8080,item.hostid,item.itemid,item.lastvalue);
				}	
			}else if(item.hostid == host110){
				if(item.key_.indexOf("6379") != -1){	//redis
					//alert(item.hostid + "  " + item.itemid);
					setColor(110,6379,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("2181") != -1){	//zookeeper
					//alert(item.hostid + "   " + item.itemid);
					setColor(110,2181,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("8080") != -1){	//tomcat
					//alert(item.hostid + "  " + item.itemid);
					setColor(110,8080,item.hostid,item.itemid,item.lastvalue);
				}				
			}else if(item.hostid == host111){
				if(item.key_.indexOf("6379") != -1){	//redis
					//alert(item.hostid + "  " + item.itemid);
					setColor(111,6379,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("2181") != -1){	//zookeeper
					//alert(item.hostid + "   " + item.itemid);
					setColor(111,2181,item.hostid,item.itemid,item.lastvalue)
				}else if(item.key_.indexOf("8080") != -1){	//tomcat
					//alert(item.hostid + "  " + item.itemid);
					setColor(111,8080,item.hostid,item.itemid,item.lastvalue);
				}	
			}
		}
	});
}
//设置颜色
function setColor(ip,port,hostid,itemid,lastValue){
	if(lastValue == 1){
		$("#status" + ip + "_" + port).html("正常");
		$("#status" + ip + "_" + port).css({"background": "green"});
	}else{
		$("#status" + ip + "_" + port).html("不正常");
		$("#status" + ip + "_" + port).css({"background": "red"});
		
	}
}

/**
* post基础工具类
**/
function post(param,func){
	$.ajax({
    type: 'POST',
    url: "http://10.1.100.113/zabbix/api_jsonrpc.php",
    data: JSON.stringify(param),
    success: function(result){
    	var json = eval(result);
    	if(func){
    		func(json);
    	}
    	//return json; 
    	//auth = json.result;
    	},
    dataType: "json",
    contentType: "application/json-rpc",
    timeout:60000,
    error: function(){}
}); 	
}
</script>
108
<div id="status108_2181"></div>
<div id="status108_6379"></div>
<div id="status108_8080"></div>


109
<div id="status109_2181"></div>
<div id="status109_6379"></div>
<div id="status109_8080"></div>


110
<div id="status110_2181"></div>
<div id="status110_6379"></div>
<div id="status110_8080"></div>

111
<div id="status111_2181"></div>
<div id="status111_6379"></div>
<div id="status111_8080"></div>



</html>
