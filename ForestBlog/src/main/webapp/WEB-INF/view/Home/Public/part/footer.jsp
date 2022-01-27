<%--
    博客页脚部分
    包括：页脚部分
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<footer style="background:white;">
    <div style="display:flex;flex-direction: row; margin-top:5px;">
        <div style="width:20vw;margin-left:20vw;text-align: right;">
            <a href="https://beian.miit.gov.cn/#/Integrated/index">豫ICP备2021037400</a>
        </div>
        <div style="width:20vw;margin-left:10vw;">
            <img src="${pageContext.request.contextPath}/img/备案图标.png" alt="备案图标">
            <a href="https://beian.miit.gov.cn/#/Integrated/index">豫公安备41172502000139 </a>
        </div>
    </div>
</footer>


<%--页脚 start--%>
<footer id="colophon" class="site-footer" role="contentinfo">
    <div class="site-info">
        <p style="text-align: center;">Copyright © 2017
            <a href="${pageContext.request.contextPath}/" target="_blank" rel="noopener noreferrer">${options.optionSiteTitle}</a>
            All rights reserved.
            <a target="_blank" href="${pageContext.request.contextPath}/map" >
                <span class="font-text">站点地图</span>
            </a>
        </p>
    </div>
    <!-- .site-info -->
</footer><!-- .site-footer -->

<%--页脚 end--%>

