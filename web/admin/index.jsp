<%@ page import="cn.scutvk.admin.bean.AdminUserBean" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/14
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // check if has adminUserBean
    AdminUserBean adminUserBean = (AdminUserBean) session.getAttribute("adminUserBean");
    if (adminUserBean == null) {
        response.setHeader("refresh", "0;url=" + request.getContextPath() + "/admin/login.jsp");
        return;
    }
%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="assets/css/layui.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="icon" href="/favicon.ico">
    <title>后台管理</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header custom-header">

        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item slide-sidebar" lay-unselect>
                <a href="javascript:;" class="icon-font"><i class="ai ai-menufold"></i></a>
            </li>
        </ul>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;"><%=adminUserBean.getUsername()%></a>
                <dl class="layui-nav-child">
                    <dd><a href="">帮助中心</a></dd>
                    <dd><a href="AdminLogoutServlet">退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side custom-admin">
        <div class="layui-side-scroll">

            <div class="custom-logo">
                <img src="../data/systemimages/NFT.png" alt=""/>
                <h1>Market-SCUTVK</h1>
            </div>
            <ul id="Nav" class="layui-nav layui-nav-tree">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe609;</i>
                        <em>主页</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/console.jsp">控制台</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe857;</i>
                        <em>作品&订单</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/images.jsp">作品</a></dd>
                        <dd><a href="views/orders.jsp">订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe612;</i>
                        <em>用户</em>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="views/users.jsp">用户组</a></dd>
                        <dd><a href="views/operaterule.jsp">管理员账号</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <div class="layui-body">
        <div class="layui-tab app-container" lay-allowClose="true" lay-filter="tabs">
            <ul id="appTabs" class="layui-tab-title custom-tab"></ul>
            <div id="appTabPage" class="layui-tab-content"></div>
        </div>
    </div>

    <div class="mobile-mask"></div>
</div>
<script src="assets/layui.js"></script>
<script src="index.js" data-main="home"></script>
</body>
</html>
