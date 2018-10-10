<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
    <script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
    <title>新增优惠卷</title>
</head>

<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
        <legend>新增用户优惠卷</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="" style="margin-left:5%">
    	<div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="id" id="id" value="${coupons.id}" autocomplete="off" class="layui-input layui-hide">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所需积分</label>
            <div class="layui-input-inline">
                <input type="text" name="count" id="count" value="${coupons.count}" autocomplete="off" lay-verify="required" placeholder="请输入兑换所需积分" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">有效期</label>
            <div class="layui-input-inline">
                <input type="text" name="inDate" id="inDate" value="${coupons.inDate}" lay-verify="required" placeholder="请输入有效期（天）" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价值</label>
            <div class="layui-input-inline">
                <input type="text" name="value"  id="value" value="${coupons.value}"  lay-verify="required" placeholder="请输入价值（元）" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">优惠卷描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入描述内容..." class="layui-textarea" id="describe">${coupons.decribe}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="demo1" >提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" id="back">返回</button>
        </div>
    </form>

    <script>
        layui.use(['form', 'layedit', 'laydate'], function () {
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
                    	url:'${BASE_PATH}/admin/coupons/add_coupons_rule',
                    	data:{id:$("#id").val(),count:$("#count").val(),decribe:$("#describe").val(),inDate:$("#inDate").val(),value:$("#value").val()},
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
				}, function(){
					layer.msg('已取消..',{icon: 2,time: 500});
					 return false;
				});
                return false;
            });
            
            //返回
             $("#back").click(function(){
                var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
            })
        });
    </script>
</body>

</html>