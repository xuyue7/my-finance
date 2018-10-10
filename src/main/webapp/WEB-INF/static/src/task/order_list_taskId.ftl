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
						<!--<div class="layui-card-header">店铺管理</div>-->
						<div class="layui-card-body">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>任务列表</legend>
							</fieldset>
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
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

				var dicTable = table.render({
					method: 'post',
					elem: '#test-table-resetPage',
					id: 'testReload',
					request: {
						pageName: 'pageNum',
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/order/table_order_list_taskId?taskId=${taskId}',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'title',
							title: '任务标题',
							align: 'center'
						}, {
							field: 'uName',
							title: '发布用户',
							align: 'center'
						}, {
							field: 'orderNumber',
							title: '订单号',
							align: 'center'
						}, {
							field: 'price',
							title: '收入',
							align: 'center',
						}, {
							field: 'c_time',
							title: '接单时间',
							align: 'center',
						}
						, {
							field: 'o_time',
							title: '完成时间',
							align: 'center',
						}
						, {
							field: 'stateName',
							title: '订单状态',
							align: 'center',
							templet:'#statue'
						}]
					]

				});


			});
		</script>
		<script type="text/html" id="statue">
		  {{#  if(d.state === 0){ }}
		    <span style="color: #8bc34a;">{{ d.stateName }}</span>
		  {{#  } else if(d.state === 1){ }}
		    <span style="color: #ff0000;">{{ d.stateName }}</span>
		  {{#  } }}
		</script>
	</body>

</html>