<nav class="sidebar-main">
	<ul class="nav nav-drawer">
		<li class="nav-item"> <a href="/system/index"><i class="mdi mdi-home"></i> 后台首页</a> </li>
		<#if userTopMenus??>
			<#list userTopMenus as userTopMenu>
				<li class="nav-item nav-item-has-subnav">
					<a href="javascript:void(0)"><i class="mdi ${userTopMenu.icon}"></i>${userTopMenu.name}</a>
					<ul class="nav nav-subnav">
						<#if userSecondMenus??>
							<#list userSecondMenus as userSecondMenu>
								<#if userTopMenu.id == userSecondMenu.parent.id>
									<li class="second-menu"><a href="${userSecondMenu.url}"><i class="mdi ${userSecondMenu.icon}"></i> ${userSecondMenu.name}</a> </li>
								</#if>
							</#list>
						</#if>
					</ul>
				</li>
			</#list>
		</#if>
	</ul>
</nav>

<style>
	/* 后台左侧导航栏样式优化 - 明亮的配色方案 */

	/* 主背景颜色 - 明亮浅灰色渐变 */
	.sidebar-main {
		background: linear-gradient(135deg, #f8f9fa, #e9ecef);
		box-shadow: 2px 0 10px rgba(0, 0, 0, 0.08);
		position: relative;
		z-index: 1;
		border-right: 1px solid #dee2e6;
	}

	/* 导航列表样式 */
	.nav-drawer {
		padding: 15px 0;
	}

	/* 一级菜单项样式 */
	.nav-item {
		margin: 2px 10px;
		border-radius: 6px;
		overflow: hidden;
		transition: all 0.3s ease;
	}

	.nav-item:hover {
		background-color: rgba(52, 152, 219, 0.08);
	}

	.nav-item.active {
		background-color: rgba(52, 152, 219, 0.12);
		border-left: 3px solid #3498db;
	}

	.nav-item > a {
		display: flex;
		align-items: center;
		padding: 12px 15px;
		color: #495057;
		text-decoration: none;
		font-size: 14px;
		font-weight: 500;
		transition: all 0.3s ease;
		position: relative;
		overflow: hidden;
	}

	.nav-item > a:hover {
		color: #3498db;
		background-color: rgba(52, 152, 219, 0.05);
		transform: translateX(3px);
	}

	.nav-item.active > a {
		color: #3498db;
		font-weight: 600;
	}

	/* 图标样式 */
	.nav-item > a i {
		font-size: 18px;
		margin-right: 10px;
		color: #6c757d;
		transition: all 0.3s ease;
		min-width: 24px;
		text-align: center;
	}

	.nav-item > a:hover i,
	.nav-item.active > a i {
		color: #3498db;
		transform: scale(1.1);
	}

	/* 有子菜单的项 */
	.nav-item-has-subnav > a::after {
		content: '▸';
		position: absolute;
		right: 15px;
		top: 50%;
		transform: translateY(-50%) rotate(0);
		color: #adb5bd;
		font-size: 12px;
		transition: all 0.3s ease;
	}

	.nav-item-has-subnav:hover > a::after,
	.nav-item-has-subnav.active > a::after {
		color: #3498db;
		transform: translateY(-50%) rotate(90deg);
	}

	/* 二级子菜单样式 */
	.nav-subnav {
		background-color: rgba(255, 255, 255, 0.5);
		border-radius: 4px;
		margin: 5px 15px 5px 20px;
		padding: 0;
		max-height: 0;
		overflow: hidden;
		transition: max-height 0.4s cubic-bezier(0.4, 0, 0.2, 1);
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.03);
	}

	.nav-item-has-subnav.active .nav-subnav,
	.nav-item-has-subnav:hover .nav-subnav {
		max-height: 500px;
	}

	/* 二级菜单项 */
	.second-menu {
		margin: 2px 0;
		border-radius: 4px;
		overflow: hidden;
		transition: all 0.2s ease;
	}

	.second-menu:hover {
		background-color: rgba(52, 152, 219, 0.08);
	}

	.second-menu.active {
		background-color: rgba(52, 152, 219, 0.12);
	}

	.second-menu > a {
		display: flex;
		align-items: center;
		padding: 10px 15px;
		color: #6c757d;
		text-decoration: none;
		font-size: 13px;
		font-weight: 400;
		transition: all 0.3s ease;
		padding-left: 35px;
		position: relative;
	}

	.second-menu > a:hover {
		color: #3498db;
		background-color: rgba(52, 152, 219, 0.05);
		padding-left: 40px;
	}

	.second-menu.active > a {
		color: #3498db;
		background-color: rgba(52, 152, 219, 0.1);
	}

	.second-menu > a i {
		font-size: 14px;
		margin-right: 8px;
		color: #adb5bd;
		transition: all 0.3s ease;
		min-width: 20px;
		text-align: center;
	}

	.second-menu > a:hover i,
	.second-menu.active > a i {
		color: #3498db;
	}

	/* 二级菜单前的指示器 */
	.second-menu > a::before {
		content: '';
		position: absolute;
		left: 20px;
		top: 50%;
		transform: translateY(-50%);
		width: 5px;
		height: 5px;
		background-color: #adb5bd;
		border-radius: 50%;
		transition: all 0.3s ease;
	}

	.second-menu > a:hover::before,
	.second-menu.active > a::before {
		background-color: #3498db;
		transform: translateY(-50%) scale(1.5);
		box-shadow: 0 0 6px rgba(52, 152, 219, 0.4);
	}

	/* 微妙的动画效果 */
	.nav-item > a::before {
		content: '';
		position: absolute;
		left: 0;
		top: 0;
		height: 100%;
		width: 3px;
		background: linear-gradient(to bottom, #3498db, #5dade2);
		transform: scaleY(0);
		transition: transform 0.3s ease;
		border-radius: 0 3px 3px 0;
	}

	.nav-item:hover > a::before,
	.nav-item.active > a::before {
		transform: scaleY(1);
	}

	/* 发光效果 */
	.nav-item > a::after {
		content: '';
		position: absolute;
		top: 0;
		left: -100%;
		width: 50%;
		height: 100%;
		background: linear-gradient(90deg, transparent, rgba(52, 152, 219, 0.05), transparent);
		transition: left 0.6s ease;
	}

	.nav-item > a:hover::after {
		left: 100%;
	}

	/* 选中状态的高亮效果 */
	.nav-item.active {
		box-shadow: 0 2px 8px rgba(52, 152, 219, 0.1);
	}

	/* 子菜单展开时的动画 */
	.nav-subnav {
		animation: slideDown 0.4s ease forwards;
	}

	@keyframes slideDown {
		from {
			opacity: 0;
			transform: translateY(-10px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* 响应式调整 - 保持大小不变 */
	@media (max-width: 768px) {
		.sidebar-main {
			width: 100%;
		}

		.nav-item > a {
			padding: 10px 15px;
		}

		.second-menu > a {
			padding: 8px 15px 8px 30px;
		}
	}

	/* 滚动条样式优化 */
	.sidebar-main::-webkit-scrollbar {
		width: 4px;
	}

	.sidebar-main::-webkit-scrollbar-track {
		background: rgba(0, 0, 0, 0.05);
	}

	.sidebar-main::-webkit-scrollbar-thumb {
		background: rgba(108, 117, 125, 0.3);
		border-radius: 4px;
	}

	.sidebar-main::-webkit-scrollbar-thumb:hover {
		background: rgba(108, 117, 125, 0.5);
	}

	/* 添加一些微妙的纹理效果 */
	.sidebar-main::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background:
				linear-gradient(transparent 95%, rgba(0, 0, 0, 0.01) 95%),
				linear-gradient(90deg, transparent 95%, rgba(0, 0, 0, 0.01) 95%);
		background-size: 20px 20px;
		opacity: 0.1;
		pointer-events: none;
		z-index: -1;
	}

	/* 首页菜单项特殊样式 */
	.nav-item:first-child > a {
		background-color: rgba(52, 152, 219, 0.05);
		border-radius: 6px;
		border: 1px solid rgba(52, 152, 219, 0.1);
	}

	.nav-item:first-child > a:hover {
		background-color: rgba(52, 152, 219, 0.1);
	}

	.nav-item:first-child > a i {
		color: #3498db;
	}

	/* 添加菜单项计数器的样式（如果需要） */
	.menu-badge {
		position: absolute;
		right: 15px;
		top: 50%;
		transform: translateY(-50%);
		background-color: #e74c3c;
		color: white;
		font-size: 11px;
		font-weight: 600;
		padding: 2px 6px;
		border-radius: 10px;
		min-width: 18px;
		text-align: center;
	}

	/* 菜单项分隔线 */
	.nav-item:not(:first-child) {
		border-top: 1px solid rgba(0, 0, 0, 0.03);
	}
</style>

<script>
	// 可选：添加一些交互效果
	document.addEventListener('DOMContentLoaded', function() {
		// 点击菜单项时添加active类
		const navItems = document.querySelectorAll('.nav-item > a');
		navItems.forEach(item => {
			item.addEventListener('click', function(e) {
				// 如果点击的是有子菜单的项，阻止默认行为
				if (this.parentElement.classList.contains('nav-item-has-subnav')) {
					e.preventDefault();

					// 切换active类
					const isActive = this.parentElement.classList.contains('active');

					// 移除其他active类
					document.querySelectorAll('.nav-item.active').forEach(el => {
						if (el !== this.parentElement) {
							el.classList.remove('active');
						}
					});

					// 切换当前项的active类
					this.parentElement.classList.toggle('active', !isActive);
				} else {
					// 对于没有子菜单的项，直接设置为active
					document.querySelectorAll('.nav-item.active').forEach(el => {
						el.classList.remove('active');
					});
					this.parentElement.classList.add('active');
				}
			});
		});

		// 点击二级菜单项时
		const secondMenus = document.querySelectorAll('.second-menu > a');
		secondMenus.forEach(menu => {
			menu.addEventListener('click', function(e) {
				// 移除其他active类
				document.querySelectorAll('.second-menu.active').forEach(el => {
					el.classList.remove('active');
				});

				// 为当前点击的li添加active类
				const parentLi = this.closest('.second-menu');
				if (parentLi) {
					parentLi.classList.add('active');
				}
			});
		});
	});
</script>