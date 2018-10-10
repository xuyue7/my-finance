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
		<script type="text/html" id="test-table-operate-barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">查看</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="task">查看评价</a>
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
						pageName: 'pageNum',
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/user/table_task_list_uid?uid=${uid}',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'taskTitle',
							title: '标题',
							align: 'center'
						}, {
							field: 'userName',
							title: '发布用户',
							align: 'center'
						}, {
							field: 'typeName',
							title: '类型',
							align: 'center'
						}, {
							field: 'statueName',
							title: '任务状态',
							align: 'center',
							templet: '#state'
						}, {
							field: 'delStateName',
							title: '是否违规',
							align: 'center',
							templet: '#delState'
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
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '90%'],
							content: 'task_info?taskId=' + taskId + "&taskTypeId=" + taskTypeId + "&uid=" + uid
						});
					}
					if(obj.event === 'task') {
						layer.open({
							type: 2,
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '90%'],
							content: '${BASE_PATH}/admin/assess/assess_list?taskId=' + taskId
						});
					}
				});

				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								taskTitle: $("#demoReload").val(),
								userName:$("#uName").val(),
								statue:$("#statue").val(),
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
	</body>

</html>