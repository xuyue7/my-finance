<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>新增</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
		<link rel="stylesheet" type="text/css" href="${BASE_PATH}/static/lib/froala/css/font-awesome.css">
		<link href="${BASE_PATH}/static/lib/froala/css/froala_editor.min.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-body" pad15>
							<fieldset class="layui-elem-field layui-field-title">
								<legend>新增</legend>
							</fieldset>
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">链接地址<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="hidden" name="taskTypeId" value="${entity.bannerId}">
										<input type="text" name="taskTitle" value="${entity.bannerHref}" lay-verify="taskTitle" class="layui-input" placeholder="请输入图片链接地址">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">图片<span style="color: red;">*</span></label>
									<div class="layui-input-inline" style="width:80%"><textarea name="taskBody" id="editor">${entity.bannerUrl}</textarea><!--<section id="editor"></section>--></div>
								</div>
					            <div class="layui-form-item">
					                <div class="layui-input-block">
						                 <button class="layui-btn" lay-submit lay-filter="ff">保存</button>
						                 <button class="layui-btn" onclick="reload()">返回</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/jquery.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/froala_editor.min.js"></script>
		<script type="text/javascript" src="${BASE_PATH}/static/lib/froala/js/langs/zh_cn.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/tables.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/lists.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/colors.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/media_manager.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/font_family.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/font_size.min.js"></script>
		<script src="${BASE_PATH}/static/lib/froala/js/plugins/block_styles.min.js"></script>
		<script>
			$(function() {
				$('#editor').editable({
					inlineMode: false,
					theme: 'gray',
					height: '300px',
					language: 'zh_cn',
					imageUploadURL:'${BASE_PATH}/upload/photoEditor'
				});
			})
		</script>
		<script>
			layui.use(['jquery', 'form', 'layer', 'upload','jquery'], function() {
				var $ = layui.jquery;
				var form = layui.form;
				var layer = layui.layer;
				var upload = layui.upload;
				var admin = layui.admin;
				
				//验证
				form.verify({
					taskTitle: function(value) {
						if(value.length < 1) {
							return '请输入正确的类型名称';
						}
					},
				});

				//提交
				form.on('submit(ff)', function(data) {
					$.ajax({
						type: 'post',
						url: '${BASE_PATH}/front/wxuser/banner',
						data: data.field,
						success: function(res) {
							if(res.code == 0) {
								layer.msg(res.msg, {
									offset: '15px',
									icon: 1,
									time: 1000
								}, function() {
									window.parent.location.reload();
								});
							}
						}
					})
				})
				
			});
			
			//关闭弹窗
			function reload(){
				parent.location.reload();
			}
		</script>
	</body>

</html>