<style>
	/* 右侧用户信息区域样式 */
	/* 修改右侧用户信息区域样式 - 添加移动效果 */
	.loginandrigist {
		margin-left: 0;
		margin-top: 0;
	}

	#person_info {
		cursor: pointer;
		position: relative;
		display: flex;
		align-items: center;
		gap: 10px;
	}

	.clearfix {
		zoom: 1;
	}

	/* 登录注册区域整体移动 */
	.ease2.log-reg {
		position: absolute;
		right: -100px;  /* 向右移动30px */
		top: 30px;     /* 向上移动10px */
		transform: translateY(-5px); /* 微调垂直位置 */
	}

	/* 已登录状态样式优化 */
	#have_login {
		display: flex;
		align-items: center;
		background: rgba(147, 63, 232, 0.08);
		padding: 6px 15px;
		border-radius: 25px;
		border: 1px solid rgba(147, 63, 232, 0.15);
		transition: all 0.3s ease;
		height: auto;
	}

	#have_login:hover {
		background: rgba(147, 63, 232, 0.12);
		border-color: rgba(147, 63, 232, 0.25);
		transform: translateY(-1px);
		box-shadow: 0 3px 8px rgba(147, 63, 232, 0.15);
	}

	/* 头像样式优化 */
	.avatar {
		border-radius: 50%;
		border: 2px solid rgba(147, 63, 232, 0.3);
		padding: 2px;
		width: 44px;
		height: 44px;
		transition: all 0.3s ease;
		background: white;
		box-shadow: 0 2px 5px rgba(147, 63, 232, 0.1);
	}

	.avatar:hover {
		border-color: #933fe8;
		transform: scale(1.05);
		box-shadow: 0 3px 10px rgba(147, 63, 232, 0.2);
	}

	/* 用户信息区域 */
	.person_name {
		float: none;
		color: #333;
		margin: 0;
		max-width: 120px;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
		font-size: 14px;
	}

	.person_name a {
		color: #333;
		text-decoration: none;
		transition: all 0.2s ease;
		font-weight: 500;
	}

	.person_name a:hover {
		color: #933fe8;
	}

	#id-btn {
		font-weight: 600;
		color: #933fe8;
	}

	#log-btn {
		color: #ff6b6b;
		font-size: 13px;
		padding: 4px 12px;
		border-radius: 15px;
		background: rgba(255, 107, 107, 0.1);
		border: 1px solid rgba(255, 107, 107, 0.2);
		margin-left: 5px;
		transition: all 0.3s ease;
	}

	#log-btn:hover {
		background: rgba(255, 107, 107, 0.2);
		color: #ff4757;
		border-color: rgba(255, 107, 107, 0.3);
		transform: translateY(-1px);
	}

	/* 登录/注册按钮样式优化 */
	#have-not-login .button {
		border: 1px solid #933fe8;
		border-radius: 25px;
		padding: 8px 20px;
		background: linear-gradient(135deg, #933fe8 0%, #7a1fd9 100%);
		color: white;
		text-align: center;
		line-height: 16px;
		cursor: pointer;
		transition: all 0.3s ease;
		box-shadow: 0 2px 8px rgba(147, 63, 232, 0.2);
	}

	#have-not-login .button:hover {
		transform: translateY(-2px);
		box-shadow: 0 4px 12px rgba(147, 63, 232, 0.3);
		background: linear-gradient(135deg, #7a1fd9 0%, #6715c5 100%);
	}

	#have-not-login .button a {
		color: white;
		text-decoration: none;
		font-size: 14px;
		font-weight: 600;
	}

	/* 搜索框样式优化 - 修复搜索图标显示问题 */
	.search-box.center {
		background: rgba(255, 255, 255, 0.95);
		border: 2px solid rgba(147, 63, 232, 0.2);
		border-radius: 30px;
		box-shadow: 0 4px 15px rgba(147, 63, 232, 0.1);
		transition: all 0.3s ease;
		overflow: hidden;
	}

	.search-box.center:focus-within {
		border-color: #933fe8;
		box-shadow: 0 6px 20px rgba(147, 63, 232, 0.2);
		transform: translateY(-1px);
	}

	.search-submit {
		background: linear-gradient(135deg, #933fe8 0%, #7a1fd9 100%);
		color: white;
		border: none;
		border-radius: 20px;
		padding: 10px 24px;
		cursor: pointer;
		font-size: 15px;
		font-weight: 600;
		transition: all 0.3s ease;
		position: relative;
		overflow: hidden;
		box-shadow: 0 3px 10px rgba(147, 63, 232, 0.3);
	}

	.search-submit:hover {
		background: linear-gradient(135deg, #7a1fd9 0%, #6715c5 100%);
		transform: translateY(-2px);
		box-shadow: 0 5px 15px rgba(147, 63, 232, 0.4);
	}

	.search-submit:active {
		transform: translateY(0);
		box-shadow: 0 2px 8px rgba(147, 63, 232, 0.3);
	}

	/* 搜索图标恢复正常显示 */
	.search-icon {
		height: 24px;
		margin: 13px 0 0 18px;
		float: left;
		/* 移除所有滤镜效果，让图片正常显示 */
		filter: none !important;
		-webkit-filter: none !important;
		opacity: 1 !important;
		/* 确保图片不被颜色覆盖 */
		background: transparent !important;
	}

	/* 确保input-wr的样式不会影响图标 */
	.input-wr {
		/* 保持原有样式 */
	}

	.search-input input {
		color: #333;
		font-size: 15px;
		background: transparent;
		border: none;
		outline: none;
		width: 100%;
		transition: all 0.3s ease;
	}

	.search-input input::placeholder {
		color: #999;
		font-weight: 300;
	}

	.search-input input:focus {
		color: #933fe8;
	}

	.search-hots.center.ease2 span {
		color: #666;
		font-weight: 600;
		background: rgba(147, 63, 232, 0.08);
		padding: 4px 12px;
		border-radius: 15px;
		font-size: 13px;
	}

	.search-hots.center.ease2 a.hots {
		color: #666;
		background: rgba(147, 63, 232, 0.05);
		padding: 4px 12px;
		border-radius: 15px;
		font-size: 13px;
		border: 1px solid transparent;
		transition: all 0.3s ease;
	}

	.search-hots.center.ease2 a.hots:hover {
		color: #933fe8;
		background: rgba(147, 63, 232, 0.1);
		border-color: rgba(147, 63, 232, 0.2);
		transform: translateY(-1px);
	}

	/* 响应式调整 */
	@media (max-width: 1024px) {
		#have_login {
			padding: 5px 12px;
		}

		.avatar {
			width: 40px;
			height: 40px;
		}

		.person_name {
			max-width: 100px;
		}

		#have-not-login .button {
			padding: 7px 18px;
		}

		.search-box.center {
			border-radius: 25px;
		}

		.search-submit {
			padding: 8px 20px;
			font-size: 14px;
		}

		.search-icon {
			height: 22px;
			margin: 11px 0 0 15px;
		}
	}

	@media (max-width: 768px) {
		#have_login {
			flex-direction: column;
			align-items: center;
			padding: 10px;
			width: auto;
		}

		#person_info {
			flex-direction: column;
			gap: 8px;
			text-align: center;
		}

		.person_name {
			max-width: 150px;
		}

		#log-btn {
			margin-left: 0;
			margin-top: 5px;
		}

		.search-box.center {
			padding: 8px 15px;
		}

		.search-submit {
			padding: 7px 18px;
		}

		.search-icon {
			height: 20px;
			margin: 10px 0 0 12px;
		}
	}
</style>

<header class="ease2">
	<a href="/home/index/index">
		<#if siteSetting.logo1??>
			<img class="logo ease2" src="/photo/view?filename=${siteSetting.logo1}" alt="${siteSetting.siteName}">
		<#else>
			<img class="logo ease2" src="/home/imgs/index_logo.png" alt="${siteSetting.siteName}">
		</#if>
	</a>
	<div class="header-main center ease2">
		<a href="/home/index/index" class="slogan">
			<h1 class="s-main"></h1>
			<div class="s-submain"></div>
			<#if siteSetting.logo1??>
				<img src="/photo/view?filename=${siteSetting.logo2}" alt="${siteSetting.siteName!""}">
			<#else>
				<img src="/home/imgs/2shoujie_web_title.png" alt="${siteSetting.siteName!""}">
			</#if>
		</a>
		<div class="search-box-wr ease2">
			<div class="search-box center">
				<button class="search-submit" id="search-button" onclick="searchPro()">搜索</button>
				<div class="input-wr">
					<img class="search-icon" src="/home/imgs/search-icon.png">
					<div class="search-input">
						<input name="keyword" id="keyword" x-webkit-speech="" placeholder="搜索你想要的商品" value="" type="text">
					</div>
				</div>
			</div>

			<div class="search-hots center ease2">
				<span>热门：</span>
				<#list goodsCategorys as hotGoodsCategory>
					<#if hotGoodsCategory.parent??>
					<#else>
						<a class="hots" href="/home/goods/list?cid=${hotGoodsCategory.id}" target="_top">${hotGoodsCategory.name}</a>
					</#if>
					<#if hotGoodsCategory_index == 20>
						<#break>
					</#if>
				</#list>
			</div>
		</div>

		<div class="ease2 log-reg" id="have-not-login">
			<#if ylrc_student??>
				<div id="have_login" class="clearfix">
					<div id="person_info" class="clearfix">
						<a href="../student/index">
							<#if ylrc_student.headPic??>
								<img class="avatar" style="height:44px;width:44px;" src="/photo/view?filename=${ylrc_student.headPic}">
							<#else>
								<img class="avatar" style="height:44px;width:44px;" src="/home/imgs/avatar1.png">
							</#if>
						</a>
						<div class="person_name">
							<a href="../student/index" id="id-btn">Hi：${ylrc_student.nickname!ylrc_student.sn}</a>
						</div>
						<div class="person_name">
							<a href="../index/logout" id="log-btn">退出</a>
						</div>
					</div>
				</div>
			<#else>
				<div class="button"><a href="../index/login">登录/注册</a></div>
			</#if>
		</div>
	</div>
</header>

<script type="text/javascript">
	function searchPro(){
		var keyword=$("#keyword").val();
		if(keyword.trim() === ''){
			// 给搜索框添加一个短暂的红色边框提示
			$("#keyword").css({
				'border': '2px solid #ff6b6b',
				'animation': 'shake 0.3s'
			});
			setTimeout(function() {
				$("#keyword").css({
					'border': 'none',
					'animation': ''
				});
			}, 300);
			return;
		}
		window.location.href="/home/index/index?name="+encodeURIComponent(keyword);
	}

	// 添加回车键搜索功能
	$(document).ready(function(){
		$('#keyword').on('keypress', function(e){
			if(e.which === 13){
				searchPro();
			}
		});

		// 添加搜索框动画效果
		$('#keyword').on('focus', function(){
			$(this).css('color', '#933fe8');
		}).on('blur', function(){
			$(this).css('color', '#333');
		});
	});
</script>

<style>
	@keyframes shake {
		0% { transform: translateX(0); }
		25% { transform: translateX(-5px); }
		50% { transform: translateX(5px); }
		75% { transform: translateX(-5px); }
		100% { transform: translateX(0); }
	}
</style>