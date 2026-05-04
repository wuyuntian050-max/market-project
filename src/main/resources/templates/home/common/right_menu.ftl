<aside>
    <div id="release-button1">
        <a href="/home/student/publish_wanted" style="color: white" id="want-buy"> 我想要买？</a>
    </div>
    <br><br>
    <div id="release-button2">
        <a href="/home/student/publish" style="color: white" id="want-sale"> 发布闲置</a>
    </div>
    <br><br>
    <div id="release-button3">
        <a href="/home/wanted_goods/list" style="color: white"> 求购专区</a>
    </div>

    <div class="helped">
        <span class="helpers" id="order-count">0</span>
    </div>
</aside>

<style>
    /* 按钮样式优化 - 保持原有大小不变 */
    #release-button1, #release-button2, #release-button3 {
        display: inline-block;
        position: relative;
        background: linear-gradient(135deg, #3498db, #2980b9);
        border: none;
        border-radius: 6px;
        padding: 12px 24px;
        font-size: 16px;
        font-weight: 500;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        overflow: hidden;
        margin-bottom: 10px;
        width: auto;
        min-width: 140px;
        max-width: 200px;
    }

    /* 每个按钮的独特颜色 */
    #release-button1 {
        background: linear-gradient(135deg, #3498db, #2980b9);
    }

    #release-button2 {
        background: linear-gradient(135deg, #2ecc71, #27ae60);
    }

    #release-button3 {
        background: linear-gradient(135deg, #9b59b6, #8e44ad);
    }

    /* 按钮悬浮效果 */
    #release-button1:hover {
        background: linear-gradient(135deg, #2980b9, #1a5276);
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(52, 152, 219, 0.3);
    }

    #release-button2:hover {
        background: linear-gradient(135deg, #27ae60, #1e8449);
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(46, 204, 113, 0.3);
    }

    #release-button3:hover {
        background: linear-gradient(135deg, #8e44ad, #6c3483);
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(155, 89, 182, 0.3);
    }

    /* 按钮点击效果 */
    #release-button1:active, #release-button2:active, #release-button3:active {
        transform: translateY(0);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* 链接样式 */
    #release-button1 a, #release-button2 a, #release-button3 a {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        letter-spacing: 0.5px;
        display: block;
        width: 100%;
        height: 100%;
        text-align: center;
        line-height: 1.4;
    }

    /* 按钮内部的微光效果 */
    #release-button1::before, #release-button2::before, #release-button3::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
        transition: left 0.7s ease;
    }

    #release-button1:hover::before, #release-button2:hover::before, #release-button3:hover::before {
        left: 100%;
    }

    /* 按钮圆角美化 */
    #release-button1, #release-button2, #release-button3 {
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
    }

    /* 按钮边框装饰效果 */
    #release-button1, #release-button2, #release-button3 {
        position: relative;
        z-index: 1;
    }

    #release-button1::after, #release-button2::after, #release-button3::after {
        content: '';
        position: absolute;
        top: -2px;
        left: -2px;
        right: -2px;
        bottom: -2px;
        border-radius: 8px;
        background: linear-gradient(135deg, rgba(255, 255, 255, 0.3), transparent);
        z-index: -1;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    #release-button1:hover::after, #release-button2:hover::after, #release-button3:hover::after {
        opacity: 1;
    }

    /* 按钮文字阴影 */
    #release-button1 a, #release-button2 a, #release-button3 a {
        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }

    /* 响应式调整 */
    @media (max-width: 768px) {
        #release-button1, #release-button2, #release-button3 {
            padding: 10px 20px;
            font-size: 15px;
            min-width: 120px;
        }
    }

    @media (max-width: 480px) {
        #release-button1, #release-button2, #release-button3 {
            padding: 8px 16px;
            font-size: 14px;
            min-width: 110px;
        }
    }

    /* 按钮之间的间距调整 */
    aside {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    /* 数字计数样式 */
    .helped {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
    }

    .helpers {
        background-color: #e74c3c;
        color: white;
        padding: 8px 12px;
        border-radius: 50%;
        font-size: 14px;
        font-weight: bold;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
    }
</style>