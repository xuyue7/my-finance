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
					url: '${BASE_PATH}/admin/coupons/coupons_index_data',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'id',
							title: 'ID',
							align: 'center'
						},{
							field: 'uid',
							title: '用户ID',
							align: 'center'
						},
						{
							field: 'userName',
							title: '用户姓名',
							align: 'center'
						}, {
							field: 'id',
							title: '优惠卷ID',
							align: 'center',
							templet: '#id',
						}, {
							field: 'count',
							title: '兑换所需积分',
							align: 'center',
							templet: '#count',
						},
						{
							field: 'decribe',
							title: '描述',
							align: 'center',
							templet: '#decribe'
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
					var id = data.id;
					if(obj.event === 'info') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: 'user_coupons_detail?id=' + id+'&uid='+uid
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								querySearch: $("#demoReload").val(),
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
		
		<script type="text/html" id="count">
			{{d.coupons.count}}
		</script>
		<script type="text/html" id="id">
			{{d.coupons.id}}
		</script>
		<script type="text/html" id="decribe">
			{{d.coupons.decribe}}
		</script>
		
	</body>

</html>