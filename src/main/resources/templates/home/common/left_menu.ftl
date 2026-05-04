<style>
    /* 左侧导航栏样式优化 */
    nav.ease2 {
        position: fixed;
        left: 0;
        top: 0;
        width: 180px; /* 稍微加宽 */
        height: 100%;
        background: linear-gradient(180deg, #ffffff 0%, #f9f5ff 100%);
        box-shadow: 4px 0 15px rgba(147, 63, 232, 0.1);
        z-index: 80;
        border-right: 1px solid rgba(147, 63, 232, 0.1);
        transition: all 0.3s ease;
        backdrop-filter: blur(10px);
    }

    nav.ease2:hover {
        box-shadow: 6px 0 25px rgba(147, 63, 232, 0.15);
    }

    nav ul {
        list-style: none;
        padding: 0;
        margin: 0;
        color: #333;
    }

    nav ul li {
        border-bottom: 1px solid rgba(147, 63, 232, 0.08);
        position: relative;
        transition: all 0.3s ease;
    }

    nav ul li:hover {
        background: rgba(147, 63, 232, 0.05);
    }

    .blank-head {
        height: 120px;
        background: linear-gradient(135deg, rgba(147, 63, 232, 0.1), rgba(147, 63, 232, 0.05));
        border-bottom: 2px solid rgba(147, 63, 232, 0.2);
    }

    .blank-head a {
        display: block;
        height: 100%;
        width: 100%;
    }

    /* 分类项样式优化 */
    li.catg a {
        color: #333;
        height:51px; /* 分类高度 */
        line-height: 70px;
        position: relative;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        padding: 0 20px;
        text-decoration: none;
        overflow: hidden;
    }

    li.catg:hover a {
        background: rgba(147, 63, 232, 0.08);
        box-shadow: inset 0 0 15px rgba(147, 63, 232, 0.1);
        transform: translateX(3px);
    }

    /* 分类图标样式优化 */
    .nav-icons {
        width: 25px;
        height: 25px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        border-radius: 8px;
        background: rgba(147, 63, 232, 0.1);
        padding: 5px;
        transition: all 0.3s ease;
    }

    li.catg:hover .nav-icons {
        background: rgba(147, 63, 232, 0.2);
        transform: scale(1.1);
    }

    .nav-icons img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        filter: brightness(0.9);
        transition: all 0.3s ease;
    }

    li.catg:hover .nav-icons img {
        filter: brightness(1) invert(20%) sepia(80%) saturate(1000%) hue-rotate(245deg);
    }

    /* 分类名称样式优化 */
    .catg h3 {
        flex: 1;
        font-size: 14px;
        font-weight: 600;
        color: #333;
        margin: 0;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        transition: all 0.3s ease;
    }

    li.catg:hover h3 {
        color: #933fe8;
        transform: translateX(5px);
    }

    /* 子菜单样式优化 */
    li.catg .sub-nav {
        display: none;
        position: absolute;
        left: 100%;
        top: 0;
        width: 220px;
        min-height: 100%;
        background: #3f94e8;
        border-radius: 0 12px 12px 0;
        box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.1);
        border-left: 3px solid #933fe8;
        z-index: 100;
        padding: 15px;
        animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateX(-10px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    li.catg:hover .sub-nav {
        display: block;
    }

    .sub-nav span {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .sub-nav a {
        color: #666;
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 20px;
        background: #f5f5f5;
        font-size: 13px;
        transition: all 0.3s ease;
        border: 1px solid transparent;
        white-space: nowrap;
    }

    .sub-nav a:hover {
        color: #933fe8;
        background: rgba(147, 63, 232, 0.1);
        border-color: rgba(147, 63, 232, 0.2);
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(147, 63, 232, 0.1);
    }

    /* 第一个分类项（全部商品）特殊样式 */
    .category-12.catg a {
        background: rgba(147, 63, 232, 0.05);
        border-left: 4px solid #933fe8;
    }

    .category-12.catg:hover a {
        background: rgba(147, 63, 232, 0.1);
    }

    .category-12.catg .nav-icons {
        background: rgba(147, 63, 232, 0.2);
    }

    /* 响应式设计 */
    @media (max-width: 768px) {
        nav.ease2 {
            width: 70px;
            overflow: hidden;
            transition: width 0.3s ease;
        }

        nav.ease2:hover {
            width: 180px;
        }

        .catg h3 {
            display: none;
        }

        nav.ease2:hover .catg h3 {
            display: block;
        }

        .nav-icons {
            margin-right: 0;
        }

        nav.ease2:hover .nav-icons {
            margin-right: 15px;
        }

        li.catg:hover .sub-nav {
            display: none; /* 移动端不显示子菜单 */
        }
    }

    /* 添加悬停指示器 */
    li.catg::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 4px;
        height: 0;
        background: linear-gradient(to bottom, #933fe8, #7a1fd9);
        border-radius: 0 4px 4px 0;
        transition: all 0.3s ease;
        opacity: 0;
    }

    li.catg:hover::before {
        height: 40px;
        opacity: 1;
    }

    /* 平滑滚动效果 */
    nav.ease2 {
        scrollbar-width: thin;
        scrollbar-color: rgba(147, 63, 232, 0.3) transparent;
    }

    nav.ease2::-webkit-scrollbar {
        width: 4px;
    }

    nav.ease2::-webkit-scrollbar-track {
        background: transparent;
    }

    nav.ease2::-webkit-scrollbar-thumb {
        background: rgba(147, 63, 232, 0.3);
        border-radius: 2px;
    }

    nav.ease2::-webkit-scrollbar-thumb:hover {
        background: rgba(147, 63, 232, 0.5);
    }
</style>

<nav class="ease2">
    <ul>
        <li class="blank-head">
            <a href="/home/index/index"></a>
        </li>

        <li class="category-12 catg">
            <a href="/home/index/index" target="_top">
                <i class="nav-icons">
                    <img src="/home/imgs/12.png" alt="全部商品">
                </i>
                <h3>全部商品</h3>
            </a>
        </li>

        <#list goodsCategorys as goodsCategory>
            <#if goodsCategory.parent??>
            <#else>
                <li class="category-${goodsCategory.id} catg">
                    <a href="/home/goods/list?cid=${goodsCategory.id}" target="_top">
                        <i class="nav-icons">
                            <img src="/photo/view?filename=${goodsCategory.icon}" alt="${goodsCategory.name}">
                        </i>
                        <h3>${goodsCategory.name}</h3>
                    </a>
                    <div class="sub-nav">
                    <span>
                        <#list goodsCategorys as secondGoodsCategory>
                            <#if secondGoodsCategory.parent??>
                                <#if secondGoodsCategory.parent.id == goodsCategory.id>
                                    <a href="/home/goods/list?cid=${secondGoodsCategory.id}" target="_top">${secondGoodsCategory.name}</a>
                                </#if>
                            </#if>
                        </#list>
                    </span>
                    </div>
                </li>
            </#if>
        </#list>
    </ul>
</nav>

<script>
    // 添加导航栏交互效果
    $(document).ready(function() {
        // 鼠标悬停效果增强
        $('.catg').hover(
            function() {
                $(this).addClass('hover-active');
            },
            function() {
                $(this).removeClass('hover-active');
            }
        );

        // 移动端触摸效果
        $('.catg').on('touchstart', function() {
            $(this).addClass('touch-active');
        });

        $('.catg').on('touchend', function() {
            $(this).removeClass('touch-active');
        });

        // 防止移动端误触
        let touchTimer;
        $('.catg a').on('touchstart', function(e) {
            touchTimer = setTimeout(function() {
                e.preventDefault();
            }, 500);
        }).on('touchend', function() {
            clearTimeout(touchTimer);
        }).on('click', function(e) {
            e.stopPropagation();
        });
    });
</script>