<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <title>${siteName!""}后台管理系统主页</title>
  <#include "../common/header.ftl"/>

  <style>
    /* 统计卡片样式优化 */
    .card {
      border: none;
      border-radius: 8px;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
      transition: all 0.3s ease;
      margin-bottom: 20px;
      overflow: hidden;
    }

    .card:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.12);
    }

    .card-body {
      padding: 20px;
    }

    .card.bg-primary {
      background: linear-gradient(135deg, #3498db, #2980b9) !important;
      border-left: 4px solid #1a5276;
    }

    .card.bg-danger {
      background: linear-gradient(135deg, #e74c3c, #c0392b) !important;
      border-left: 4px solid #922b21;
    }

    .card.bg-success {
      background: linear-gradient(135deg, #2ecc71, #27ae60) !important;
      border-left: 4px solid #1e8449;
    }

    .card.bg-purple {
      background: linear-gradient(135deg, #9b59b6, #8e44ad) !important;
      border-left: 4px solid #6c3483;
    }

    .pull-left .img-avatar-48 {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(2px);
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .pull-left i {
      font-size: 24px;
      color: white;
    }

    .pull-right .h6 {
      font-weight: 500;
      font-size: 14px;
      margin-bottom: 5px;
      opacity: 0.9;
      letter-spacing: 0.5px;
    }

    .pull-right .h3 {
      font-weight: 700;
      font-size: 26px;
      margin-bottom: 0;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
    }

    /* 表格样式优化 */
    .table-card {
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
      border-radius: 8px;
      overflow: hidden;
      margin-top: 10px;
    }

    .table-card .card-header {
      background: linear-gradient(135deg, #2c3e50, #34495e);
      border-bottom: none;
      padding: 15px 20px;
    }

    .table-card .card-header h4 {
      margin: 0;
      color: white;
      font-weight: 600;
      font-size: 16px;
      letter-spacing: 0.5px;
    }

    .table-responsive {
      border-radius: 0 0 8px 8px;
      overflow: hidden;
    }

    .table {
      margin-bottom: 0;
      border-collapse: separate;
      border-spacing: 0;
    }

    .table thead th {
      background-color: #f8f9fa;
      border: none;
      color: #495057;
      font-weight: 600;
      padding: 15px;
      font-size: 14px;
      border-bottom: 2px solid #dee2e6;
      letter-spacing: 0.5px;
    }

    .table tbody tr {
      transition: all 0.2s ease;
    }

    .table tbody tr:hover {
      background-color: rgba(52, 152, 219, 0.05);
    }

    .table tbody td {
      padding: 15px;
      border-bottom: 1px solid #e9ecef;
      color: #495057;
      font-size: 14px;
    }

    .table tbody tr:last-child td {
      border-bottom: none;
    }

    /* 页面主要内容区域 */
    .lyear-layout-content {
      background-color: #f5f7fa;
    }

    .container-fluid {
      padding: 20px;
    }

    .row {
      margin-left: -10px;
      margin-right: -10px;
    }

    .col-sm-6, .col-lg-3, .col-lg-12 {
      padding-left: 10px;
      padding-right: 10px;
    }

    /* 响应式调整 */
    @media (max-width: 768px) {
      .col-sm-6 {
        flex: 0 0 50%;
        max-width: 50%;
      }

      .pull-left .img-avatar-48 {
        width: 45px;
        height: 45px;
      }

      .pull-left i {
        font-size: 22px;
      }

      .pull-right .h3 {
        font-size: 22px;
      }

      .table thead th,
      .table tbody td {
        padding: 12px 10px;
      }
    }

    @media (max-width: 576px) {
      .col-sm-6 {
        flex: 0 0 100%;
        max-width: 100%;
      }

      .container-fluid {
        padding: 15px;
      }

      .card-body {
        padding: 15px;
      }
    }

    /* 动画效果 */
    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .card {
      animation: fadeIn 0.5s ease-out;
    }

    /* 表格操作内容列的样式 */
    .table tbody td:nth-child(3) {
      max-width: 400px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  </style>

</head>

<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">

      <!-- logo -->
      <!-- logo -->
      <div id="logo" class="sidebar-header" style="text-align: center; padding: 20px 0;">
        <a  style="color: #30bbf5; font-size: 18px; font-weight: 600; letter-spacing: 1px; text-decoration: none; display: block; line-height: 1.4;">
          后台管理系统
          <#if siteName??>
            <div style="font-size: 12px; opacity: 0.8; margin-top: 5px; font-weight: 400;">${siteName!""}</div>
          </#if>
        </a>
      </div>
      <div class="lyear-layout-sidebar-scroll">
        <#include "../common/left-menu.ftl"/>
      </div>

    </aside>
    <!--End 左侧导航-->

    <#include "../common/header-menu.ftl"/>

    <!--页面主要内容-->
    <main class="lyear-layout-content">

      <div class="container-fluid">

        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">数据库备份文件</p>
                  <p class="h3 text-white m-b-0">${databaseBackupTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-database fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">管理员用户总数</p>
                  <p class="h3 text-white m-b-0">${userTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">管理员当前在线用户</p>
                  <p class="h3 text-white m-b-0">${onlineUserTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account-multiple fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">后台操作日志</p>
                  <p class="h3 text-white m-b-0">${operatorLogTotal!"0"}条</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-keyboard-close fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">学生注册总数</p>
                  <p class="h3 text-white m-b-0">${studentTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account-multiple fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">物品发布总数</p>
                  <p class="h3 text-white m-b-0">${goodsTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-database fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">求购物品发布总数</p>
                  <p class="h3 text-white m-b-0">${wantGoodsTotal!"0"}</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-database fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">物品评论总数</p>
                  <p class="h3 text-white m-b-0">${commentTotal!"0"}条</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-multiple-outline fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="card table-card">
              <div class="card-header">
                <h4>系统最近操作日志</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                    <tr>
                      <th>#</th>
                      <th>操作人</th>
                      <th style="width:400px;">操作内容</th>
                      <th>操作时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if operatorLogs??>
                      <#list operatorLogs as operatorLog>
                        <tr>
                          <td>${operatorLog_index+1}</td>
                          <td><span class="badge badge-info">${operatorLog.operator}</span></td>
                          <td>${operatorLog.content}</td>
                          <td><span class="text-muted">${operatorLog.createTime}</span></td>
                        </tr>
                      </#list>
                    </#if>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    // 为操作人列添加徽章样式
    $('.table tbody td:nth-child(2)').each(function() {
      var text = $(this).text().trim();
      if(text && !$(this).find('.badge').length) {
        $(this).html('<span class="badge badge-info">' + text + '</span>');
      }
    });
  });
</script>
</body>
</html>