<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<title>帖子详情</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet"
	href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css"
	media="all">
<link rel="stylesheet"
	href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
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
					<div class="layui-card-header">用户 <span style="color: #2196f3;">${psot.wxUser.wxName}</span>发布的帖子</div>
					<div class="layui-card-body" pad15>
						<input type="hidden" id="taskId" value="${task.taskId}">
						<div class="layui-form" lay-filter="">
							<div class="layui-form-item">
								<label class="layui-form-label">标题<span
									style="color: red;">*</span></label>
								<div class="layui-input-inline">
									<input type="text" name="title" value="${psot.title}" readonly
										lay-verify="title1" class="layui-input">
								</div>
							</div>


							<div class="layui-form-item">
								<div class="layui-inline" style="width: 100%;">
									<label class="layui-form-label">内容<span
										style="color: red;">*</span></label>
									<div class="layui-input-inline">

										<textarea id="demo" style="display: none;">${psot.content}</textarea>
									</div>
								</div>
							</div>

							<div class="layui-form-item" style="text-align: center;">
								<div class="layui-input-block" style="margin-left: 0;">
									<a class="layui-btn layui-btn-primary" id="back">返回</a>
									<!-- <button  class="layui-btn site-demo-layedit" data-type="content" lay-submit="" lay-filter="demo1">保存</button>-->

								</div>
							</div>

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
			}).use(['jquery', 'form','layedit', 'layer'], function() {
				$ = layui.jquery;
				form = layui.form;
				layedit = layui.layedit,
				$form = $('form');
				var layer = layui.layer;
				
				
				
				
		

			var content;
			var index = layedit.build('demo', {
				height: 400,
				
			});
			//编辑器外部操作
			var active = {
				content: function() {
					content = layedit.getContent(index);
				}
			};
			
			$('.site-demo-layedit').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
			
			
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