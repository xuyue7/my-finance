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
						<div class="layui-card-header">修改密码</div>
						<div class="layui-card-body" pad15>

							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">当前密码</label>
									<div class="layui-input-inline">
										<input type="password" id="old_pd" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">新密码</label>
									<div class="layui-input-inline">
										<input type="password" id="LAY_password" class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">6到16个字符</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">确认新密码</label>
									<div class="layui-input-inline">
										<input type="password" id="new_pd" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item" style="text-align: center;">
									<div class="layui-input-block" style="margin-left: 0;">
										<a class="layui-btn layui-btn-primary" id="sure">确认修改</a>
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
				
				//同意
				$("#sure").on("click", function() {
					var old_pd = $("#old_pd").val();
					var _newPd = $("#LAY_password").val();
					var new_pd = $("#new_pd").val();
					if(old_pd == null || old_pd == ""){
						layer.tips("请输入原密码","#old_pd");
					}else if(_newPd == null || _newPd == ""){
						layer.tips("请输入新密码","#LAY_password");
					}else if(_newPd.length >12 || _newPd.length <6){
						layer.tips("密码必须6到12位","#LAY_password");
					}else if(new_pd == null || new_pd == ""){
						layer.tips("请确认新密码","#new_pd");
					}else if(new_pd.length >12 || new_pd.length <6){
						layer.tips("密码必须6到12位","#new_pd");
					}else {
						$.ajax({
							type:'post',
							url:'${BASE_PATH}/admin/manager/ajax_update_pd',
							data:{old_pd:old_pd,new_pd:new_pd},
							success:function(res){
								if(res.code == 0){
									layer.tips(res.msg,"#old_pd");
								}else if(res.code == 1) {
									layer.msg(res.msg, {
										offset: '15px',
										icon: 1,
										time: 1000
									}, function() {
										parent.location.reload();
									});
								}
							}
						})
					}
				})
				
				
			});
		</script>
	</body>

</html>