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

	<body>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			    <legend>优惠卷详情</legend>
			  </fieldset>
			   
			  <form class="layui-form" action="">
			    <div class="layui-form-item">
			      <label class="layui-form-label">用户昵称</label>
			      <div class="layui-input-block">
			        <input type="text" name="title" value="${c.userName}" disabled="disabled"  autocomplete="off" placeholder="请输入标题" class="layui-input">
			      </div>
			    </div>
			    <div class="layui-form-item">
			      <label class="layui-form-label">所属类型</label>
			      <div class="layui-input-block">
			        <input type="text" name="username" value="${c.coupons.decribe}" disabled="disabled"  placeholder="请输入" autocomplete="off" class="layui-input">
			      </div>
			    </div>
			    
			    <div class="layui-form-item">
			      <div class="layui-inline">
			        <label class="layui-form-label">使用积分</label>
			        <div class="layui-input-inline">
			          <input type="tel" name="phone" value="${c.coupons.count}" disabled="disabled"  autocomplete="off" class="layui-input">
			        </div>
			      </div>
			      <div class="layui-inline">
			        <label class="layui-form-label">有效期</label>
			        <div class="layui-input-inline">
			          <input type="text" name="email" value="${c.coupons.inDate}" disabled="disabled"  autocomplete="off" class="layui-input">
			        </div>
			      </div>
			    </div>
			    <div class="layui-form-item">
			        <div class="layui-inline">
			          <label class="layui-form-label">获取时间</label>
			          <div class="layui-input-inline">
			            <input type="tel" name="phone" value="${c.frontST}" disabled="disabled"  autocomplete="off" class="layui-input">
			          </div>
			        </div>
			        <div class="layui-inline">
			          <label class="layui-form-label">使用状态</label>
			          <div class="layui-input-inline">
			            <input type="text" name="email" value="<#if c.useState == 1>已使用<#else>未使用</#if>" disabled="disabled"  autocomplete="off" class="layui-input">
			          </div>
			        </div>
			      </div>
			  </form>
		<script type="text/html" id="content">
		  {{d.integralRule.content}}
		</script>
		<script type="text/html" id="count">
		  {{d.integralRule.count}}
		</script>
		<script type="text/html" id="ST">
		  {{d.ST}}
		</script>
	</body>

</html>