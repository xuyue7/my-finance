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
	
	<style type="text/css">
		.layui-table-cell {
			height: 48px;
			line-height: 48px;
		}
	</style>

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<!--<div class="layui-card-header">店铺管理</div>-->
						<div class="layui-card-body">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>用户列表</legend>
							</fieldset>
							<form class="layui-form">
								<div class="test-table-reload-btn" style="margin-bottom: 10px;">
									<div class="layui-input-inline">
										<div class="demoTable">
											<div class="layui-inline">
												<input class="layui-input" id="demoReload" autocomplete="off" placeholder="请输入用户昵称...">
											</div>
											<div class="layui-inline">
												<div class="layui-input-inline">
													<select id="statue" lay-verify="required" lay-search="">
														<option value="">启用/禁用</option>
														<option value="0">启用</option>
														<option value="1">禁用</option>
													</select>
												</div>
											</div>
											<div class="layui-inline">
												<div class="layui-input-inline">
													<input type="text" name="oldTime" class="layui-input oldTime" id="test1" placeholder="注册起始时间">
												</div>
											</div> -
											<div class="layui-inline">
												<div class="layui-input-inline">
													<input type="text" name="newTime" class="layui-input newTime" id="test2" placeholder="注册结束时间">
												</div>
											</div>
											<a class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i></a>
										</div>
									</div>
								</div>
							</form>
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script type="text/html" id="test-table-operate-barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">详情</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="open">他发布的任务</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="order">订单</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="task">任务评价</a>
		</script>
		<script>
			layui.config({
				base: '../../static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'table', 'jquery', 'form','laydate'], function() {
				var admin = layui.admin,
					table = layui.table;
				var $ = layui.jquery;
				var form = layui.form;
				var laydate = layui.laydate;
				
				var ins21 = laydate.render({
					elem: '#test1',
					type: 'datetime'
				});
	
				var ins22 = laydate.render({
					elem: '#test2',
					type: 'datetime'
				});

				var dicTable = table.render({
					method: 'post',
					elem: '#test-table-resetPage',
					id: 'testReload',
					request: {
						pageName: 'pageNum' //页码的参数名称，默认：page
							,
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/user/table_user_list',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'wxName',
							title: '用户昵称',
							align: 'center'
						}, {
							field: 'wxPhoto',
							title: '头像',
							templet: '#imgurl',
							align: 'center'
						}, {
							field: 'c_time',
							title: '注册时间',
							align: 'center'
						}, {
							title: '状态',
							align: 'center',
							templet: '#stick1',
						}, {
							align: 'center',
							title: '操作',
							toolbar: '#test-table-operate-barDemo'
						}]
					]

				});

				table.on('tool(shop)', function(obj) {
					var data = obj.data;
					var uid = data.uid;
					if(obj.event === 'info') {
						layer.open({
							type: 2,
							title: '订单',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: 'user_info?uid=' + uid
						});
					}
					if(obj.event === 'images') {
						layer.open({
							type: 1,
							title: false,
							closeBtn: 0,
							area: ['70%'],
							skin: 'layui-layer-nobg', //没有背景色
							shadeClose: true,
							content: '<img lay-event="images" class="images" src="http://172.16.101.242:8080/' + data.wxPhoto+ '" style="width:100%;">'
						});
					}
					if(obj.event === 'task') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: '${BASE_PATH}/admin/assess/assess_list?uid=' + uid
						});
					}
					if(obj.event === 'open') {
						layer.open({
							type: 2,
							title: '他发布的任务',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: '${BASE_PATH}/admin/user/task_list_uid?uid=' + uid
						});
					}
					if(obj.event === 'order') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: '${BASE_PATH}/admin/order/order_list_uid?uid=' + uid
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								wxName: $("#demoReload").val(),
								state:$("#statue").val(),
								o:$(".oldTime").val(),
		                    	n:$(".newTime").val(),
							}
						});
					}
				};

				$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
				
				//启用/禁用
				form.on('switch(state)', function(obj) {
					var state = obj.elem.checked;
					var uid = $(this).attr("data-id");
					var statue;
				    if(state == true){
				    	statue = 0;
				    }else if(state == false){
				    	statue = 1;
				    }
					$.ajax({
						type: 'post',
						url: 'update_state',
						data: {
							state: statue,
							uid: uid
						},
						async: false,
						success: function(res) {
							if(res.code == 0) {
								layer.tips(res.msg, obj.othis);
							}
						}
					})
				});
				
			});
		</script>
		<script type="text/html" id="imgurl">
			<img lay-event="images" src="http://172.16.101.242:8080/{{d.wxPhoto}}" />
		</script>
		<script type="text/html" id="stick1">
			<input type="checkbox" data-id="{{d.uid}}" id="tips" value="{{d.state}}" lay-skin="switch" lay-text="启用|禁用" lay-filter="state" {{ d.state==0 ? 'checked' : '' }}>
		</script>
	</body>

</html>