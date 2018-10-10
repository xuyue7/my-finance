<!DOCTYPE html>

<html>

	<head>
		<meta charset="utf-8">
		<title>后台管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${BASE_PATH}/static/lib/layuiadmin/style/admin.css" media="all">
		<script>
			/^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
		</script>
	</head>

	<body class="layui-layout-body">

		<div id="LAY_app">
			<div class="layui-layout layui-layout-admin">
				<div class="layui-header">
					<!-- 头部区域 -->
					<ul class="layui-nav layui-layout-left">
						<li class="layui-nav-item layadmin-flexible" lay-unselect>
							<a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
								<i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
							</a>
						</li>
						<li class="layui-nav-item" lay-unselect>
							<a href="javascript:;" layadmin-event="refresh" title="刷新">
								<i class="layui-icon layui-icon-refresh-3"></i>
							</a>
						</li>
					</ul>
					<ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

								<span class="layui-badge-dot"></span>
							</a>
						</li>-->
						<li class="layui-nav-item layui-hide-xs" lay-unselect>
							<a href="javascript:;" layadmin-event="theme">
								<i class="layui-icon layui-icon-theme"></i>
							</a>
						</li>
						<li class="layui-nav-item" lay-unselect>
							<a href="javascript:;">
								<cite>${user.name}</cite>
							</a>
							<dl class="layui-nav-child">
								<dd>
									<a id="manager_info" style="cursor: pointer">基本资料</a>
								</dd>
								<dd>
									<a id="update_pd" style="cursor: pointer">修改密码</a>
								</dd>
								<hr>
								<dd style="text-align: center;">
									<a id="logout" href="${BASE_PATH}/admin/logout">退出</a>
								</dd>
							</dl>
						</li>

						<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
							<a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
						</li>
					</ul>
				</div>

				<!-- 侧边菜单 -->
				<div class="layui-side layui-side-menu">
					<div class="layui-side-scroll">
						<div class="layui-logo" lay-href="home/console.html">
							<span>后台管理系统</span>
						</div>

						<ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
							<li data-name="home" class="layui-nav-item">
								<a href="javascript:;" lay-tips="主页" lay-direction="2">
									<i class="layui-icon layui-icon-home"></i>
									<cite>主页</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="console" class="layui-this">
										<a lay-href="${BASE_PATH}/admin/home">控制台</a>
									</dd>
								</dl>
							</li>
							<li data-name="user" class="layui-nav-item">
								<a href="javascript:;" lay-tips="用户" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>用户管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="user">
										<a lay-href="${BASE_PATH}/admin/user/user_list" lay-text="">用户列表</a>
									</dd>
									<dd data-name="apply">
										<a lay-href="${BASE_PATH}/admin/user/apply_list" lay-text="">实名审核</a>
									</dd>
									<dd data-name="order">
										<a lay-href="${BASE_PATH}/admin/order/order_list" lay-text="">全部订单</a>
									</dd>
								</dl>
							</li>
							<li data-name="task" class="layui-nav-item">
								<a href="javascript:;" lay-tips="任务" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>任务管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list" lay-text="">任务列表</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task/task_type_list" lay-text="">任务类型</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task_report/task_report_list" lay-text="">任务举报</a>
									</dd>
								</dl>
							</li>
							<li data-name="task" class="layui-nav-item">
								<a href="javascript:;" lay-tips="任务" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>财务管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list" lay-text="">提现管理</a>
									</dd>
									
								</dl>
							</li>
							<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="圈子" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>圈子管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/post/toList" lay-text="">帖子列表</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/minganci/toList" lay-text="">敏感词管理</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/postType/toList" lay-text="">分类管理</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/front/wxuser/bnnerUpload" lay-text="">图片列表</a>
									</dd>
								</dl>
								</li>
								<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="积分" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>积分管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/integral/integral_rule_page" lay-text="">积分规则</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/integral/integral_index_page" lay-text="">用户积分</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_rule_page" lay-text="">优惠卷</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">用户优惠卷</a>
									</dd>
								</dl>
								</li>
								
								<li data-name="user" class="layui-nav-item">
								<a href="javascript:;" lay-tips="客服管理" lay-direction="2">
									<i class="layui-icon layui-icon-chart-screen"></i>
									<cite>客服管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="thead">
										<a lay-href="${BASE_PATH}/admin/customer/customer_index_page" lay-text="">客服管理</a>
									</dd>
								</dl>
								</li>
								
								<li data-name="user" class="layui-nav-item">
								<a href="javascript:;" lay-tips="运营管理" lay-direction="2">
									<i class="layui-icon layui-icon-chart-screen"></i>
									<cite>运营管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="thead">
										<a lay-href="${BASE_PATH}/admin/operate/system_inform_page" lay-text="">系统通知</a>
									</dd>
									<dd data-name="thead">
										<a lay-href="${BASE_PATH}/admin/operate/about_us_page" lay-text="">关于我们</a>
									</dd>
									<dd data-name="thead">
										<a lay-href="${BASE_PATH}/admin/operate/aqs_page" lay-text="">常见问题</a>
									</dd>
								</dl>
								</li>
							<li data-name="task" class="layui-nav-item">
						</ul>
					</div>
				</div>

				<!-- 页面标签 -->
				<div class="layadmin-pagetabs" id="LAY_app_tabs">
					<div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
					<div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
					<div class="layui-icon layadmin-tabs-control layui-icon-down">
						<ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
							<li class="layui-nav-item" lay-unselect>
								<a href="javascript:;"></a>
								<dl class="layui-nav-child layui-anim-fadein">
									<dd layadmin-event="closeThisTabs">
										<a href="javascript:;">关闭当前标签页</a>
									</dd>
									<dd layadmin-event="closeOtherTabs">
										<a href="javascript:;">关闭其它标签页</a>
									</dd>
									<dd layadmin-event="closeAllTabs">
										<a href="javascript:;">关闭全部标签页</a>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
						<ul class="layui-tab-title" id="LAY_app_tabsheader">
							<li lay-id="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
						</ul>
					</div>
				</div>

				<!-- 主体内容 -->
				<div class="layui-body" id="LAY_app_body">
					<div class="layadmin-tabsbody-item layui-show">
						<iframe src="${BASE_PATH}/admin/home" frameborder="0" class="layadmin-iframe"></iframe>
					</div>
				</div>

				<!-- 辅助元素，一般用于移动设备下遮罩 -->
				<div class="layadmin-body-shade" layadmin-event="shade"></div>
			</div>
		</div>
	
		<script src="${BASE_PATH}/static/lib/layuiadmin/layui/layui.js"></script>
		<script>
			layui.config({
				base: '${BASE_PATH}/static/lib/layuiadmin/' //静态资源所在路径
			}).extend({
				index: 'lib/index' //主入口模块
			}).use(['index', 'jquery', 'layer'], function() {
				var $ = layui.jquery;
				var layer = layui.layer;
				
				$("#manager_info").on("click",function(){
					layer.open({
						type: 2,
						title: '详情',
						shadeClose: true,
						shade: 0.8,
						area: ['30%', '30%'],
						content: '${BASE_PATH}/admin/manager/user_info'
					});
				})
				
				$("#update_pd").on("click",function(){
					layer.open({
						type: 2,
						title: '详情',
						shadeClose: true,
						shade: 0.8,
						area: ['40%', '40%'],
						content: '${BASE_PATH}/admin/manager/update_pd'
					});
				})
				
			})
		</script>
	</body>

</html>
