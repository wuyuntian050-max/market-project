<!--头部信息-->
<header class="lyear-layout-header">
  <nav class="navbar navbar-default">
    <div class="topbar">
      <div class="topbar-left">
        <div class="lyear-aside-toggler">
          <span class="lyear-toggler-bar"></span>
          <span class="lyear-toggler-bar"></span>
          <span class="lyear-toggler-bar"></span>
        </div>
        <span class="navbar-page-title"> ${title!""} </span>
      </div>

      <ul class="topbar-right">
        <li class="dropdown dropdown-profile">
          <a href="javascript:void(0)" data-toggle="dropdown">
            <#if ylrc_user.headPic??>
              <#if ylrc_user.headPic?length gt 0>
                <img class="img-avatar img-avatar-48 m-r-10" src="/photo/view?filename=${ylrc_user.headPic}" alt="${ylrc_user.username!""}" />
              <#else>
                <img class="img-avatar img-avatar-48 m-r-10" src="/admin/images/default-head.jpg" alt="${ylrc_user.username!""}" />
              </#if>
            </#if>
            <span>${ylrc_user.username!""} <span class="caret"></span></span>
          </a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li> <a href="/system/update_userinfo"><i class="mdi mdi-account"></i> 个人信息</a> </li>
            <li> <a href="/system/update_pwd"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
            <li class="divider"></li>
            <li> <a href="/system/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
          </ul>
        </li>
        <!--切换主题配色-->
        <li class="dropdown dropdown-skin">
          <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
          <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
            <li class="drop-title"><p>主题</p></li>
            <li class="drop-skin-li clearfix">
              <span class="inverse">
                <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                <label for="site_theme_1"></label>
              </span>
              <span>
                <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                <label for="site_theme_2"></label>
              </span>
              <span>
                <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                <label for="site_theme_3"></label>
              </span>
            </li>
            <li class="drop-title"><p>LOGO</p></li>
            <li class="drop-skin-li clearfix">
              <span class="inverse">
                <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                <label for="logo_bg_1"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                <label for="logo_bg_2"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                <label for="logo_bg_3"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                <label for="logo_bg_4"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                <label for="logo_bg_5"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                <label for="logo_bg_6"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                <label for="logo_bg_7"></label>
              </span>
              <span>
                <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                <label for="logo_bg_8"></label>
              </span>
            </li>
            <li class="drop-title"><p>头部</p></li>
            <li class="drop-skin-li clearfix">
              <span class="inverse">
                <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                <label for="header_bg_1"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                <label for="header_bg_2"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                <label for="header_bg_3"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                <label for="header_bg_4"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                <label for="header_bg_5"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                <label for="header_bg_6"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                <label for="header_bg_7"></label>
              </span>
              <span>
                <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                <label for="header_bg_8"></label>
              </span>
            </li>
            <li class="drop-title"><p>侧边栏</p></li>
            <li class="drop-skin-li clearfix">
              <span class="inverse">
                <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                <label for="sidebar_bg_1"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                <label for="sidebar_bg_2"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                <label for="sidebar_bg_3"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                <label for="sidebar_bg_4"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                <label for="sidebar_bg_5"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                <label for="sidebar_bg_6"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                <label for="sidebar_bg_7"></label>
              </span>
              <span>
                <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                <label for="sidebar_bg_8"></label>
              </span>
            </li>
          </ul>
        </li>
        <!--切换主题配色-->
      </ul>
    </div>
  </nav>
</header>
<!--End 头部信息-->

<style>
  /* 头部导航栏样式优化 */
  .lyear-layout-header {
    box-shadow: 0 1px 3px rgba(0,0,0,0.08);
  }

  .navbar-default {
    background: linear-gradient(135deg, #ffffff, #f8f9fa);
    border-bottom: 1px solid #eaeaea;
  }

  .topbar {
    padding: 0 20px;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* 左侧区域 */
  .topbar-left {
    display: flex;
    align-items: center;
  }

  .lyear-aside-toggler {
    display: flex;
    flex-direction: column;
    justify-content: center;
    cursor: pointer;
    padding: 10px;
    margin-right: 15px;
    border-radius: 4px;
    transition: background-color 0.2s;
  }

  .lyear-aside-toggler:hover {
    background-color: rgba(0,0,0,0.05);
  }

  .lyear-toggler-bar {
    display: block;
    width: 20px;
    height: 2px;
    background-color: #495057;
    margin: 2px 0;
    border-radius: 1px;
    transition: background-color 0.2s;
  }

  .lyear-aside-toggler:hover .lyear-toggler-bar {
    background-color: #3498db;
  }

  .navbar-page-title {
    font-size: 16px;
    font-weight: 600;
    color: #2c3e50;
    letter-spacing: 0.3px;
  }

  /* 右侧区域 */
  .topbar-right {
    display: flex;
    align-items: center;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  /* 用户信息下拉 */
  .dropdown-profile {
    position: relative;
  }

  .dropdown-profile > a {
    display: flex;
    align-items: center;
    padding: 8px 12px;
    border-radius: 20px;
    color: #495057;
    text-decoration: none;
    transition: all 0.2s;
  }

  .dropdown-profile > a:hover {
    background-color: rgba(52, 152, 219, 0.1);
    color: #3498db;
  }

  .img-avatar-48 {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #e9ecef;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }

  .dropdown-profile > a span:not(.caret) {
    margin: 0 8px;
    font-weight: 500;
  }

  .caret {
    border-top: 4px solid;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
  }

  /* 下拉菜单 */
  .dropdown-menu {
    border: 1px solid rgba(0,0,0,0.08);
    border-radius: 6px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
    margin-top: 8px;
    padding: 5px 0;
    min-width: 180px;
    background: white;
  }

  .dropdown-menu li a {
    display: flex;
    align-items: center;
    padding: 10px 15px;
    color: #495057;
    text-decoration: none;
    font-size: 14px;
    transition: all 0.2s;
  }

  .dropdown-menu li a:hover {
    background-color: #f8f9fa;
    color: #3498db;
  }

  .dropdown-menu li a i {
    margin-right: 10px;
    width: 18px;
    text-align: center;
    font-size: 16px;
  }

  .dropdown-menu .divider {
    height: 1px;
    margin: 5px 0;
    background-color: #e9ecef;
  }

  /* 主题切换按钮 */
  .dropdown-skin {
    margin-left: 10px;
  }

  .icon-palette {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    color: #6c757d;
    cursor: pointer;
    font-size: 18px;
    transition: all 0.2s;
  }

  .icon-palette:hover {
    background-color: rgba(108, 117, 125, 0.1);
    color: #495057;
  }

  /* 主题选择菜单 */
  .dropdown-menu .drop-title {
    padding: 8px 15px;
    margin: 0;
    font-size: 13px;
    font-weight: 600;
    color: #6c757d;
    border-bottom: 1px solid #e9ecef;
  }

  .dropdown-menu .drop-title p {
    margin: 0;
  }

  .drop-skin-li {
    padding: 10px 15px;
  }

  .drop-skin-li.clearfix {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  .drop-skin-li span {
    display: inline-flex;
    align-items: center;
    margin-bottom: 5px;
  }

  .drop-skin-li input[type="radio"] {
    display: none;
  }

  .drop-skin-li label {
    display: inline-block;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    cursor: pointer;
    border: 2px solid white;
    box-shadow: 0 0 0 1px #dee2e6;
    transition: all 0.2s;
  }

  .drop-skin-li input[type="radio"]:checked + label {
    box-shadow: 0 0 0 2px #3498db, 0 0 0 3px white;
    transform: scale(1.1);
  }

  /* 主题颜色 */
  #site_theme_1 + label { background-color: #ffffff; border: 1px solid #dee2e6; }
  #site_theme_2 + label { background-color: #343a40; }
  #site_theme_3 + label { background-color: rgba(255,255,255,0.9); border: 1px solid #dee2e6; }

  #logo_bg_1 + label { background-color: #ffffff; border: 1px solid #dee2e6; }
  #logo_bg_2 + label { background-color: #3498db; }
  #logo_bg_3 + label { background-color: #2ecc71; }
  #logo_bg_4 + label { background-color: #9b59b6; }
  #logo_bg_5 + label { background-color: #e74c3c; }
  #logo_bg_6 + label { background-color: #f39c12; }
  #logo_bg_7 + label { background-color: #1abc9c; }
  #logo_bg_8 + label { background-color: #34495e; }

  #header_bg_1 + label { background-color: #ffffff; border: 1px solid #dee2e6; }
  #header_bg_2 + label { background-color: #f8f9fa; }
  #header_bg_3 + label { background-color: #3498db; }
  #header_bg_4 + label { background-color: #2ecc71; }
  #header_bg_5 + label { background-color: #9b59b6; }
  #header_bg_6 + label { background-color: #e74c3c; }
  #header_bg_7 + label { background-color: #f39c12; }
  #header_bg_8 + label { background-color: #34495e; }

  #sidebar_bg_1 + label { background-color: #2c3e50; }
  #sidebar_bg_2 + label { background-color: #34495e; }
  #sidebar_bg_3 + label { background-color: #1a252f; }
  #sidebar_bg_4 + label { background-color: #3498db; }
  #sidebar_bg_5 + label { background-color: #2ecc71; }
  #sidebar_bg_6 + label { background-color: #9b59b6; }
  #sidebar_bg_7 + label { background-color: #e74c3c; }
  #sidebar_bg_8 + label { background-color: #f39c12; }

  /* 响应式调整 */
  @media (max-width: 768px) {
    .topbar {
      padding: 0 15px;
    }

    .navbar-page-title {
      font-size: 15px;
    }

    .dropdown-profile > a span:not(.caret) {
      display: none;
    }

    .caret {
      display: none;
    }
  }

  /* 悬停效果优化 */
  .dropdown-profile > a:hover .img-avatar-48 {
    border-color: #3498db;
    transform: scale(1.05);
  }

  .dropdown-menu li a:hover i {
    color: #3498db;
  }
</style>