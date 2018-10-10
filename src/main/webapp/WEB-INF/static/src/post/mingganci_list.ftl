<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
	</head>

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
					
						<div class="layui-card-body">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>敏感词</legend>
							</fieldset>
								<button onclick="send()">发送消息</button>
		<div id="message"></div>
							<div class="test-table-reload-btn" style="margin-bottom: 10px;">
						<button class="layui-btn layui-btn-normal" id="insert"><i class="layui-icon">&#xe654;</i>新增敏感词</button>
							<!--<button class="layui-btn layui-btn-normal" id="insert2"><i class="layui-icon">&#xe654;</i>添加敏感词</button>-->
								<div class="layui-input-inline">
									<div class="demoTable">
										<div class="layui-inline">
											<input class="layui-input" name="title" id="demoReload" autocomplete="off" placeholder="请输入敏感词...">
										</div>
										
										<a class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i></a>
									</div>
								</div>
							</div>
							<div class="layui-input-inline">
								<!--<button class="layui-btn layui-btn-normal resAdd_btn"><i class="layui-icon larry-icon larry-xinzeng1"></i>添加敏感词</button>-->
							</div>
							
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script type="text/html" id="test-table-operate-barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">编辑</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">删除</a>
		</script>
		<script>
			layui.config({
				base: '../../static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'table', 'jquery', 'form'], function() {
				var admin = layui.admin,
					table = layui.table;
				var $ = layui.jquery;
				var form = layui.form;
				
				//新增
				$("#insert").on("click", function() {
				
					layer.open({
						type: 2,
						title: '<i class="layui-icon">&#xe654;</i>新增',
						shadeClose: true,
						shade: 0.8,
						area: ['40%', '40%'],
						content: '${BASE_PATH}/admin/minganci/toAdd',
						end: function() {}
					});
				})

				var dicTable = table.render({
					method: 'post',
					elem: '#test-table-resetPage',
					id: 'testReload',
					request: {
						pageName: 'pageNum' //页码的参数名称，默认：page
							,
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/minganci/findAll',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'content',
							title: '敏感词',
							align: 'center'
						},  
						
						
						
						{
							align: 'center',
							title: '操作',
							toolbar: '#test-table-operate-barDemo'
						}]
					]

				});
				
				
				
				
			
			
			
				
				
				table.on('tool(shop)', function(obj) {
					var data = obj.data;
					var id = data.id;
	
					if(obj.event === 'info') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['40%', '40%'],
							content: 'findById?id=' + id 
						});
					}
					
					if(obj.event === 'delete') {
						$.ajax({
							type:'post',
							url:'${BASE_PATH}/admin/minganci/doDelete',
							data:{
								id:id
							},
							success: function(res) {
									layer.msg("已删除", {
									time: 500
								});
								setTimeout(function() {

									location.replace(location.href);
									return false;
								}, 500);

							
							}
						
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								content: $("#demoReload").val(),
								
							}
						});
					}
				};

				$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});

			});
		</script>
		<script type="text/html" id="state">
		  {{#  if(d.statue === 0){ }}
		    <span style="color: #8bc34a;">{{ d.statueName }}</span>
		  {{#  } else if(d.statue === 1){ }}
		    <span style="color: #ff0000;">{{ d.statueName }}</span>
	      {{#  } else if(d.statue === 2){ }}
		    <span style="color: #2196f3;">{{ d.statueName }}</span>
		  {{#  } }}
		</script>
		<script type="text/html" id="delState">
		  {{#  if(d.delState === 0){ }}
		    <span style="color: #8bc34a;">{{ d.delStateName }}</span>
		  {{#  } else if(d.delState === 1){ }}
		    <span style="color: #ff0000;">{{ d.delStateName }}</span>
		  {{#  } }}
		</script>
		
		
		<script type="text/html" id="jubao_state">
		  {{#  if(d.jubao_state === 1){ }}
			 <span style="color: #ff0000;">被举报</span>
		  {{#  } else { }}
		   <span style="color: #2196f3;">未被举报</span>
		  {{#  } }}
		</script>
	
	
	<script type="text/html" id="creattime">
	   {{getDate(d.creattime)}}   
	</script>
	<script type="text/javascript">  
	
	
		function getDate(tm){   
   			 var date=new Date(tm); 
      
    		Y = date.getFullYear() + '-';
       		 M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
       		 D = (date.getDate()<10 ? '0'+(date.getDate() ): date.getDate()) + ' ';
       		 h = (date.getHours()<10 ? '0'+(date.getHours() ): date.getHours()) + ':';
       		 m = (date.getMinutes()<10 ? '0'+(date.getMinutes() ): date.getMinutes()) + ':';
       		 s = (date.getSeconds()<10 ? '0'+(date.getSeconds() ): date.getSeconds());
       
       		 return Y+M+D+h+m+s;   
		}  
	</script>
	
	
	
	<script type="text/javascript">
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
	//	websocket = new WebSocket("ws://172.16.101.117:8080/socketTest");
	websocket = new WebSocket("ws://172.16.101.117:8080/websocket/2/to");
		
	} else {
		alert('当前浏览器 Not support websocket')
	}

	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMessageInnerHTML("WebSocket连接发生错误");
	};

	//连接成功建立的回调方法
	websocket.onopen = function() {
		setMessageInnerHTML("WebSocket连接成功");
		var uid=1;
		websocket.send(uid);
	}

	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		setMessageInnerHTML(event.data);
	}

	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessageInnerHTML("WebSocket连接关闭");
	}

	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket();
	}

	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
		document.getElementById('message').innerHTML += innerHTML + '<br/>';
	}

	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}

	//发送消息
	function send() {
		//var message = document.getElementById('text').value;
		var uid=1;
		websocket.send(uid);
	}
</script>
</body>

</html>