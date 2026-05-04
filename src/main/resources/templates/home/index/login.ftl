<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>欢迎登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="/home/css/login2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/home/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="/home/js/login.js"></script>

    <style>
        /* 重置和基础样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Microsoft YaHei', 'PingFang SC', 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #333;
        }

        /* 主容器 */
        .main-container {
            width: 100%;
            max-width: 420px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* 标题样式 - 校园二手市场 - 居中对齐修复 */
        .site-title {
            color: white;
            font-size: 2.8rem;
            margin-bottom: 40px;
            text-align: center;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.2);
            font-weight: 600;
            letter-spacing: 2px;
            width: 100%;
            display: block;
            position: relative;
            left: 0;
            right: 0;
            padding: 0 10px; /* 防止文字溢出 */
        }

        /* 确保标题容器完全居中 */
        .title-container {
            width: 100%;
            text-align: center;
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 登录卡片 */
        .login-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            width: 100%;
            overflow: hidden;
        }

        /* 切换标签样式 - 快速登录/快速注册 */
        .tab-header {
            display: flex;
            background: #f5f7fa;
            border-bottom: 1px solid #e4e7ed;
        }

        .tab-item {
            flex: 1;
            text-align: center;
            padding: 18px 0;
            font-size: 1.1rem;
            font-weight: 500;
            color: #666;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }

        .tab-item.active {
            color: #4BC0A5;
            background: white;
            font-weight: 600;
        }

        .tab-item.active::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: #4BC0A5;
        }

        /* 表单内容区域 */
        .tab-content {
            padding: 40px 35px 30px;
        }

        .tab-pane {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .tab-pane.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* 表单标题 */
        .form-title {
            font-size: 1.4rem;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 500;
        }

        /* 表单字段样式 */
        .form-group {
            margin-bottom: 22px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 0.95rem;
            font-weight: 500;
        }

        .form-input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f9f9f9;
            color: #333;
            font-family: inherit;
        }

        .form-input:focus {
            outline: none;
            border-color: #4BC0A5;
            background: white;
            box-shadow: 0 0 0 2px rgba(75, 192, 165, 0.1);
        }

        /* 错误提示 */
        .error-message {
            color: #ff4757;
            font-size: 0.85rem;
            margin-top: 6px;
            display: none;
        }

        /* 按钮样式 */
        .submit-btn {
            background: #4BC0A5;
            color: white;
            border: none;
            padding: 16px 0;
            border-radius: 6px;
            font-size: 1.05rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
            width: 100%;
            margin-top: 30px;
            letter-spacing: 1px;
        }

        .submit-btn:hover {
            background: #3DA58A;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(61, 165, 138, 0.3);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        /* 注册表单特定样式 */
        .register-form .form-group {
            margin-bottom: 18px;
        }

        /* 底部提示 */
        .footer-note {
            text-align: center;
            color: rgba(255, 255, 255, 0.85);
            margin-top: 30px;
            font-size: 0.85rem;
            padding: 12px 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            max-width: 420px;
            width: 100%;
            backdrop-filter: blur(5px);
        }

        /* 响应式调整 */
        @media (max-width: 480px) {
            .main-container {
                max-width: 100%;
                margin: 0 15px;
            }

            .site-title {
                font-size: 2.2rem;
                margin-bottom: 30px;
                letter-spacing: 1px;
            }

            .tab-content {
                padding: 30px 25px 25px;
            }

            .tab-item {
                padding: 16px 0;
                font-size: 1rem;
            }

            .form-title {
                font-size: 1.2rem;
                margin-bottom: 25px;
            }
        }
    </style>
</head>
<body>
<div class="main-container">
    <!-- 网站标题 -->
    <div class="title-container">
        <h1 class="site-title">校园二手市场</h1>
    </div>

    <!-- 登录卡片 -->
    <div class="login-card">
        <!-- 切换标签 -->
        <div class="tab-header">
            <div class="tab-item active" data-tab="login">快速登录</div>
            <div class="tab-item" data-tab="register">快速注册</div>
        </div>

        <!-- 登录表单 -->
        <div class="tab-content">
            <div class="tab-pane active" id="login-form">
                <div class="form-title">欢迎登录</div>

                <form action="login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                    <div class="form-group">
                        <label class="form-label" for="login-sn">学号：</label>
                        <input type="text" id="login-sn" name="sn" class="form-input" placeholder="请输入学号" value=""/>
                        <div class="error-message" id="login-sn-error">学号不能为空</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="pwd">密码：</label>
                        <input type="password" id="pwd" name="password" class="form-input" placeholder="请输入密码"/>
                        <div class="error-message" id="login-pwd-error">密码不能为空</div>
                    </div>

                    <button id="login_button" type="button" class="submit-btn">登录系统</button>
                </form>
            </div>

            <!-- 注册表单 -->
            <div class="tab-pane" id="register-form">
                <div class="form-title">快速注册请注意格式</div>

                <form name="form2" id="regForm" accept-charset="utf-8" action="register" method="post" class="register-form">
                    <div class="form-group">
                        <label class="form-label" for="user-sn">学号：</label>
                        <input type="text" id="user-sn" name="sn" maxlength="12" class="form-input" placeholder="请输入学号"/>
                        <div class="error-message" id="reg-sn-error">学号不能为空</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="password">密码：</label>
                        <input type="password" id="password" name="password" maxlength="16" class="form-input" placeholder="请输入密码"/>
                        <div class="error-message" id="reg-pwd-error">密码不能为空</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="password2">确认密码：</label>
                        <input type="password" id="password2" maxlength="16" class="form-input" placeholder="请确认密码"/>
                        <div class="error-message" id="reg-pwd2-error">两次密码不一致</div>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="qq">QQ：</label>
                        <input type="text" id="qq" name="qq" maxlength="10" class="form-input" placeholder="请输入QQ号码"/>
                        <div class="error-message" id="reg-qq-error">QQ不能为空</div>
                    </div>

                    <input type="button" id="reg_button" class="submit-btn" value="注册成为会员"/>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="footer-note">*推荐使用Chrome、Edge或最新版Firefox浏览器访问本站</div>

<script>
    $(document).ready(function() {
        // 标签切换功能
        $('.tab-item').click(function() {
            var tabId = $(this).data('tab');

            // 更新标签状态
            $('.tab-item').removeClass('active');
            $(this).addClass('active');

            // 切换表单内容
            $('.tab-pane').removeClass('active');
            $('#' + tabId + '-form').addClass('active');
        });

        // 登录表单提交
        $('#login_button').click(function(e) {
            e.preventDefault(); // 阻止原生提交

            var isValid = true;
            var sn = $('#login-sn').val().trim();
            var pwd = $('#pwd').val().trim();

            $('.error-message').hide();
            if (!sn) {
                $('#login-sn-error').show();
                $('#login-sn').addClass('error');
                isValid = false;
            }
            if (!pwd) {
                $('#login-pwd-error').show();
                $('#pwd').addClass('error');
                isValid = false;
            }
            if (!isValid) return;

            var $btn = $(this);
            $btn.text('登录中...').prop('disabled', true);

            $.ajax({
                url: $('#login_form').attr('action'),
                type: 'POST',
                data: $('#login_form').serialize(),
                dataType: 'json',
                success: function(res) {
                    if (res.code === 0) { // 成功状态码为0
                        window.location.href = '/home/index/index'; // 登录成功跳转首页
                    } else {
                        alert(res.msg); // 显示后端返回的错误信息
                        $btn.text('登录系统').prop('disabled', false);
                    }
                },
                error: function() {
                    alert('网络错误，请稍后重试');
                    $btn.text('登录系统').prop('disabled', false);
                }
            });
        });

        // 注册表单验证
        $('#reg_button').click(function() {
            var isValid = true;
            var sn = $('#user-sn').val().trim();
            var pwd = $('#password').val().trim();
            var pwd2 = $('#password2').val().trim();
            var qq = $('#qq').val().trim();

            // 隐藏所有错误提示
            $('.error-message').hide();

            // 验证学号
            if (!sn) {
                $('#reg-sn-error').show();
                $('#user-sn').addClass('error');
                isValid = false;
            } else {
                $('#user-sn').removeClass('error');
            }

            // 验证密码
            if (!pwd) {
                $('#reg-pwd-error').show();
                $('#password').addClass('error');
                isValid = false;
            } else {
                $('#password').removeClass('error');
            }

            // 验证确认密码
            if (!pwd2) {
                $('#reg-pwd2-error').text('请确认密码').show();
                $('#password2').addClass('error');
                isValid = false;
            } else if (pwd !== pwd2) {
                $('#reg-pwd2-error').text('两次密码不一致').show();
                $('#password2').addClass('error');
                isValid = false;
            } else {
                $('#password2').removeClass('error');
            }

            // 验证QQ
            if (!qq) {
                $('#reg-qq-error').show();
                $('#qq').addClass('error');
                isValid = false;
            } else {
                $('#qq').removeClass('error');
            }

            if (isValid) {
                // 添加加载效果
                $(this).val('注册中...').prop('disabled', true);

                // 提交表单
                setTimeout(() => {
                    $('#regForm').submit();
                }, 500);
            }

            return false;
        });

        // 输入框聚焦效果
        $('.form-input').focus(function() {
            $(this).css({
                'border-color': '#4BC0A5',
                'background': 'white',
                'box-shadow': '0 0 0 2px rgba(75, 192, 165, 0.1)'
            });
        }).blur(function() {
            $(this).css({
                'border-color': '#ddd',
                'background': '#f9f9f9',
                'box-shadow': 'none'
            });
        });

        // 回车键提交
        $('#login-sn, #pwd').keypress(function(e) {
            if (e.which == 13) {
                $('#login_button').click();
            }
        });

        $('#user-sn, #password, #password2, #qq').keypress(function(e) {
            if (e.which == 13) {
                $('#reg_button').click();
            }
        });
    });
</script>
</body>
</html>