<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>帖子详情</title>
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
						<div class="layui-card-header">添加敏感词</div>
						<div class="layui-card-body" pad15>
							<input type="hidden" id="taskId" value="${task.taskId}">
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">敏感词<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" id="content" value=""  lay-verify="title" class="layui-input">
									</div>
								</div>
								
								
							
							
					            <div class="layui-form-item" style="text-align: center;">
					                <div class="layui-input-block" style="margin-left: 0;">
					                  <a class="layui-btn layui-btn-primary" id="back">返回</a>
					         <button  class="layui-btn site-demo-layedit" data-type="content" lay-submit="" lay-filter="demo1">保存</button>
					                  
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
			
			
		//自定义验证规则		
	 form.verify({
     	 title: function(value){
        if(value.length < 2){
          return '敏感词不能为空';
        }
      }
      ,pass: [/(.+){6,12}$/, '密码必须6到12位']
      ,content: function(value){
        layedit.sync(editIndex);
      }
    });
			form.on("submit(demo1)", function(data) {
				
			
				var content=$("#content").val();
				$.ajax({
					url: '${BASE_PATH}/admin/minganci/doInsert',
					type: 'post',
					async: false,
					data: {
					content:content
					},
					success: function(res) {
						if(res.success == true) {
							
								layer.msg('保存成功', {
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
				});
				return false;
			});
				
		

			

			});
		</script>
	</body>

</html>