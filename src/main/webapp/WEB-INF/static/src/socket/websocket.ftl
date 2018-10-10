<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>webScocket一对一聊天</title>
		<script type="text/javascript">
			var websocket = null;

			function login() {
				if('WebSocket' in window) {
					var sendUser = document.getElementById("sendUser").value;
					document.getElementById("sendUser").disabled = true;
					websocket = new WebSocket("ws://localhost:8080/chatDemo/" + sendUser);
				} else {
					alert('Not support websocket')
				}

				//连接发生错误的回调方法
				websocket.onerror = function() {
					document.getElementById('status').innerHTML = "error";
				};

				//连接成功建立的回调方法
				websocket.onopen = function(event) {
					document.getElementById('status').innerHTML = "连接服务器成功";
				}

				//接收到消息的回调方法
				websocket.onmessage = function(event) {
					//判断分割是统计人数还是显示消息
					if(event.data.indexOf("count") > -1) {
						var msg = event.data;
						var data = msg.split(":");
						document.getElementById('count').innerHTML = data[1];
					} else {
						setMessageInnerHTML(event.data);
					}
				}

				//连接关闭的回调方法
				websocket.onclose = function() {
					document.getElementById('status').innerHTML = "连接被成功关闭";
				}

				//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
				window.onbeforeunload = function() {
					websocket.close();
				}
			}
			//将消息显示在网页上
			function setMessageInnerHTML(innerHTML) {
				document.getElementById('showMsg').innerHTML += innerHTML;
			}

			//关闭连接

			//发送消息
			function send() {
				var sendUser = document.getElementById("sendUser").value;
				var toUser = document.getElementById("toUser").value;
				var message = document.getElementById("message").value;

				var jsonMsg = {
					"sendUser": sendUser,
					"toUser": toUser,
					"message": message
				}
				websocket.send(JSON.stringify(jsonMsg));

				document.getElementById('showMsg').innerHTML += message;
			}
			
						
		</script>
	</head>

	<body>
		账　号:<input type="text" name="sendUser" id="sendUser" />
		<input type="button" id="login" value="登录" onclick="login()" />
		<input type="button" onclick="closeWebSocket()" value="退出" /> 在线人数:
		<font id="count"></font>　　　连接状态:
		<font id="status"></font>

		<br/> 接收人:
		<input type="text" name="toUser" id="toUser" /><br/> 消息框:
		<br/>
		<textarea rows="5" cols="5" id="showMsg" name="showMsg" disabled="disabled" style="width: 302px; height: 111px; "></textarea><br/>
		<textarea rows="5" cols="5" id="message" name="sendMsg" style="width: 302px; height: 111px; "></textarea><br/>
		<input type="button" value="发送" onclick="send()" />　<input type="button" value="关闭" onclick="closeWebSocket()" />
	</body>

</html>