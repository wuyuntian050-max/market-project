<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>${siteName!""}登录页面</title>
  <#include "../common/header.ftl"/>
  <style>
    /* 重置与基础样式 */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', 'Microsoft YaHei', 'PingFang SC', sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      position: relative;
      overflow-x: hidden;
    }

    /* 粒子背景效果 */
    .particles-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
      pointer-events: none;
    }

    /* 主容器样式 */
    .lyear-wrapper {
      position: relative;
      z-index: 2;
    }

    .lyear-login {
      display: flex !important;
      min-height: 100vh;
      align-items: center !important;
      justify-content: center !important;
      padding: 20px;
    }

    /* 登录中心区域 - 现代化设计 */
    .login-center {
      background: rgba(255, 255, 255, 0.95);
      min-width: 420px;
      max-width: 450px;
      padding: 40px 35px;
      border-radius: 20px;
      box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      position: relative;
      overflow: hidden;
    }

    /* 登录中心区域背景装饰 */
    .login-center::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 5px;
      background: linear-gradient(90deg, #667eea, #764ba2, #4BC0A5);
      border-radius: 20px 20px 0 0;
    }

    /* 登录头部样式 */
    .login-header {
      margin-bottom: 30px !important;
      text-align: center;
      position: relative;
      padding-bottom: 20px;
    }

    .login-header::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 3px;
      background: linear-gradient(90deg, #667eea, #764ba2);
      border-radius: 2px;
    }

    .login-header img {
      max-width: 180px;
      height: auto;
      filter: drop-shadow(0 3px 6px rgba(0,0,0,0.1));
      transition: transform 0.3s ease;
    }

    .login-header img:hover {
      transform: scale(1.05);
    }

    /* 表单组样式 */
    .form-group {
      margin-bottom: 25px;
      position: relative;
    }

    /* 输入框容器 */
    .has-feedback.feedback-left {
      position: relative;
    }

    /* 输入框样式 */
    .form-control {
      width: 100%;
      padding: 16px 16px 16px 50px;
      border: 2px solid #e1e5e9;
      border-radius: 12px;
      font-size: 16px;
      transition: all 0.3s ease;
      background: #f8f9fa;
      color: #333;
      height: 52px;
      font-family: inherit;
    }

    .form-control:focus {
      outline: none;
      border-color: #667eea;
      background: white;
      box-shadow: 0 5px 20px rgba(102, 126, 234, 0.15);
      transform: translateY(-2px);
    }

    /* 图标样式 */
    .has-feedback.feedback-left .form-control-feedback {
      position: absolute;
      left: 0;
      right: auto;
      width: 50px;
      height: 52px;
      line-height: 52px;
      z-index: 4;
      color: #667eea;
      font-size: 20px;
      text-align: center;
      transition: all 0.3s ease;
    }

    .form-control:focus + .form-control-feedback {
      color: #764ba2;
      transform: scale(1.1);
    }

    /* 验证码行样式 */
    .form-group.has-feedback.feedback-left.row {
      margin-bottom: 30px;
    }

    .col-xs-7, .col-xs-5 {
      padding: 0;
    }

    /* 验证码输入框 */
    #cpacha {
      padding-left: 50px;
    }

    /* 验证码图片 */
    #captcha {
      width: 100%;
      height: 52px;
      border-radius: 12px;
      border: 2px solid #e1e5e9;
      transition: all 0.3s ease;
      background: #f8f9fa;
    }

    #captcha:hover {
      border-color: #667eea;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
    }

    /* 登录按钮样式 */
    .btn-primary {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      padding: 16px;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      display: block;
      width: 100%;
      letter-spacing: 1px;
      text-transform: uppercase;
      position: relative;
      overflow: hidden;
    }

    .btn-primary:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
    }

    .btn-primary:active {
      transform: translateY(-1px);
    }

    .btn-primary:before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: 0.5s;
    }

    .btn-primary:hover:before {
      left: 100%;
    }

    /* 分隔线 */
    hr {
      border: none;
      height: 1px;
      background: linear-gradient(90deg, transparent, #e1e5e9, transparent);
      margin: 30px 0;
    }

    /* 页脚样式 */
    footer {
      text-align: center;
      color: #666;
      font-size: 14px;
      padding: 15px 0 0;
    }

    footer p {
      margin: 0;
      line-height: 1.6;
    }

    footer a {
      color: #667eea;
      text-decoration: none;
      transition: color 0.3s ease;
      font-weight: 500;
    }

    footer a:hover {
      color: #764ba2;
      text-decoration: underline;
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
      .login-center {
        min-width: 100%;
        max-width: 100%;
        padding: 30px 25px;
        margin: 20px;
        border-radius: 15px;
      }

      .login-header img {
        max-width: 150px;
      }

      .form-control {
        padding: 14px 14px 14px 45px;
        height: 48px;
      }

      .has-feedback.feedback-left .form-control-feedback {
        height: 48px;
        line-height: 48px;
        width: 45px;
      }
    }

    @media (max-width: 480px) {
      .login-center {
        padding: 25px 20px;
        margin: 15px;
      }

      .login-header {
        margin-bottom: 25px !important;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .btn-primary {
        padding: 14px;
        font-size: 15px;
      }

      .col-xs-7, .col-xs-5 {
        width: 100%;
        margin-bottom: 15px;
      }

      .col-xs-5 {
        margin-bottom: 0;
      }
    }

    /* 动画效果 */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .login-center {
      animation: fadeInUp 0.8s ease-out;
    }

    /* 错误消息样式 */
    .error-msg {
      color: #ff4757;
      font-size: 14px;
      margin-top: 8px;
      display: none;
      padding-left: 10px;
      position: absolute;
      bottom: -22px;
      left: 0;
    }

    /* 加载状态 */
    .btn-primary.loading {
      opacity: 0.8;
      pointer-events: none;
    }

    .btn-primary.loading:after {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      width: 20px;
      height: 20px;
      margin: -10px 0 0 -10px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-top-color: white;
      border-radius: 50%;
      animation: spin 0.8s linear infinite;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    /* 输入框错误状态 */
    .form-control.error {
      border-color: #ff4757;
      animation: shake 0.5s ease-in-out;
    }

    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      25% { transform: translateX(-5px); }
      75% { transform: translateX(5px); }
    }
  </style>
</head>

<body>
<!-- 粒子背景 -->
<div class="particles-container" id="particles-js"></div>

<div class="row lyear-wrapper">
  <div class="lyear-login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href=""> <img alt="light year admin" src="/admin/images/logo-sidebar.png"></a>
      </div>
      <form id="login-form" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control required" name="username" id="username" tips="请填写用户名" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
          <div class="error-msg" id="username-error"></div>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control required" id="password" name="password" tips="请填写密码" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
          <div class="error-msg" id="password-error"></div>
        </div>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" name="cpacha" id="cpacha" maxlength="4" class="form-control required" placeholder="验证码" tips="请填验证码" >
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
            <div class="error-msg" id="cpacha-error"></div>
          </div>
          <div class="col-xs-5">
            <img src="/cpacha/generate_cpacha?vl=4&fs=25&w=128&h=40&method=admin_login" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'&d='+Math.random();" title="点击刷新" alt="captcha">
          </div>
        </div>
        <div class="form-group">
          <button class="btn btn-block btn-primary" type="button" id="submit-btn">立即登录</button>
        </div>
      </form>
      <hr>
      <footer class="col-sm-12 text-center">
        <p class="m-b-0">Copyright © 2024 <a href="${siteUrl!""}"></a>. All right reserved</p>
      </footer>
    </div>
  </div>
</div>
<#include "../common/footer.ftl"/>

<!-- 粒子效果库 -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<script type="text/javascript">
  // 初始化粒子背景
  if (typeof particlesJS !== 'undefined') {
    particlesJS('particles-js', {
      particles: {
        number: { value: 80, density: { enable: true, value_area: 800 } },
        color: { value: "#ffffff" },
        shape: { type: "circle" },
        opacity: { value: 0.3, random: true },
        size: { value: 3, random: true },
        line_linked: {
          enable: true,
          distance: 150,
          color: "#ffffff",
          opacity: 0.1,
          width: 1
        },
        move: {
          enable: true,
          speed: 2,
          direction: "none",
          random: true,
          straight: false,
          out_mode: "out",
          bounce: false
        }
      },
      interactivity: {
        detect_on: "canvas",
        events: {
          onhover: { enable: true, mode: "repulse" },
          onclick: { enable: true, mode: "push" }
        }
      },
      retina_detect: true
    });
  }

  $(document).ready(function(){
    // 表单验证函数
    function validateForm() {
      var isValid = true;

      // 隐藏所有错误信息
      $('.error-msg').hide();
      $('.form-control').removeClass('error');

      // 验证用户名
      var username = $("#username").val().trim();
      if (!username) {
        $("#username-error").text("请输入用户名").show();
        $("#username").addClass('error');
        isValid = false;
      }

      // 验证密码
      var password = $("#password").val().trim();
      if (!password) {
        $("#password-error").text("请输入密码").show();
        $("#password").addClass('error');
        isValid = false;
      }

      // 验证验证码
      var cpacha = $("#cpacha").val().trim();
      if (!cpacha) {
        $("#cpacha-error").text("请输入验证码").show();
        $("#cpacha").addClass('error');
        isValid = false;
      } else if (cpacha.length < 4) {
        $("#cpacha-error").text("验证码应为4位").show();
        $("#cpacha").addClass('error');
        isValid = false;
      }

      return isValid;
    }

    // 点击登录按钮
    $("#submit-btn").click(function(){
      if(!validateForm()){
        return;
      }

      var username = $("#username").val();
      var password = $("#password").val();
      var cpacha = $("#cpacha").val();

      // 显示加载状态
      $(this).addClass('loading').prop('disabled', true);

      $.ajax({
        url:'/system/login',
        type:'POST',
        data:{username:username,password:password,cpacha:cpacha},
        dataType:'json',
        success:function(data){
          // 移除加载状态
          $("#submit-btn").removeClass('loading').prop('disabled', false);

          if(data.code == 0){
            // 登录成功，直接跳转（移除弹窗提示）
            window.location.href = 'index';
          }else{
            // 登录失败，显示错误消息
            showErrorMsg(data.msg);
            // 刷新验证码
            $("#captcha").attr("src", $("#captcha").attr("src").split('&d=')[0] + '&d=' + Math.random());
            // 清空验证码输入框
            $("#cpacha").val('');
          }
        },
        error:function(data){
          // 移除加载状态
          $("#submit-btn").removeClass('loading').prop('disabled', false);
          showErrorMsg("网络错误，请稍后重试");
        }
      });
    });

    // 输入框回车提交
    $("#username, #password, #cpacha").keypress(function(e){
      if(e.which == 13){
        $("#submit-btn").click();
      }
    });

    // 输入框聚焦效果
    $(".form-control").focus(function(){
      $(this).parent().addClass('focused');
    }).blur(function(){
      $(this).parent().removeClass('focused');
    });

    // 显示错误消息函数 - 使用系统原有的错误提示方法
    function showErrorMsg(msg) {
      // 这里假设系统已经有一个showErrorMsg函数
      // 如果不存在，则使用简单的alert
      if (typeof showErrorMsg === 'function' && typeof showErrorMsg === 'function') {
        window.showErrorMsg(msg);
      } else {
        alert(msg);
      }
    }
  });
</script>
</body>
</html>