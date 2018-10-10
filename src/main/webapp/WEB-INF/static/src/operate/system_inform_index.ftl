<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>系统通知管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" rel="stylesheet" media="all">
  		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
  		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js" charset="utf-8"></script>
	</head>
	<body>

		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-header">用户列表</div>
						<div class="layui-card-body">

							<table class="layui-hide" id="test-table-operate" lay-filter="test-table-operate">
							<div class="layui-input-inline">
						<div class="demoTable">
						<div class="layui-inline">
								<button class="layui-btn layui-btn-primary" id="taskadd"><i class="layui-icon layui-icon-add-1" ></i> 新增通知</button>
								</div>
								<br />
								<br />
							<div class="layui-inline">
								<input class="layui-input" name="userName" id="demoReload" autocomplete="off"  placeholder="请输入查询内容....">
							</div>
							<div class="layui-inline">
						    
						    <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
			  				<input type="text" class="layui-input" id="test1" placeholder="起始时间">
			    			</div>
			    			
			    			<div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
			  				<input type="text" class="layui-input" id="test2" placeholder="结束时间">
			    			</div>
							 &nbsp;
							<button class="layui-btn" data-type="reload"><i class="layui-icon larry-icon larry-chaxun2"></i>搜索</button>
						</div>
					</div>
							</table>

							<script type="text/html" id="test-table-operate-barDemo">
  								<a class="layui-btn layui-btn-xs" lay-event="detail">编辑</a>
  								 &nbsp;
  								  &nbsp;
  								<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			layui.config({
				base: '${BASE_PATH}/static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'table','laydate','laydate','form','jquery'], function() {
				var table = layui.table,
					admin = layui.admin;
				var form  = layui.form;
				var $ = layui.jquery;
				var laydate = layui.laydate;
				
				//时间选择
					
					laydate.render({
				    	elem: '#test1' //指定元素
					    ,type: 'date',
					    range: false
					  });
					  
					   laydate.render({
				    	elem: '#test2' //指定元素
					    ,type: 'date',
					    range: false
					  });
				//表格
				table.render({
				request: {
						pageName: 'pageNum', //页码的参数名称，默认：page
						limitName: 'rows'
					},
					elem: '#test-table-operate',
					url: '${BASE_PATH}/admin/operate/system_inform_list',
					page: true,
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					id: 'testReload',
					cols: [
						[{
							type: 'checkbox',
							fixed: 'left'
						},
						 {
							field: 'informId',
							title: 'ID'
						}, 
						 {
							field: 'informTitle',
							title: '通知标题',
						},{
							field: 'informContent',
							title: '通知内容'
						},
						 {
							field: 'time',
							title: '创建时间',
							sort: true
						},
						{
							align: 'center',
							fixed: 'right',
							title: '操作',
							toolbar: '#test-table-operate-barDemo'
						}]
					],
				});
				
				//监听查看按钮
				table.on('tool(test-table-operate)', function(obj) {
					var data = obj.data;
					
				
					if(obj.event === 'detail') {
						layer.open({
							type: 2,
							shadeClose: true,
					  		shade: 0.8,
							title:'用户详细信息',
							area: ['70%', '90%'],
							content: "${BASE_PATH}/admin/operate/view_detail?infromId=" + data.informId, //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['
						});
						
					} 
					
					//删除按钮
				if(obj.event === 'del'){
						var index=layer.confirm('是否确认删除该信息？', {
							  btn: ['确认', '取消'] //可以无限个按钮
							}, function(index, layero){
									$.ajax({
									    type:'get',
									    url:'${BASE_PATH}/admin/operate/infrom_del',
									    data:{infromId:data.informId},
									    success:function(res){
									    	if(res.code == 1){
									    		layer.msg(res.msg, {time: 500});
									    		setTimeout(function () {
												layer.close(index);
												layui.table.reload('testReload', { pageNum: { curr:1 } });
												}
												, 1000);    
									    	}
									    },
									 })
								
							}, function(index){//取消回调函数
							});
					}
				
				});
				
				
				//搜索
				var $ = layui.$,
					active = {
						reload:function() {
							var demoReload = $('#demoReload');		
							table.reload('testReload', {
								where: {
									informContent: $("#demoReload").val(),
									startDt:$("#test1").val(),
									endDt:$("#test2").val()
								}
							});
						}
					};
						//新增
					$("#taskadd").click(function(){
							layer.open({
								type: 2,
								shadeClose: true,
						  		shade: 0.8,
								title:'用户详细信息',
								area: ['70%', '75%'],
								content: "${BASE_PATH}/admin/operate/view_detail", //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['
							});
					})
					$('.demoTable .layui-btn').on('click', function() {
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
					});
			});
		</script>
	</body>
</html>