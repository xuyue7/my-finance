<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
    <script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
    <title>layui测试</title>
</head>

<body>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>新增客服</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="" style="margin-left: 7%">
    	<div class="layui-input-inline">
                <input type="text" name="id" id="id"  l autocomplete="off" value="${c.id}"  class="layui-input layui-hide">
            </div>
        <div class="layui-form-item" >
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" id="name" value="${c.name}"  lay-verify="required" autocomplete="off" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input type="text" name="tel" id="tel" value="${c.tel}" lay-verify="required|phone" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" id="back">返回</button>
        </div>
    </form>

    <script>
        layui.use(['form', 'layedit', 'laydate','jquery'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;
             var $ = layui.jquery;

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            //监听提交
            form.on('submit(demo1)', function (data) {
                layer.confirm('您确认要提交吗？', {
				  btn: ['确认','取消'] //按钮
				}, function(){
				   $.ajax({
                    	url:'${BASE_PATH}/admin/customer/add_customer',
                    	data:{id:$("#id").val(),name:$("#name").val(),tel:$("#tel").val()},
                    	success:function(res){
                     	console.log(res.msg);
                     	if(res.code == 1){
                     		layer.msg(res.msg,{icon: 1,time: 500});
				            setTimeout(function () {
								  var index = parent.layer.getFrameIndex(window.name);
								   parent.layer.close(index);
								    parent.layui.table.reload('testReload');
								  }, 1100);
		                   }
                    }
                })
				},function(){
					layer.msg('已取消..',{icon: 2,time: 500});
					 return false;
				});
                return false;
            });
            
             $("#back").click(function(){
        		var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
        	})
        });
       
    </script>
</body>

</html>