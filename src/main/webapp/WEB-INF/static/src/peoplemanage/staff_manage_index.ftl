<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<title>操作日志</title>
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<style>
			body {
				margin: 10px;
				background-color: white;
			}

		</style>
	</head>

	<body>
		<form class="layui-form" style="margin-bottom: -50px;margin-top: 1%/;margin-left:1%">
			<div class="test-table-reload-btn">
				<div class="layui-input-inline" style="z-index:1000">
					<div class="demoTable">
						<div class="layui-inline">
							<input style="height: 30px;" type="text" id="demoReload" autocomplete="off" placeholder="请输入用户账号或者地址...">
						</div>
						<a class="layui-btn layui-btn-sm"  data-type="reload"><i class="layui-icon">&#xe615;</i></a>
					</div>
				</div>
			</div>
		</form>
		<table class="layui-hide" id="demo" lay-filter="test"></table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
			
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script>
			layui.config({
				version: '1535898708529' //为了更新 js 缓存，可忽略
			});

			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function() {
				var laydate = layui.laydate //日期
					,
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
					,
					$ = layui.jquery

				//监听Tab切换
				/*element.on('tab(demo)', function(data) {
					layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
						tips: 1
					});
				});*/

				//执行一个 table 实例
				table.render({
					elem: '#demo',
					url: '${BASE_PATH}/admin/user/staff_index_data' //数据接口
					,
					title: '操作日志',
					page: true //开启分页
						,
					toolbar: true //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
						,
					totalRow: false //开启合计行
						,
					id:'testReload',
					limit: 10,
					limits: [10, 15, 20, 25, 30],
					cols: [
						[ //表头
							 {
								field: 'staffId',
								title: '员工账号',
								width: 165,
								align:'center',
								fixed: 'left'
							},{
								field: 'staffName',
								align:'center',
								title: '员工姓名',
							},{
								field: 'staffSex',
								title: '员工性别',
								align:'center',
								sort: true,

								//totalRow: true 合计设置
							}
							,{
								field: 'showBirth',
								align:'center',
								title: '员工生日',
							}, {
								field: 'staffTel',
								title: '员工电话',
								align:'center',
								sort: true,
								//totalRow: true 合计设置
							},{
								field: 'staffAddress',
								title: '员工地址',
								align:'center',
								//totalRow: true 合计设置
							},{
								field: 'staffDescribe',
								align:'center',
								title: '个人简介',
							},
							{
								fixed: 'right',
								width: 165,
								title: '操作',
								align:'center',
								toolbar: '#barDemo'
							}

						]
					]
				});

				//监听头工具栏事件
				table.on('toolbar(test)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id),
						data = checkStatus.data; //获取选中的数据
					switch(obj.event) {
						case 'add':
							layer.msg('添加');
							break;
						case 'update':
							if(data.length === 0) {
								layer.msg('请选择一行');
							} else if(data.length > 1) {
								layer.msg('只能同时编辑一个');
							} else {
								layer.alert('编辑 [id]：' + checkStatus.data[0].id);
							}
							break;
						case 'delete':
							if(data.length === 0) {
								layer.msg('请选择一行');
							} else {
								layer.msg('删除');
							}
							break;
					};
				});

				//监听行工具事件
				table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data //获得当前行数据
						,
						layEvent = obj.event; //获得 lay-event 对应的值
					if(layEvent === 'detail') {
						layer.msg('查看操作');
					} else if(layEvent === 'del') {
						layer.confirm('真的删除行么', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构
							layer.close(index);
							//向服务端发送删除指令
						});
					} else if(layEvent === 'edit') {
						layer.msg('编辑操作');
					}
				});

				//执行一个轮播实例
				carousel.render({
					elem: '#test1',
					width: '100%' //设置容器宽度
						,
					height: 200,
					arrow: 'none' //不显示箭头
						,
					anim: 'fade' //切换动画方式
				});

				//将日期直接嵌套在指定容器中
				var dateIns = laydate.render({
					elem: '#laydateDemo',
					position: 'static',
					calendar: true //是否开启公历重要节日
						,
					mark: { //标记重要日子
						'0-10-14': '生日',
						'2018-08-28': '新版',
						'2018-10-08': '神秘'
					},
					done: function(value, date, endDate) {
						if(date.year == 2017 && date.month == 11 && date.date == 30) {
							dateIns.hint('一不小心就月底了呢');
						}
					},
					change: function(value, date, endDate) {
						layer.msg(value)
					}
				});

				//分页
				laypage.render({
					elem: 'pageDemo' //分页容器的id
						,
					count: 100 //总页数
						,
					skin: '#1E9FFF' //自定义选中色值
						//,skip: true //开启跳页
						,
					jump: function(obj, first) {
						if(!first) {
							layer.msg('第' + obj.curr + '页', {
								offset: 'b'
							});
						}
					}
				});


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
					var type = $(this).data('type');
					active[type] ? active[type].call(this) : '';
				});




				//上传
				upload.render({
					elem: '#uploadDemo',
					url: '' //上传接口
						,
					done: function(res) {
						console.log(res)
					}
				});

				/*slider.render({
					elem: '#sliderDemo',
					input: true //输入框
				});*/
				//底部信息
			});

		</script>
	</body>
</html>