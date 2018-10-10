<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
    <script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
    <title>新增积分规则</title>
</head>

<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
        <legend>新增用户优惠卷</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="" id="addfrom" style="margin-left:5%">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" id="ruleId" value="${integral.ruleId}"  autocomplete="off" autocomplete="off" class="layui-input layui-hide">
            </div>
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" id="title" value="${integral.title}"  autocomplete="off" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">积分数</label>
            <div class="layui-input-inline">
                <input type="text"  id="count" value="${integral.count}" lay-verify="required" placeholder="请输入所得积分" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入描述内容..." class="layui-textarea" id="describe">${integral.content}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="demo1" id="add">提交</button>
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
			var table = layui.table;
            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
			
		
            //监听提交
            form.on('submit(demo1)', function (data) {
                layer.confirm('您确认要提交吗？', {
				  btn: ['确认','取消'] //按钮
				}, function(){
				   $.ajax({
                    	url:'${BASE_PATH}/admin/integral/add_rule_data',
                    	data:{ruleId:$("#ruleId").val(),title:$("#title").val(),count:$("#count").val(),content:$("#describe").val()},
                    	success:function(res){
                     	console.log(res.msg);
                     	if(res.code == 1){
                     			layer.msg(res.msg,{icon: 1,time: 500});
				                     	 setTimeout(function () {
								        var index = parent.layer.getFrameIndex(window.name);
								        parent.layer.close(index);
								        parent.layui.table.reload('testReload');
								    }
								        , 1100);
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