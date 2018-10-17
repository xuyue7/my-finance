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
							<span>财务管理系统</span>
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
							<li data-name="home" class="layui-nav-item">
								<a href="javascript:;" lay-tips="用户管理" lay-direction="2">
									<i class="layui-icon layui-icon-home"></i>
									<cite>用户管理</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="user" >
										<a lay-href="${BASE_PATH}/admin/user/admin_manage_page">管理员管理</a>
									</dd>
								</dl>
								<dl class="layui-nav-child">
									<dd data-name="console">
										<a lay-href="${BASE_PATH}/admin/user/staff_manage_page">员工管理</a>
									</dd>
								</dl>
							</li>
							<li data-name="user" class="layui-nav-item">
								<a href="javascript:;" lay-tips="凭证" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>凭证</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="user">
										<a lay-href="${BASE_PATH}/admin/finance/fiance_credential_page" lay-text="">新增凭证</a>
									</dd>
									<dd data-name="apply">
										<a lay-href="${BASE_PATH}/admin/finance/fiance_credential_see" lay-text="">查看凭证</a>
									</dd>
									<dd data-name="order">
										<a lay-href="${BASE_PATH}/admin/finance/fiance_credential_all" lay-text="">全部凭证</a>
									</dd>
								</dl>
							</li>
							<li data-name="task" class="layui-nav-item">
								<a href="javascript:;" lay-tips="出纳" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>出纳</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list" lay-text="">现金日记账</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task/task_type_list" lay-text="">内部转账</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task_report/task_report_list" lay-text="">资金报表</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task_report/task_report_list1" lay-text="">收支类别</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task_report/task_report_list2" lay-text="">核对总账</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/task_report/task_report_list3" lay-text="">账户设置</a>
									</dd>
								</dl>
							</li>
							
							<li data-name="user" class="layui-nav-item">
								<a href="javascript:;" lay-tips="工资" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>工资</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="user">
										<a lay-href="${BASE_PATH}/admin/user/user_list" lay-text="">工资管理</a>
									</dd>
									<dd data-name="apply">
										<a lay-href="${BASE_PATH}/admin/user/apply_list" lay-text="">员工管理</a>
									</dd>
									<dd data-name="order">
										<a lay-href="${BASE_PATH}/admin/order/order_list" lay-text="">五险一金</a>
									</dd>
								</dl>
							</li>
							
							<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="资产" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>资产</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="property">
										<a lay-href="${BASE_PATH}/admin/property/property_manage_page" lay-text="">资产管理</a>
									</dd>
									<dd data-name="property_count">
										<a lay-href="${BASE_PATH}/admin/property/property_count_page" lay-text="">资产汇总</a>
									</dd>
									<dd data-name="property_type">
										<a lay-href="${BASE_PATH}/admin/property/property_type_page" lay-text="">资产类别设置</a>
									</dd>
									<dd data-name="property_detail">
										<a lay-href="${BASE_PATH}/admin/property/property_detail_page" lay-text="">折旧明细表</a>
									</dd>
								</dl>
								</li>
							<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="账簿" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>账簿</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/post/toList" lay-text="">明细账</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/minganci/toList" lay-text="">总账</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/postType/toList" lay-text="">科目余额</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/front/wxuser/bnnerUpload" lay-text="">科目汇总</a>
									</dd>
								</dl>
							</li>
							<li data-name="task" class="layui-nav-item">
								<a href="javascript:;" lay-tips="报表" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>报表</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list" lay-text="">利润报表</a>
									</dd>
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_lisst" lay-text="">利润报表季报</a>
									</dd>
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list3" lay-text="">现金流量</a>
									</dd>
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/task/task_list5" lay-text="">财务概要信息</a>
									</dd>
								</dl>
							</li>
							<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="税务" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>税务</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task" lay-tips="国税申报" lay-direction="2">
										<a lay-href="${BASE_PATH}/admin/post/toList" lay-text="">国税申报</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/minganci/toList" lay-text="">纳税统计表</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/postType/toList" lay-text="">税务信息</a>
									</dd>
								</dl>
								</li>
								<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="设置" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>设置</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/finance/finance_subject_page" lay-text="">科目</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/integral/integral_index_page" lay-text="">币别</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">数据备份</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">凭证模板</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">权限设置</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">初始化</a>
									</dd>
								</dl>
								</li>
								<li data-name="quanzi" class="layui-nav-item">
								<a href="javascript:;" lay-tips="系统信息" lay-direction="2">
									<i class="layui-icon layui-icon-user"></i>
									<cite>系统信息</cite>
								</a>
								<dl class="layui-nav-child">
									<dd data-name="task">
										<a lay-href="${BASE_PATH}/admin/integral/integral_rule_page" lay-text="">系统异常</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/system/system_record_index" lay-text="">操作日志</a>
									</dd>
									<dd data-name="task_type">
										<a lay-href="${BASE_PATH}/admin/coupons/coupons_index_page" lay-text="">数据备份</a>
									</dd>
								</dl>
								</li>
								<li style="height:30px">
									
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
						<iframe src="${BASE_PATH}/admin/home" frameborder="0" class="layadmin-iframe" ></iframe>
					</div>
				</div>

				<!-- 辅助元素，一般用于移动设备下遮罩 -->
				<div class="layadmin-body-shade" layadmin-event="shade">ddd</div>
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
