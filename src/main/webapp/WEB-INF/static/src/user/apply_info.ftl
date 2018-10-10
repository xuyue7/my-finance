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
						<div class="layui-card-header">用户${user.wxName}的资料</div>
						<div class="layui-card-body" pad15>
							<input type="hidden" id="uid" value="${user.uid}">
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">微信昵称<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="username" value="${user.wxName}" lay-verify="user_name" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">微信头像<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<img class="images" src="${user.wxPhoto}" style="width:50px;height:50px;" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">注册时间<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${user.c_time}" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">状态<span style="color: red;">*</span></label>
									<div class="layui-input-block">
										<input type="radio" title="启用" [#if user.state=0 ]checked[/#if] disabled="">
										<input type="radio" title="禁用" [#if user.state=0 ]checked[/#if] disabled="">
									</div>
								</div>
								<blockquote class="layui-elem-quote layui-quote-nm">
									用户${user.wxName}的实名信息
								</blockquote>
								<div class="layui-form-item">
									<label class="layui-form-label">电话号码<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input id="phone" type="text" name="cellphone" value="${user.phone}" lay-verify="phone" autocomplete="off" class="layui-input" placeholder="请输入手机号">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">身份证号<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" name="cellphone" lay-verify="identity" value="${user.idCard}" autocomplete="off" class="layui-input" placeholder="请输入身份证号" style="width: 150%;">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">身份证正面<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<img class="images" src="${user.idCardJust}" style="width:50px;height:50px;" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">身份证反面<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<img class="images" src="${user.idCardBack}" style="width:50px;height:50px;" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">全身照<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<img class="images" src="${user.idCardPhoto}" style="width:50px;height:50px;" />
									</div>
								</div>
								[#if user.applyState = 1]
								<div class="layui-form-item" style="text-align: center;">
									<div class="layui-input-block" style="margin-left: 0;">
										<a class="layui-btn layui-btn-primary" id="sure">同意</a>
										<a class="layui-btn layui-btn-primary" id="false">拒绝</a>
									</div>
								</div>
								[/#if] [#if user.applyState = 2]
								<blockquote class="layui-elem-quote layui-quote-nm">
									用户${user.wxName}实名认证已通过审核
								</blockquote>
								<div class="layui-form-item" style="text-align: center;">
									<a class="layui-btn layui-btn-primary" id="back">返回</a>
								</div>
							</div>
							[/#if] [#if user.applyState = 3]
							<blockquote class="layui-elem-quote layui-quote-nm">
								用户${user.wxName}实名认证已被拒绝，需重新提交实名资料进行审核
							</blockquote>
							<blockquote class="layui-elem-quote layui-quote-nm">
								拒绝理由：${user.reason}
							</blockquote>
							<div class="layui-form-item" style="text-align: center;">
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

				$("#back").on("click", function() {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
					parent.layui.table.reload('testReload', {
						pageNum: {
							curr: 1
						}
					});
				})

				$('.images').on("click", function() {
					var url = $(this).attr("src");
					layer.open({
						type: 1,
						title: false,
						closeBtn: 0,
						area: ['25%'],
						skin: 'layui-layer-nobg', //没有背景色
						shadeClose: true,
						content: '<img class="images" src="${BASE_PATH}' + url + '" style="width:100%;">'
					});
				})

				//同意
				$("#sure").on("click", function() {
					var uid = $("#uid").val();
					$.ajax({
						type: 'post',
						url: 'apply_sure',
						data: {
							uid: uid
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

				//拒绝
				$("#false").on("click", function() {
					layer.prompt({
						formType: 2
					}, function(text, index) {
						var uid = $("#uid").val();
						$.ajax({
							type: 'post',
							url: 'apply_false',
							data: {
								uid: uid,
								reason:text
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
					});
				})

			});
		</script>
	</body>

</html>