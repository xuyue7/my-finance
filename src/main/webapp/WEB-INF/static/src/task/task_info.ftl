<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>设置我的资料</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
	</head>
	
	<style type="text/css">
		.layui-form-item .layui-input-inline {
			float: left;
			width: 60%;
			margin-right: 10px;
		}
	</style>

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-header">用户${task.userName}发布的${task.taskTitle}</div>
						<div class="layui-card-body" pad15>
							<input type="hidden" id="taskId" value="${task.taskId}">
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">标题<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="username" value="${task.taskTitle}" lay-verify="user_name" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">发布用户<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="username" value="${task.userName}" lay-verify="user_name" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">类型<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.typeName}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">金额<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.money}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务状态<span style="color: red;">*</span></label>
									<div class="layui-input-block">
										<input type="radio" title="已完成" [#if task.statue = 2]checked[/#if] disabled="">
										<input type="radio" title="进行中" [#if task.statue = 1]checked[/#if] disabled="">
										<input type="radio" title="已发布" [#if task.statue = 0]checked[/#if] disabled="">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务人数<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.taskMen}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务起始地<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.startAddr}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务目的地<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.stopAddr}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务开始时间<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.startTime?string("yyyy-MM-dd HH:mm:ss")}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务结束时间<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.stopTime?string("yyyy-MM-dd HH:mm:ss")}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">任务发布时间<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${task.time?string("yyyy-MM-dd HH:mm:ss")}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								[#if task.delState == 0]
					            <div class="layui-form-item" style="text-align: center;">
					                <div class="layui-input-block" style="margin-left: 0;">
					                	<a class="layui-btn layui-btn-primary" id="del">违规删除</a>
					                    <a class="layui-btn layui-btn-primary" id="back">返回</a>
									</div>
								</div>
								[/#if]
								[#if task.delState == 1]
								<blockquote class="layui-elem-quote layui-quote-nm">
									该任务已违规，已做删除处理！
								</blockquote>
					            <div class="layui-form-item" style="text-align: center;">
					                <div class="layui-input-block" style="margin-left: 0;">
					                  <a class="layui-btn layui-btn-primary" id="back">返回</a>
									</div>
								</div>
								[/#if]
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script>
			layui.config({
				base: '../../lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['jquery', 'form', 'layer'], function() {
				$ = layui.jquery;
				form = layui.form;
				$form = $('form');
				var layer = layui.layer;
				
				$("#back").on("click",function(){
					var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                    parent.layui.table.reload('testReload',{pageNum:{curr:1}});
				})
				
				$('.images').on("click",function(){
					var url = $(this).attr("src");
					layer.open({
						type: 1,
						title: false,
						closeBtn: 0,
						area: ['25%'],
						skin: 'layui-layer-nobg', //没有背景色
						shadeClose: true,
						content: '<img class="images" src="${BASE_PATH}' +url+ '" style="width:100%;">'
					});
				})
				
				//违规删除
				$("#del").on("click", function() {
					var taskId = $("#taskId").val();
					$.ajax({
						type: 'post',
						url: 'del',
						data: {
							taskId: taskId
						},
						success: function(res) {
							if(res.code == 0) {
								layer.msg(res.msg, {
									offset: '15px',
									icon: 1,
									time: 1000
								}, function() {
									var index = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
									parent.layui.table.reload('testReload', {
										pageNum: {
											curr: 1
										}
									});
								});
							}
						}
					})
				})

			});
		</script>
	</body>

</html>