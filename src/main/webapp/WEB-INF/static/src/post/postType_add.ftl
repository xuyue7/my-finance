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
						<div class="layui-card-header">添加分类</div>
						<div class="layui-card-body" pad15>
							<input type="hidden" id="taskId" value="${task.taskId}">
							<div class="layui-form" lay-filter="">
								<div class="layui-form-item">
									<label class="layui-form-label">分类<span style="color: red;">*</span></label>
									<div class="layui-input-inline">
										<input type="text" id="content" value=""  lay-verify="title" class="layui-input">
									</div>
								</div>
								
								
					<div class="layui-upload">
						<label class="layui-form-label" >分类图片</label>
						<button type="button" class="layui-btn layui-btn-normal" id="picturef"><i class="layui-icon">&#xe654;</i>选择图片</button>
						<div class="layui-upload-list">
							<input type="hidden" lay-verify="picture" name="picturef" id="company_logo_int1" value="" />
						</div>

							<div id="company_logo_img1"  class="tupian" style="margin-left: 25%;"></div>
				
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
			}).use(['jquery', 'form','layedit', 'layer','upload'], function() {
				$ = layui.jquery;
				form = layui.form;
				layedit = layui.layedit,
				$form = $('form');
				var layer = layui.layer;
				upload = layui.upload;
			
			
			
			//图片
			var uploadInst = upload.render({
			
				elem: '#picturef' //绑定元素
					,
				url: '${BASE_PATH}/admin/postType/photo.json' //上传接口
					,
				done: function(res) {
					if(res.success === true) {
						$("#company_logo_img1").html('<img src="${BASE_PATH}/' + res.t + '" class="layui-upload-img images" style="width: 200px;height:200px;"/>');
						$("#company_logo_int1").val(res.t);
					}
				},
				error: function() {
					//请求异常回调
				}
			});
			
			
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
		//自定义验证规则		
	 form.verify({
     	 title: function(value){
        if(value.length < 2){
          return '分类名不能为空';
        }
      }
      ,pass: [/(.+){6,12}$/, '密码必须6到12位']
      ,content: function(value){
        layedit.sync(editIndex);
      }
    });
			form.on("submit(demo1)", function(data) {
				var picturef = $("#company_logo_int1").val();
			
				var content=$("#content").val();
				$.ajax({
					url: '${BASE_PATH}/admin/postType/doInsert',
					type: 'post',
					async: false,
					data: {
					typeName:content,
					imag:picturef
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