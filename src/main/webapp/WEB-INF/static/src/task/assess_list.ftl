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
	<style>
		.star-rating {
			unicode-bidi: bidi-override;
			color: #ddd;
			font-size: 0;
			height: 25px;
			margin: 0 auto;
			position: relative;
			display: table;
			padding: 0;
			text-shadow: 0px 1px 0 #a2a2a2;
		}
		
		.star-rating span {
			padding: 5px;
			font-size: 20px;
		}
		
		.star-rating span:after {
			content: "★";
		}
		
		.star-rating-top {
			color: #FFD700;
			padding: 0;
			z-index: 1;
			display: block;
			top: 0;
			left: 0;
			overflow: hidden;
			white-space: nowrap;
		}
		
		.star-rating-bottom {
			padding: 0;
			display: block;
			z-index: 0;
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
								<legend>评价</legend>
							</fieldset>
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script type="text/html" id="test-table-operate-barDemo">
			  {{#  if(d.delState === 0){ }}
			    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="info">违规删除</a>
			  {{#  } else if(d.delState === 1){ }}
			    <span style="color: #ff0000;">该评价已违规，已做删除处理！</span>
			  {{#  } }}
		</script>
		<script>
			layui.config({
				base: '../../static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'table', 'jquery', 'form','rate'], function() {
				var admin = layui.admin,
					table = layui.table;
				var $ = layui.jquery;
				var form = layui.form;
				var rate = layui.rate;
				
				
				rate.render({
				   elem: '#test1'
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
					url: '${BASE_PATH}/admin/assess/table_assess__list_uid?uid=${uid}&taskId=${taskId}',
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
							title: '评价用户',
							align: 'center'
						}, {
							field: 'number',
							title: '评分',
							align: 'center',
							templet: '#num'
						}, {
							field: 'content',
							title: '评价内容',
							align: 'center',
						}, {
							field: 'delStateName',
							title: '状态',
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
					var assessId = data.assessId;
					if(obj.event === 'info') {
						$.ajax({
							type: 'post',
							url: 'ajax_del',
							data: {
								assessId: assessId
							},
							success: function(res) {
								if(res.code == 0) {
									layer.msg(res.msg, {
										offset: '15px',
										icon: 1,
										time: 1000
									}, function() {
										var index = layer.getFrameIndex(window.name);
										layer.close(index);
										layui.table.reload('testReload', {
											pageNum: {
												curr: 1
											}
										});
									});
								}
							}
						})
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
		<script type="text/html" id="delState">
		  {{#  if(d.delState === 0){ }}
		    <span style="color: #8bc34a;">{{ d.delStateName }}</span>
		  {{#  } else if(d.delState === 1){ }}
		    <span style="color: #ff0000;">{{ d.delStateName }}</span>
		  {{#  } }}
		</script>
		<script type="text/html" id="num">
			<div class="star-rating">
				<div class="star-rating-top" style="width:{{d.number * 2}}0%">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>
				<div class="star-rating-bottom">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
		</script>
	</body>

</html>