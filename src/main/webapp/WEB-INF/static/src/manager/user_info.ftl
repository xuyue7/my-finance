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

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-body" pad15>
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">角色<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="username" value="${user.name}" lay-verify="user_name" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">登陆账号<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="username" value="${user.userName}" lay-verify="user_name" class="layui-input">
									</div>
								</div>
					            <div class="layui-form-item" style="text-align: center;">
					                <div class="layui-input-block" style="margin-left: 0;">
					                  <a class="layui-btn layui-btn-primary" id="back">返回</a>
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
			});
		</script>
	</body>

</html>