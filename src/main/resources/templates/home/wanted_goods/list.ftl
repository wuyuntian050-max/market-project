<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	<title>${siteName!""}</title>
	<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
	<link media="all" href="/home/css/want_list.css" type="text/css" rel="stylesheet">
	<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
	<style>
		/* 新增样式 - 让页面更美观 */
		.container {
			background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
			min-height: calc(100vh - 120px);
			padding: 20px 0;
		}

		.want-title {
			background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
			color: white;
			padding: 20px;
			border-radius: 15px 15px 0 0;
			margin-bottom: 0;
			text-align: center;
			font-size: 24px;
			font-weight: bold;
			letter-spacing: 1px;
			box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
		}

		.wrap-want-list {
			background: white;
			border-radius: 15px;
			box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
			overflow: hidden;
			margin-bottom: 30px;
		}

		.want-item {
			padding: 20px;
			border-bottom: 1px solid #f0f0f0;
			transition: all 0.3s ease;
		}

		.want-item:hover {
			background: linear-gradient(90deg, #f9f9ff 0%, #f5f7ff 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
			border-left: 4px solid #667eea;
		}

		.want-item:last-child {
			border-bottom: none;
		}

		.want-li {
			display: flex;
			gap: 20px;
		}

		.want-li .left {
			flex: 0 0 80px;
		}

		.want-li .left a img {
			width: 80px;
			height: 80px;
			border-radius: 50%;
			object-fit: cover;
			border: 3px solid #667eea;
			box-shadow: 0 3px 10px rgba(102, 126, 234, 0.2);
			transition: all 0.3s ease;
		}

		.want-li .left a img:hover {
			transform: scale(1.05);
			border-color: #764ba2;
		}

		.want-li .right {
			flex: 1;
		}

		.want-name {
			color: #2d3748;
			margin: 0 0 15px 0;
			font-size: 20px;
			font-weight: 600;
		}

		.want-name span {
			color: #667eea;
			font-weight: 700;
			background: linear-gradient(120deg, #667eea 0%, #764ba2 100%);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			padding: 2px 5px;
		}

		.want-detail {
			color: #4a5568;
			line-height: 1.6;
			margin-bottom: 15px;
			padding: 15px;
			background: #f8f9fa;
			border-radius: 8px;
			border-left: 3px solid #48bb78;
			font-size: 15px;
		}

		.want-attr {
			display: flex;
			flex-wrap: wrap;
			gap: 20px;
			align-items: center;
			padding: 15px;
			background: #f8fafc;
			border-radius: 10px;
			margin-bottom: 15px;
		}

		.want-attr span {
			color: #718096;
			font-size: 14px;
		}

		.want-price {
			color: #e53e3e !important;
			font-weight: 700;
			font-size: 18px !important;
			background: linear-gradient(45deg, #fed7e2, #fff5f7);
			padding: 4px 12px;
			border-radius: 20px;
		}

		.want-add {
			color: #2d3748 !important;
			font-weight: 600;
			background: #e6fffa;
			padding: 4px 10px;
			border-radius: 6px;
			border: 1px solid #81e6d9;
		}

		.want-contact {
			background: linear-gradient(90deg, #667eea15 0%, #764ba215 100%);
			padding: 15px;
			border-radius: 10px;
			display: flex;
			flex-wrap: wrap;
			gap: 20px;
			align-items: center;
			border: 1px solid #e2e8f0;
		}

		/* 名字边框往左偏移一点点 */
		.want-person {
			margin: 0 0 0 -3px; /* 左边距负值向左偏移 */
			font-weight: 600;
			color: #2d3748;
			background: white;
			padding: 8px 20px;
			border-radius: 25px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
			display: inline-block;
			position: relative;
			z-index: 1;
		}

		.want-contact span {
			color: #4a5568;
			font-size: 14px;
			padding: 6px 12px;
			background: white;
			border-radius: 6px;
			border: 1px solid #e2e8f0;
		}

		/* 分页样式优化 - 使用首页提供的样式 */
		.pages {
			display: flex;
			justify-content: center;
			gap: 8px;
			margin: 40px 0 20px;
			padding: 15px;
		}

		.page-arrow,
		.page-num {
			min-width: 36px;
			height: 36px;
			padding: 0 12px;
			border: none;
			border-radius: 8px;
			background: #f5f5f5;
			color: #333;
			font-size: 14px;
			font-weight: 500;
			text-decoration: none;
			display: flex;
			align-items: center;
			justify-content: center;
			transition: all 0.3s ease;
		}

		.page-arrow:hover,
		.page-num:hover {
			background: #e0e0e0;
			transform: translateY(-2px);
		}

		.page-num.cur {
			background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
			color: white;
			box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
		}

		.page-arrow[href="javascript:void(0)"] {
			background: #e0e0e0;
			color: #999;
			cursor: not-allowed;
		}

		/* 响应式优化 */
		@media (max-width: 768px) {
			.want-li {
				flex-direction: column;
				gap: 15px;
			}

			.want-li .left {
				text-align: center;
			}

			.want-attr, .want-contact {
				flex-direction: column;
				align-items: flex-start;
				gap: 10px;
			}

			.pages {
				flex-wrap: wrap;
			}

			.want-person {
				margin-left: 0; /* 在移动端取消偏移 */
			}
		}

		/* 加载动画效果 */
		@keyframes fadeInUp {
			from {
				opacity: 0;
				transform: translateY(20px);
			}
			to {
				opacity: 1;
				transform: translateY(0);
			}
		}

		.want-item {
			animation: fadeInUp 0.5s ease-out forwards;
			animation-delay: calc(var(--item-index, 0) * 0.1s);
		}

		/* 为当前页按钮添加渐变背景，与整体风格统一 */
		.page-num.cur {
			background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
			color: white;
			border: none;
		}

		/* 当按钮可点击时，悬停效果与整体风格统一 */
		.page-arrow:hover:not([href="javascript:void(0)"]),
		.page-num:hover:not(.cur) {
			background: linear-gradient(90deg, #667eea20 0%, #764ba220 100%);
			color: #667eea;
			border: 1px solid #667eea;
		}

		/* 添加企鹅图标样式 */
		.qq-icon::before {
			content: "🐧 ";
			font-size: 14px;
		}

		/* 电话图标 */
		.phone-icon::before {
			content: "📞 ";
			font-size: 14px;
		}
	</style>
</head>
<body>
<#include "../common/top_header.ftl"/>
<#include "../common/left_menu.ftl"/>
<div class="container">
	<div class="main center clearfix">
		<div class="want-title">求购专区</div>
		<div class="wrap-want-list">
			<ul class="want-list" id="want-list">
				<#if pageBean.content??>
					<#list pageBean.content as wantedGoods>
						<li class="want-item" style="--item-index: ${wantedGoods_index};">
							<div class="want-li clearfix">
								<div class="left">
									<a href="">
										<#if wantedGoods.student.headPic??>
											<img src="/photo/view?filename=${wantedGoods.student.headPic}" alt="头像">
										<#else>
											<img src="/home/imgs/avatar1.png" alt="头像">
										</#if>
									</a>
								</div>
								<div class="right">
									<h4 class="want-name">【求购】
										<span>${wantedGoods.name}</span>
									</h4>
									<p class="want-detail">${wantedGoods.content}</p>
									<div class="want-attr">
										<span>期望价格</span>
										<span class="want-price">¥${wantedGoods.sellPrice}</span>
										<span>期望交易地点：</span>
										<span class="want-add">${wantedGoods.tradePlace}</span>
										<span class="want-time">${wantedGoods.createTime}</span>
									</div>
									<div class="want-contact">
										<p class="want-person">${wantedGoods.student.nickname!""}</p>
										<span class="mr10 phone-icon">${wantedGoods.student.mobile!""}</span>
										<span class="qq-icon">${wantedGoods.student.qq!""}</span>
									</div>
								</div>
							</div>
						</li>
					</#list>
				</#if>
			</ul>
		</div>
		<#if pageBean.total gt 0>
			<!-- 分页 开始 - 使用与首页相同的分页样式 -->
			<div class="pages">
				<#if pageBean.currentPage == 1>
					<a class="page-arrow arrow-left" href="javascript:void(0)">首页</a>
				<#else>
					<a class="page-arrow arrow-left" href="list?currentPage=1">首页</a>
				</#if>
				<#list pageBean.currentShowPage as showPage>
					<#if pageBean.currentPage == showPage>
						<a class="page-num cur" href="javascript:void(0)">${showPage}</a>
					<#else>
						<a class="page-num" href="list?currentPage=${showPage}">${showPage}</a>
					</#if>
				</#list>
				<#if pageBean.currentPage == pageBean.totalPage>
					<a class="page-arrow arrow-right" href="javascript:void(0)">尾页</a>
				<#else>
					<a class="page-arrow arrow-right" href="list?currentPage=${pageBean.totalPage}">尾页</a>
				</#if>
			</div>
			<!-- 分页 结束 -->
		</#if>
	</div>
</div>
<div class="return-to-top"><a href="#"></a></div><!--返回顶部-->
<#include "../common/right_menu.ftl"/>
<#include "../common/bottom_footer.ftl"/>
<script src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/index.js"></script>
<script>
	// 添加简单的交互效果
	$(document).ready(function() {
		// 悬停效果增强
		$('.want-item').hover(
				function() {
					$(this).css({
						'transform': 'translateY(-5px)',
						'box-shadow': '0 10px 25px rgba(0,0,0,0.1)'
					});
				},
				function() {
					$(this).css({
						'transform': 'translateY(0)',
						'box-shadow': '0 5px 15px rgba(0,0,0,0.05)'
					});
				}
		);

		// 分页按钮交互
		$('.page-num, .page-arrow').hover(
				function() {
					if (!$(this).hasClass('cur') && !$(this).attr('href').includes('javascript:void(0)')) {
						$(this).css('transform', 'translateY(-2px)');
					}
				},
				function() {
					$(this).css('transform', 'translateY(0)');
				}
		);

		// 头像点击效果
		$('.want-li .left a img').click(function(e) {
			e.preventDefault();
			$(this).css({
				'transform': 'scale(1.1)',
				'border-color': '#764ba2'
			});
			setTimeout(() => {
				$(this).css({
					'transform': 'scale(1.05)',
					'border-color': '#667eea'
				});
			}, 300);
		});
	});
</script>
</body>
</html>