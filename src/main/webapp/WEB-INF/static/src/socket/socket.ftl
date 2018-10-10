<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="${BASE_PATH}/static/lib/froala/js/jquery.min.js"></script>
		<script type="text/javascript">
			var ws;
			var userName = '${username}';
			//通过URL请求服务端（chat为项目名称）
			var url = "ws://localhost:8080/echo?username=${username}";

			//进入聊天页面就是一个通信管道
			window.onload = function() {
				if('WebSocket' in window) {
					ws = new WebSocket(url);
				} else if('MozWebSocket' in window) {
					ws = new MozWebSocket(url);
				} else {
					alert('WebSocket is not supported by this browser.');
					return;
				}

				//监听服务器发送过来的所有信息
				ws.onmessage = function(event) {
					console.dir(event)
					eval("var result=" + event.data);

					//如果后台发过来的alert不为空就显示出来
					if(result.alert != undefined) {
						$("#content").append(result.alert + "<br/>");
					}

					//如果用户列表不为空就显示
					if(result.names != undefined) {
						//刷新用户列表之前清空一下列表，免得会重复，因为后台只是单纯的添加
						$("#userList").html("");
						$(result.names).each(
							function() {
								$("#userList").append(
									"<input  type=checkbox  value='" + this + "'/>" +
									this + "<br/>");
							});
					}

					//将用户名字和当前时间以及发送的信息显示在页面上
					if(result.from != undefined) {
						$("#content").append(
							result.from + " " + result.date + " 说：<br/>" +
							result.sendMsg + "<br/>");
					}

				};
			};

			//将消息发送给后台服务器
			function send() {
				//拿到需要单聊的用户名
				//alert("当前登录用户为"+userName);
				var ss = $("#userList :checked");
				//alert("群聊还是私聊"+ss.size());
				var to = $('#userList :checked').val();
				if(to == userName) {
					alert("你不能给自己发送消息啊");
					return;
				}
				//根据勾选的人数确定是群聊还是单聊
				var value = $("#msg").val();
				//alert("消息内容为"+value);
				var object = null;
				if(ss.size() == 0) {
					object = {
						msg: value,
						type: 1, 
					};
				} else {
					object = {
						to: to,
						msg: value,
						type: 2, //1 广播 2单聊    
					};
				}
				//将object转成json字符串发送给服务端
				var json = JSON.stringify(object);
				//alert("str="+json);
				ws.send(json);
				//消息发送后将消息栏清空
				$("#msg").val("");
			}
		</script>
	</head>

	<body>

		<h3>欢迎 ${username }使用本聊天系统！！</h3>

		<div id="content" style="border: 1px solid black; width: 400px; height: 300px; float: left; color: #7f3f00;"></div>
		<div id="userList" style="border: 1px solid black; width: 120px; height: 300px; float: left; color: #00ff00;"></div>

		<div style="clear: both;" style="color:#00ff00">
			<input id="msg" />
			<button onclick="send();">发送消息</button>
		</div>
	</body>

</html>