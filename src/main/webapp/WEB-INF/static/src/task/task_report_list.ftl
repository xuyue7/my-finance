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
							<form class="layui-form">
							<div class="test-table-reload-btn" style="margin-bottom: 10px;">
								<div class="layui-input-inline">
									<div class="demoTable">
										<div class="layui-inline">
											<input class="layui-input" name="title" id="demoReload" autocomplete="off" placeholder="请输入举报内容...">
										</div>
										<!--<div class="layui-inline">
											<div class="layui-input-inline">
												<select id="statue" lay-verify="required" lay-search="">
													<option value="">举报状态</option>
													<option value="0">已处理</option>
													<option value="1">未处理</option>
												</select>
											</div>
										</div>-->
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
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">前往查看</a>
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

				var dicTable = table.render({
					method: 'post',
					elem: '#test-table-resetPage',
					id: 'testReload',
					request: {
						pageName: 'pageNum' //页码的参数名称，默认：page
							,
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/task_report/table_task_report_list',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'taskTitle',
							title: '任务标题',
							align: 'center'
						}, {
							field: 'userName',
							title: '举报用户',
							align: 'center'
						}, {
							field: 'content',
							title: '举报内容',
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
					var taskId = data.taskId;
					var taskTypeId = data.taskTypeId;
					var uid = data.userId;
					if(obj.event === 'info') {
						layer.open({
							type: 2,
							title: '任务详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '90%'],
							content: '${BASE_PATH}/admin/task/task_info?taskId=' + taskId
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								content: $("#demoReload").val()
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