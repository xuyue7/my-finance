<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
 <script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
</head>
<style>
body {
				margin: 10px;
				background-color: white;
			}
</style>
<body>

<form class="layui-form" style="margin-bottom: -50px;margin-top: 1%;margin-left:1%">
			<div class="test-table-reload-btn">
				<div class="layui-input-inline" style="z-index:1000">
					<div class="demoTable">
						<div class="layui-inline">
							<input style="height: 30px;" type="text" id="demoReload" autocomplete="off" placeholder="请输入资产类别名称...">
						</div>
						<a class="layui-btn layui-btn-sm"  data-type="reload"><i class="layui-icon">&#xe615;</i></a>
					</div>
				</div>
			</div>
		</form>
<table class="layui-table" lay-data="{ url:'/test/table/demo2.json?v=2',toolbar: true, page: true, limit: 6, limits:[5,10,15,20]}">
  <thead>
    <tr>
      <th lay-data="{field:'username',width:90}" rowspan="2">资产类别</th>
      <th lay-data="{align:'center'}" colspan="4">资产原值</th>
      <th lay-data="{align:'center'}" colspan="4">累计折旧</th>
       <th lay-data="{align:'center'}" colspan="4">减值准备</th>
      <th lay-data="{fixed: 'right', align: 'center', toolbar: '#barDemo',width:130}" rowspan="2">操作</th>
    </tr>
    <tr>
      <th lay-data="{field:'province'}">期初数</th>
      <th lay-data="{field:'city'}">增加</th>
      <th lay-data="{field:'zone'}">减少</th>
      <th lay-data="{field:'zone'}">期末数</th>
      <th lay-data="{field:'zone'}">期初数</th>
      <th lay-data="{field:'province'}">增加</th>
      <th lay-data="{field:'city'}">减少</th>
      <th lay-data="{field:'zone'}">期末数</th>
      <th lay-data="{field:'zone'}">期初数</th>
      <th lay-data="{field:'zone'}">增加</th>
      <th lay-data="{field:'zone'}">减少</th>
      <th lay-data="{field:'zone'}">期末数</th>
    </tr>
  </thead>
</table>
<script>
layui.use('table', function(){
					  var table = layui.table;
					  var	$ = layui.jquery,
					laypage = layui.laypage //分页
					,
					layer = layui.layer //弹层
					,
					table = layui.table //表格
					,
					carousel = layui.carousel //轮播
					,
					upload = layui.upload //上传
					,
					element = layui.element //元素操作
  
  //搜索 需要手动写ajax
  	active = {
		reload: function() {
		table.reload('testReload', {
					where: {
						queryContent: $("#demoReload").val()
						}
					});
				}
			};
		$('.demoTable .layui-btn').on('click', function() {
		alert(22);
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});

});
</script>

</body>
</html>