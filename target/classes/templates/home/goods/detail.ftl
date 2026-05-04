<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${siteName!""}-发布物品</title>
	<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
	<link media="all" href="/home/css/product_detail.css" type="text/css" rel="stylesheet">
	<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
	<style>
		/* 消息提示样式 - 类似于后台登录页面的错误提示 */
		.message-alert {
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: rgba(0, 0, 0, 0.85);
			color: white;
			padding: 25px 30px;
			border-radius: 10px;
			box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
			z-index: 9999;
			min-width: 320px;
			max-width: 500px;
			display: none;
			text-align: center;
			animation: fadeIn 0.3s ease-out;
			backdrop-filter: blur(5px);
			border: 1px solid rgba(255, 255, 255, 0.1);
		}

		@keyframes fadeIn {
			from { opacity: 0; transform: translate(-50%, -60%); }
			to { opacity: 1; transform: translate(-50%, -50%); }
		}

		.message-alert .alert-title {
			font-size: 18px;
			font-weight: 600;
			margin-bottom: 15px;
			color: #4BC0A5;
			display: flex;
			align-items: center;
			justify-content: center;
		}

		.message-alert .alert-title i {
			margin-right: 10px;
			font-size: 20px;
		}

		.message-alert .alert-content {
			font-size: 15px;
			line-height: 1.6;
			margin-bottom: 20px;
			text-align: left;
		}

		.message-alert .contact-item {
			display: flex;
			align-items: center;
			margin-bottom: 12px;
			padding: 10px 15px;
			background: rgba(255, 255, 255, 0.1);
			border-radius: 6px;
		}

		.message-alert .contact-label {
			min-width: 80px;
			font-weight: 600;
			color: #4BC0A5;
		}

		.message-alert .contact-value {
			flex: 1;
			color: #fff;
			font-family: monospace;
			font-size: 14px;
		}

		.message-alert .copy-btn {
			background: #4BC0A5;
			color: white;
			border: none;
			border-radius: 4px;
			padding: 5px 12px;
			font-size: 12px;
			cursor: pointer;
			margin-left: 10px;
			transition: all 0.3s ease;
		}

		.message-alert .copy-btn:hover {
			background: #3DA58A;
		}

		.message-alert .alert-tips {
			font-size: 13px;
			color: #aaa;
			margin-top: 15px;
			text-align: center;
			padding-top: 15px;
			border-top: 1px solid rgba(255, 255, 255, 0.1);
		}

		.message-alert .close-btn {
			background: #4BC0A5;
			color: white;
			border: none;
			border-radius: 6px;
			padding: 10px 30px;
			font-size: 14px;
			font-weight: 600;
			cursor: pointer;
			transition: all 0.3s ease;
			width: 100%;
			margin-top: 15px;
		}

		.message-alert .close-btn:hover {
			background: #3DA58A;
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(75, 192, 165, 0.3);
		}

		.message-alert .close-btn:active {
			transform: translateY(0);
		}

		/* 遮罩层 */
		.mask {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.6);
			z-index: 9998;
			display: none;
			animation: fadeIn 0.3s ease-out;
		}

		/* 按钮样式增强 */
		#buy-button {
			margin-top: 20px;
			transition: all 0.3s ease;
		}

		#buy-button a {
			display: block;
			background: linear-gradient(135deg, #4BC0A5 0%, #3DA58A 100%);
			color: white;
			text-align: center;
			padding: 15px 0;
			border-radius: 8px;
			font-size: 16px;
			font-weight: 600;
			text-decoration: none;
			transition: all 0.3s ease;
			box-shadow: 0 4px 15px rgba(75, 192, 165, 0.3);
		}

		#buy-button a:hover {
			transform: translateY(-3px);
			box-shadow: 0 8px 25px rgba(75, 192, 165, 0.4);
			text-decoration: none;
		}
	</style>
</head>
<body>
<!-- 遮罩层 -->
<div class="mask" id="mask"></div>

<!-- 消息提示框 -->
<div class="message-alert" id="seller-alert">
	<div class="alert-title">
		<i>📞</i> 卖家联系信息
	</div>
	<div class="alert-content">
		<div class="contact-item">
			<div class="contact-label">手机号：</div>
			<div class="contact-value" id="alert-phone">
				<#if goods.student.mobile?? && goods.student.mobile?length gt 0>
					${goods.student.mobile}
				<#else>
					未提供手机号
				</#if>
			</div>
			<#if goods.student.mobile?? && goods.student.mobile?length gt 0>
				<button class="copy-btn" data-text="${goods.student.mobile}" onclick="copyToClipboard(this)">复制</button>
			</#if>
		</div>
		<div class="contact-item">
			<div class="contact-label">QQ号：</div>
			<div class="contact-value" id="alert-qq">
				<#if goods.student.qq?? && goods.student.qq?length gt 0>
					${goods.student.qq}
				<#else>
					未提供QQ
				</#if>
			</div>
			<#if goods.student.qq?? && goods.student.qq?length gt 0>
				<button class="copy-btn" data-text="${goods.student.qq}" onclick="copyToClipboard(this)">复制</button>
			</#if>
		</div>
	</div>
	<div class="alert-tips">
		请通过以上联系方式联系卖家进行交易
	</div>
	<button class="close-btn" onclick="closeAlert()">关闭</button>
</div>

<#include "../common/top_header.ftl"/>
<#include "../common/left_menu.ftl"/>
<div class="container">
	<div class="main center clearfix">
		<div class="ershou-details">
			<div class="ershou-photos-wr">
				<!-- 收藏功能
               <a class="ershou-favorite" href="javascript:void(0);" style="background-image: url('heart.png');" onclick="favorites();">0</a> -->
				<!-- 轮播大图-->
				<div class="bigger-photo-box">
					<a class="bigger-photo hide show" rel="img_group" href="">
						<img class="bigger" src="/photo/view?filename=${goods.photo}"  alt="${goods.name}">
					</a>
				</div>
			</div>
			<div class="ershou-info">
				<div class="ershou-hd">
					<p class="ershou-title">${goods.name}</p>
					<div class=" discount">
						<span class="buy-price">原价：${goods.buyPrice}</span>
						<span class="ershou-price">二手街价：${goods.sellPrice}</span>
					</div>
					<p class="bro-counts">浏览了<span>${goods.viewNumber}</span>次</p>
				</div>
				<ul class="ershou-detail">
					<li class="ershou-place" id="pid">
						<div class="name">
							<span>商品编号</span>
						</div>
						<div class="value">
							<span id="pid">${goods.id}</span>
						</div>
					</li>
					<li class="ershou-time">
						<div class="name">
							<span>发布时间</span>
						</div>
						<div class="value">
							<span class="real-time"id="creat_time">${goods.createTime!""}</span>
						</div>
					</li>
					<li class="ershou-place">
						<div class="name">
							<span>交易地点</span>
						</div>
						<div class="value">${goods.student.school!"该用户未填写学校信息"}</div>
					</li>
					<li class="ershou-cert">
						<div class="name">
							<span>学院</span>
						</div>
						<div class="value">
							<span id="user_college">${goods.student.academy!"该用户未填写学院信息"}</span>
							<span id="user_grade">${goods.student.grade!"该用户未填写年级信息"}</span>
						</div>
					</li>
					<li class="ershou-seller">
						<div class="name">
							<span>卖家</span>
						</div>
						<div class="value">
							<span class="value-name" id="userid">${goods.student.nickname!goods.student.sn}</span>
						</div>
					</li>
				</ul>
				<div id="buy-button" >
					<a style="color: white;cursor:pointer;" > 联系卖家</a>
				</div>
				<div class="complain">
					<a href="javascript:void(0);" onclick="report(${goods.id});">•&nbsp;&nbsp;&nbsp;&nbsp;举报&nbsp;&nbsp;&nbsp;&nbsp;•</a>
				</div>
			</div>
		</div>
		<div class="ershou-desc">
			<div class="desc clearfix">
				<a href=""target="_top">
					<#if goods.student.headPic??>
						<img id="user_ph" src="/photo/view?filename=${goods.student.headPic}">
					<#else>
						<img id="user_ph" src="/home/imgs/avatar1.png">
					</#if>
				</a>
				<p id="user_cmt">${goods.content}</p>
			</div>
		</div>
		<!--物品评论开始-->
		<div class="comments want-comments" style="width:98.5%">
			<div class="comments-wr" style="border-left:0px;">
				<div class="comment-wr">
					<div class="post-comment clearfix">
						<!--已登录状态下-->
						<#if ylrc_student??>
							<#if ylrc_student.headPic??>
								<img class="avatar" src="/photo/view?filename=${ylrc_student.headPic}" alt="头像"/>
							<#else>
								<img class="avatar" src="/home/imgs/avatar1.png" alt="头像"/>
							</#if>
							<div class="commenting want-commenting clearfix" >
								<div class="comment-input-wr-wr" style="margin-right:56px;">
									<div class="comment-input-wr" >
										<textarea class="comment-input-wr" name="comment-input" id="comment-content"></textarea>
									</div>
								</div>
								<button class="sub-comment" type="button" id="submit-comment-btn" data-reply="0" data-reply-content="0">评论</button>
							</div>
						<#else>
							<!--未登录状态下-->
							<img class="avatar" src="/home/imgs/avatar-unlogin.png" alt="头像"/>
							<div class="commenting-unlogin want-commenting clearfix">
								<div class="comment-input-wr-wr">
									<div class="comment-input-wr">
										<span class="tips">评论总要登录留个名吧</span>
									</div>
								</div>
								<button class="comment-login" data-type="l" id="to-login-btn">登录</button>
							</div>
						</#if>
						<!--已有的评论列表-->
						<#if commentList??>
							<div class="comments want-comments" style="width:98.5%;margin-top:0px;padding-top:0px;">
								<div class="comments-wr" style="border:0px;">
									<div class="comment-wr">
										<#list commentList as comment>
											<div class="comment" style="margin-top:25px;">
												<#if comment.student.headPic??>
													<img class="avatar" src="/photo/view?filename=${comment.student.headPic}" alt="头像"/>
												<#else>
													<img class="avatar" src="/home/imgs/avatar1.png" alt="头像"/>
												</#if>
												<div class="commentator" style="padding-left:55px;padding-bottom:5px;color:rgb(75, 192, 165);border-bottom: 1px dashed rgb(75, 192, 165);">
													<b>${comment.student.nickname!comment.student.sn}</b>
													<#if comment.replyTo??><span class="rpy-to">${comment.replyTo}</span></#if>
												</div>
												<p class="comment" style="padding-left:55px;padding-bottom:5px;padding-top:5px;">${comment.content}<font style="float:right;">${comment.createTime}</font></p>
												<div class="man" style="padding-left:55px;padding-bottom:5px;">
													<a class="rpl" href="#comment-content" data-reply="${comment.content}" data-name="${comment.student.nickname!comment.student.sn}">回复</a>
												</div>
											</div>
										</#list>
									</div>
								</div>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>
		<!--物品评论结束-->
	</div>
</div>
<#include "../common/right_menu.ftl"/>
<#include "../common/bottom_footer.ftl"/>
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/add.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 联系卖家按钮点击事件 - 使用消息提示组件
		$("#buy-button").click(function(){
			<#if ylrc_student??>
			// 显示消息提示框
			showSellerAlert();
			<#else>
			// 未登录状态使用普通alert
			alert("请您先登录");
			window.location.href="/home/index/login";
			</#if>
		});

		$("#to-login-btn").click(function(){
			window.location.href="/home/index/login";
		});

		$("#submit-comment-btn").click(function(){
			var content = $("#comment-content").val();
			if(content == ''){
				alert('请输入评论内容！');
				return;
			}
			var data = {'goods.id':${goods.id},content:content};
			if($("#submit-comment-btn").attr('data-reply') != '0'){
				data.replyTo = $("#submit-comment-btn").attr('data-reply');
				data.content = data.content.replace('回复：' + data.replyTo + ':','')
				data.content = '回复："' + $("#submit-comment-btn").attr('data-reply-content') + '"<br>' + data.content;
			}
			ajaxRequest('/home/student/comment','post',data,function(){
				alert('评论成功');
				window.location.reload();
			});
		});

		$(".rpl").click(function(){
			$("#comment-content").val('回复：'+$(this).attr('data-name') + ':')
			$("#submit-comment-btn").attr('data-reply',$(this).attr('data-name'))
			$("#submit-comment-btn").attr('data-reply-content',$(this).attr('data-reply'))
		});
	});

	// 显示卖家信息提示框
	function showSellerAlert() {
		$("#mask").fadeIn(300);
		$("#seller-alert").fadeIn(300);

		// 点击遮罩层也可以关闭
		$("#mask").click(function() {
			closeAlert();
		});

		// 按ESC键关闭
		$(document).keydown(function(e) {
			if (e.keyCode === 27) { // ESC键
				closeAlert();
			}
		});
	}

	// 关闭提示框
	function closeAlert() {
		$("#seller-alert").fadeOut(300);
		$("#mask").fadeOut(300);

		// 移除ESC键事件监听
		$(document).off('keydown');
	}

	// 复制到剪贴板函数
	function copyToClipboard(button) {
		var text = $(button).data('text');

		// 创建临时textarea元素
		var tempInput = document.createElement("textarea");
		tempInput.value = text;
		document.body.appendChild(tempInput);

		// 选中文本
		tempInput.select();
		tempInput.setSelectionRange(0, 99999); // 对于移动设备

		// 执行复制命令
		try {
			var successful = document.execCommand('copy');
			if (successful) {
				// 显示复制成功提示
				var originalText = $(button).text();
				$(button).text('已复制');
				$(button).css('background', '#28a745');

				// 3秒后恢复按钮文本
				setTimeout(function() {
					$(button).text(originalText);
					$(button).css('background', '#4BC0A5');
				}, 2000);
			} else {
				alert('复制失败，请手动复制');
			}
		} catch (err) {
			alert('复制失败，请手动复制');
		}

		// 移除临时元素
		document.body.removeChild(tempInput);
	}

	function report(id){
		var content = prompt("请输入举报原因");
		if(content == null || content == ''){
			alert('请填写举报原因');
			return;
		}
		ajaxRequest('/home/student/report_goods','post',{'goods.id':id,content:content},function(){
			alert('举报成功');
		});
	}
</script>
</body>
</html>