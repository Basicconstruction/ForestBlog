<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
    <title>
        ${options.optionSiteTitle}后台
            <rapid:block name="title"></rapid:block>
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/back.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/font-awesome/css/font-awesome.min.css">
    <rapid:block name="header-style"></rapid:block>
    <rapid:block name="header-script"></rapid:block>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="${pageContext.request.contextPath}/admin" style="color:#009688;">
        ${options.optionSiteTitle}后台
        </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/" target="_blank">前台</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">新建</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/article/insert">文章</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/page/insert">页面</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/category/insert">分类</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/notice/insert">公告</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/link/insert">链接</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
<%--                    不能加前缀--%>
                    <img src="${sessionScope.user.userAvatar}" class="layui-nav-img">
                    ${sessionScope.user.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/profile">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/admin/logout">登出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

            <c:if test="${sessionScope.user != null && sessionScope.user.userRole == 'admin'}">
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/article">全部文章</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/article/insert">写文章</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/category">全部分类</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/tag">全部标签</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">页面</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/page">全部页面</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/page/insert">添加页面</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        链接
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/link">全部链接</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/link/insert">添加链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">公告</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/notice">全部公告</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/notice/insert">添加公告</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/comment">
                        评论
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/user">全部用户</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/user/insert">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">设置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/admin/menu">菜单</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/admin/options">主要选项</a></dd>
                    </dl>
                </li>
            </ul>
            </c:if>

            <c:if test="${sessionScope.user != null && sessionScope.user.userRole == 'user'}">
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">文章</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/admin/article">我的文章</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/admin/article/insert">写文章</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">评论</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${pageContext.request.contextPath}/admin/comment">我的评论</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/">评论我的</a></dd>
                        </dl>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>

    <div class="layui-body">


        <!-- 内容主体区域 -->


        <div style="padding: 15px;">
            <rapid:block name="content">

            </rapid:block>
        </div>
    </div>

    <div class="layui-footer">
        <footer style="background:white;">
            <div style="display:flex;flex-direction: row; margin-top:5px;">
                <div style="width:20vw;margin-left:20vw;text-align: right;">
                    powered by © <a href="http://blog.liuyanzhao.com">言曌博客</a> 2017<a href="https://beian.miit.gov.cn/#/Integrated/index">豫ICP备2021037400</a>
                </div>
                <div style="width:20vw;margin-left:10vw;">
                    <img src="${pageContext.request.contextPath}/img/备案图标.png" alt="备案图标">
                    <a href="https://beian.miit.gov.cn/#/Integrated/index">豫公安备41172502000139 </a>
                </div>
            </div>
        </footer>
        <!-- 底部固定区域 -->

    </div>

</div>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layui/layui.all.js"></script>
<script>
    function DoCheck() {
        var ch = document.getElementsByName("ids");
        if (document.getElementById("allSelect").checked === true) {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = true;
            }
        } else {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = false;
            }
        }
    }

    function confirmDelete() {
        var msg = "您确定要删除吗？";
        if (confirm(msg)===true){
            return true;
        }else{
            return false;
        }
    }

    //获取相对路径
    function  getPath(){
        var pathName = document.location.pathname;
        var index = pathName.substr(1).indexOf("/");
        var result = pathName.substr(0,index+1);
        return result;
    }


    //显示和隐藏row-actions
    $(".dashboard-comment-wrap").mouseenter(function () {
        $(this).find(".row-actions").show();
    })
    $(".dashboard-comment-wrap").mouseleave(function () {
        $(this).find(".row-actions").hide();
    })

    //删除评论
    function deleteComment(id) {
        if(confirmDelete()===true){
            $.ajax({
                async: false,
                type: "POST",
                url:'${pageContext.request.contextPath}/admin/comment/delete/'+id,
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "text",
                complete:function () {
                    window.location.reload();
                }
            })
        }
    }

    //添加草稿
    function insertDraft() {
        if($("#articleContent").val!==""&&$("#articleTitle").val()!=="") {
            $.ajax({
                async: false,
                type: "POST",
                url:'${pageContext.request.contextPath}/admin/article/insert',
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "text",
                complete:function () {
                    window.location.reload();
                }
            })
        }

    }

    //删除文章
    function deleteArticle(id) {
        if(confirmDelete()===true){
            $.ajax({
                async: false,
                type: "POST",
                url:'${pageContext.request.contextPath}/admin/article/delete/'+id,
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "text",
                complete:function () {
                    window.location.reload();
                }
            })
        }
    }

    //查询文章
    function queryArticle() {
        //提交form
        $("#articleForm").attr("action", "${pageContext.request.contextPath}/admin/article/search");
        $("#articleForm").submit();
    }

    //批量删除文章
    function confirmDeleteArticleBatch() {
        if(confirmDelete()===true){
            var text = $("input:checkbox[name='ids']:checked").map(function(index,elem) {
                return $(elem).val();
            }).get().join(',');
            $.ajax({
                async: false,
                type: "POST",
                url:'${pageContext.request.contextPath}/admin/article/deleteBatch',
                data:{ids:text},
                contentType : "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "text",
                complete:function () {
                    window.location.reload();
                }
            })
        }
    }

    //退出登录
    function logout() {
        $.ajax({
            async: false,
            type: "POST",
            url:'${pageContext.request.contextPath}/admin/logout',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }



    //添加用户检查用户名是否存在
    function checkUserName() {
        var result;
        $.ajax({
            async: false,//同步，待请求完毕后再执行后面的代码
            type: "POST",
            url: '${pageContext.request.contextPath}/admin/user/checkUserName',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {"username": $("#userName").val(), "id": $("#userId").val()},
            dataType: "json",
            success: function (data) {
                //用户名存在
                if(data.code===1) {
                    $("#userNameTips").html(data.msg);
                    result=1;
                }
                //用户名不存在
                if(data.code===0) {
                    $("#userNameTips").html(data.msg);
                    result=0;
                }
            },
            error: function () {
                // alert("数据获取失败")
            }
        })
        return result;
    }

    //添加用户检查电子邮箱是否存在
    function checkUserEmail() {
        var result;
        $.ajax({
            async: false,//同步，待请求完毕后再执行后面的代码
            type: "POST",
            url: '${pageContext.request.contextPath}/admin/user/checkUserEmail',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {"email": $("#userEmail").val(), "id": $("#userId").val()},
            dataType: "json",
            success: function (data) {
                //用户名存在
                if(data.code===1) {
                    $("#userEmailTips").html(data.msg);
                    result=1;
                }
                //用户名不存在
                if(data.code===0) {
                    $("#userEmailTips").html(data.msg);
                    result=0;
                }
            },
            error: function () {
                //alert("数据获取失败")
            }
        })
        return result;
    }



    //添加用户验证和编辑用户验证
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form, layer = layui.layer;
        form.verify({

            userName: function (value) {
                if (value.length > 12 || value.length < 4) {
                    return "用户名必须4到12位";
                }
                if(checkUserName()===1) {
                    return "用户名已存在";
                }
            },
            userEmail: function () {
                if(checkUserEmail()===1) {
                    return "电子邮箱已存在";
                }
            }

        });

        form.on('submit(demo1)', function (data) {
            return true;
        });
    });
</script>
<rapid:block name="footer-script">

</rapid:block>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<link rel=\"stylesheet\" href=\"${pageContext.request.contextPath}/css/highlight.css\">\n");

</script>

</body>
</html>
