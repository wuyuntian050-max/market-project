<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}</title>
    <#--<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">-->
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
    <style>
        /* 商品展示样式优化 */
        .item-list .items {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 25px;
            padding: 0;
            margin: 0;
        }

        .item-list .item {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            list-style: none;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .item-list .item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .item-list .item .img {
            display: block;
            width: 100%;
            height: 180px;
            overflow: hidden;
            position: relative;
        }

        .item-list .item .img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .item-list .item:hover .img img {
            transform: scale(1.05);
        }

        /* 推荐标签 - 图片左下角书签样式 */
        .item-list .item .school {
            position: absolute;
            bottom: 0;
            left: 0;
            padding: 6px 15px;
            background: linear-gradient(135deg, #933fe8, #7a1fd9);
            color: white;
            font-size: 12px;
            font-weight: 600;
            z-index: 2;
            clip-path: polygon(0 0, 85% 0, 100% 100%, 0% 100%);
        }

        .item-list .item .info {
            padding: 15px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        /* 价格样式 - 白字紫色背景 */
        .item-list .item .price {
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #933fe8, #7a1fd9);
            padding: 6px 12px;
            border-radius: 8px;
            display: inline-block;
            margin-bottom: 10px;
            text-align: center;
            align-self: flex-start;
        }

        .item-list .item .price:before {
            content: "¥";
            font-size: 14px;
            margin-right: 2px;
        }

        .item-list .item .name {
            font-size: 15px;
            font-weight: 600;
            color: #333;
            line-height: 1.4;
            text-align: center;
            min-height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 5px;
        }

        .item-list .item .name a {
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
            display: block;
            width: 100%;
        }

        .item-list .item .name a:hover {
            color: #933fe8;
        }

        /* 学院名称和学校名称 - 一行显示 */
        .item-list .item .department,
        .item-list .item .place {
            font-size: 13px;
            color: #666;
            white-space: nowrap; /* 不换行 */
            overflow: hidden; /* 超出部分隐藏 */
            text-overflow: ellipsis; /* 超出部分显示省略号 */
            width: 100%; /* 确保宽度限制 */
            line-height: 1.4;
        }

        .item-list .item .department:before {
            content: "🎓 ";
        }

        .item-list .item .place:before {
            content: "📍 ";
        }

        /* 分页样式优化 */
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
            background: #933fe8;
            color: white;
        }

        .page-arrow[href="javascript:void(0)"] {
            background: #e0e0e0;
            color: #999;
            cursor: not-allowed;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .item-list .items {
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                gap: 15px;
            }

            .item-list .item .img {
                height: 140px;
            }

            .item-list .item .price {
                font-size: 16px;
                padding: 5px 10px;
            }

            .item-list .item .name {
                font-size: 14px;
                min-height: 40px;
            }

            .item-list .item .department,
            .item-list .item .place {
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .item-list .items {
                grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
                gap: 12px;
            }

            .item-list .item .img {
                height: 120px;
            }
        }
    </style>
</head>
<body>
<#include "../common/top_header.ftl"/>
<#include "../common/left_menu.ftl"/>
<div class="container">
    <div class="main center">
        <div class="wrap-site mt20">
            <div class="recom-title"></div>
            <ul class="recom-list group">
                <#if newsList??>
                    <#list newsList as news>
                        <li><a href="/home/index/news_detail?id=${news.id}" target="_top">${news.title}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>
        <div class="label-wr center clearfix">
            <div id="nav-labels">
                <button id="new_pro" class="labels" onclick="" ></button>
            </div>
        </div>

        <div class="item-list">
            <ul class="items clearfix">
                <#if pageBean.content??>
                    <#list pageBean.content as goods>
                        <li class="item">
                            <a href="../goods/detail?id=${goods.id}" class="img" target="_top">
                                <img src="/photo/view?filename=${goods.photo}" alt="${goods.name}">
                                <#if goods.recommend == 1>
                                    <div class="school"><span>推荐</span></div>
                                </#if>
                            </a>
                            <div class="info">
                                <div class="price">${goods.sellPrice}</div>
                                <div class="name">
                                    <a href="../goods/detail?id=${goods.id}" target="_top">${goods.name}</a>
                                </div>
                                <div class="department" title="${goods.student.academy}">${goods.student.academy}</div>
                                <div class="place" title="${goods.student.school}">${goods.student.school}</div>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <#if pageBean.total gt 0>
            <div class="pages">
                <#if pageBean.currentPage == 1>
                    <a class="page-arrow arrow-left" href="javascript:void(0)">首页</a>
                <#else>
                    <a class="page-arrow arrow-left" href="/home/index/index?name=${name!""}&currentPage=1">首页</a>
                </#if>
                <#list pageBean.currentShowPage as showPage>
                    <#if pageBean.currentPage == showPage>
                        <a class="page-num cur" href="javascript:void(0)">${showPage}</a>
                    <#else>
                        <a class="page-num" href="/home/index/index?name=${name!""}&currentPage=${showPage}">${showPage}</a>
                    </#if>
                </#list>
                <#if pageBean.currentPage == pageBean.totalPage>
                    <a class="page-arrow arrow-right" href="javascript:void(0)">尾页</a>
                <#else>
                    <a class="page-arrow arrow-right" href="/home/index/index?name=${name!""}&currentPage=${pageBean.totalPage}">尾页</a>
                </#if>
            </div>
        </#if>
    </div>
</div>
<div class="return-to-top"><a href="#"></a></div>
<#include "../common/right_menu.ftl"/>
<#include "../common/bottom_footer.ftl"/>
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/index.js"></script>
</body>
</html>