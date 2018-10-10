<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
	</head>
	
	<style type="text/css">
		.layui-table-cell {
			height: 48px;
			line-height: 48px;
		}
	</style>

	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<!--<div class="layui-card-header">店铺管理</div>-->
						<div class="layui-card-body">
							<fieldset class="layui-elem-field layui-field-title">
								<legend>用户列表</legend>
							</fieldset>
							<form class="layui-form">
								<div class="test-table-reload-btn" style="margin-bottom: 10px;">
									<div class="layui-input-inline">
										<div class="demoTable">
											<div class="layui-btn">
											<i class="layui-icon">&#xe654;
											<div class="layui-inline" lay-event="add" id="add">
												新增优惠卷
											</div></i>
											</div>
											<br />
											 <div style="height: 10px"></div>
											<div class="layui-inline">
												<input class="layui-input" id="demoReload" autocomplete="off" placeholder="请输入说明...">
											</div>
											<a class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i></a>
										</div>
									</div>
								</div>
							</form>
							<table class="layui-hide" id="test-table-resetPage" lay-filter="shop"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script type="text/html" id="test-table-operate-barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script>
			layui.config({
				base: '../../static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'table', 'jquery', 'form','laydate'], function() {
				var admin = layui.admin,
					table = layui.table;
				var $ = layui.jquery;
				var form = layui.form;
				var laydate = layui.laydate;
				
				var ins21 = laydate.render({
					elem: '#test1',
					type: 'datetime'
				});
	
				var ins22 = laydate.render({
					elem: '#test2',
					type: 'datetime'
				});

				var dicTable = table.render({
					method: 'post',
					elem: '#test-table-resetPage',
					id: 'testReload',
					request: {
						pageName: 'pageNum' //页码的参数名称，默认：page
							,
						limitName: 'rows'
					},
					url: '${BASE_PATH}/admin/coupons/coupons_rule_data',
					page: true, //开启分页
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[{
							field: 'id',
							title: 'ID',
							align: 'center'
						},{
							field: 'decribe',
							title: '说明',
							align: 'center'
						},{
							field: 'count',
							title: '兑换所需积分',
							align: 'center'
						},{
							field: 'inDate',
							title: '有效期（天）',
							align: 'center'
						},{
							field: 'value',
							title: '价值（元）',
							align: 'center'
						} , {
							align: 'center',
							title: '操作',
							toolbar: '#test-table-operate-barDemo'
						}]
					]

				});

				table.on('tool(shop)', function(obj) {
					var data = obj.data;
					var id = data.id;
					if(obj.event === 'edit') {
						layer.open({
							type: 2,
							title: '订单',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: 'add_coupons_page?id=' + id
						});
					}
					if(obj.event === 'del') {
						var index = layer.confirm('您确认要删除吗？', {
						  btn: ['确认','取消'] //按钮
						}, function(){
								$.ajax({
				                   url:'${BASE_PATH}/admin/coupons/coupons_del',
				                   data:{id:id},
				                   success:function(res){
				                    console.log(res.msg);
				                    if(res.code == 1){
				                     	layer.msg(res.msg,{icon: 1,time: 500});
								        setTimeout(function () {
											layer.close(index);
											layui.table.reload('testReload');
										}, 1100);
						             }
						             else{
						             	layer.msg(res.msg,{icon: 2,time: 500});
						             }
						             
				                   }
				                })
								}, function(){
									layer.msg('已取消..',{icon: 2,time: 500});
									 return false;
						});
					}
				});
				
				<!--新增优惠卷-->
				$("#add").click(function(){
					layer.open({
							type: 2,
							title: '新增用户优惠卷',
							shadeClose: true,
							shade: 0.8,
							area: ['90%', '85%'],
							content: '${BASE_PATH}/admin/coupons/add_coupons_page'
						});
				})
				
				active = {
					reload: function() {
						table.reload('testReload', {
							where: {
								querySearch: $("#demoReload").val(),
							}
						});
					}
				};

				$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});
				
				//启用/禁用
				form.on('switch(state)', function(obj) {
					var state = obj.elem.checked;
					var uid = $(this).attr("data-id");
					var statue;
				    if(state == true){
				    	statue = 0;
				    }else if(state == false){
				    	statue = 1;
				    }
					$.ajax({
						type: 'post',
						url: 'update_state',
						data: {
							state: statue,
							uid: uid
						},
						async: false,
						success: function(res) {
							if(res.code == 0) {
								layer.tips(res.msg, obj.othis);
							}
						}
					})
				});
				
			});
		</script>
		<script type="text/html" id="imgurl">
			<img lay-event="images" src="{{d.wxPhoto}}" style="width:50px;height:50px;"/>
		</script>
		
		<script type="text/html" id="stick1">
			<input type="checkbox" data-id="{{d.uid}}" id="tips" value="{{d.state}}" lay-skin="switch" lay-text="启用|禁用" lay-filter="state" {{ d.state==0 ? 'checked' : '' }}>
		</script>
	</body>

</html>