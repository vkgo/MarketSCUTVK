<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/14
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="../assets/css/layui.css">
  <link rel="stylesheet" href="../assets/css/view.css"/>
  <title></title>
</head>
<body class="layui-view-body">
<div class="layui-content">
  <div class="layui-page-header">
    <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a href="">首页</a>
                  <a href="">用户</a>
                  <a><cite>权限配置</cite></a>
                </span>
      <h2 class="title">管理员账号</h2>
    </div>
  </div>
  <div class="layui-row">
    <div class="layui-card">
      <div class="layui-card-body">
        <form action="../AdminChangeAdminUserServlet" method="post">
          <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
              <input type="text" name="username" required  lay-verify="required" placeholder="用户名也可以修改" autocomplete="off" class="layui-input" value="${adminUserBean.username}">
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
              <input type="password" name="password" required lay-verify="required" placeholder="请记住密码，无法找回密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
              <input type="password" name="confirmpassword" required lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
          </div>

          <button class="layui-btn layui-btn-blue" type="submit">确认</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="../assets/layui.all.js"></script>
</body>
</html>
