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
							<div class="test-table-reload-btn" style="margin-bottom: 10px;">
								<button class="layui-btn layui-btn-primary" id="insert"><i class="layui-icon">&#xe654;</i>新增分类</button>
								<div class="layui-input-inline">
									<div class="demoTable">
										<div class="layui-inline">
											<input class="layui-input" name="title" id="demoReload" autocomplete="off" placeholder="请输入分类...">
										</div>
										<button class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
									</div>
								</div>
							</div>
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script type="text/html" id="test-table-operate-barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">查看</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
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
						area: ['90%', '90%'],
						content: 'task_type_add',
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
					url: '${BASE_PATH}/admin/task/table_task_type_list',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'taskTitle',
							title: '分类',
							align: 'center'
						}, {
							field: 'taskBody',
							title: '描述',
							align: 'center'
						}, {
							align: 'center',
							title: '操作',
							toolbar: '#test-table-operate-barDemo'
						}]
					]

				});

				table.on('tool(shop)', function(obj) {
					var data = obj.data;
					var taskTypeId = data.taskTypeId;
					if(obj.event === 'info') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '90%'],
							content: 'task_type_edit?taskTypeId=' + taskTypeId
						});
					}
					if(obj.event === 'del') {
						var index = layer.open({
							content: '确定删除吗？',
							yes: function(index, layero) {
								$.ajax({
									type: 'post',
									url: 'ajax_task_type_del',
									data: {
										taskTypeId: taskTypeId
									},
									async: false,
									success: function(res) {
										if(res.code == 0) {
											layer.close(index);
											layui.table.reload('testReload', {
												pageNum: {
													curr: 1
												}
											});
										}
									}
								})
							}
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								taskTitle: $("#demoReload").val()
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
	</body>

</html>