<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/14
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../assets/css/layui.css">
  <link rel="stylesheet" href="../assets/css/view.css"/>
  <link rel="icon" href="/favicon.ico">
  <title>管理后台</title>
</head>
<body class="layui-view-body">
<div class="layui-content">
  <div class="layui-page-header">
    <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a href="">首页</a>
                  <a href="">用户</a>
                  <a><cite>用户组</cite></a>
                </span>
      <h2 class="title">用户组</h2>
    </div>
  </div>
  <div class="layui-row">
    <div class="layui-card">
      <div class="layui-card-body">
        <div class="form-box">
<%--          <div class="layui-form layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--              <div class="layui-form-mid">用户名:</div>--%>
<%--              <div class="layui-input-inline" style="width: 100px;">--%>
<%--                <input type="text" autocomplete="off" class="layui-input">--%>
<%--              </div>--%>
<%--              <div class="layui-form-mid">邮箱:</div>--%>
<%--              <div class="layui-input-inline" style="width: 100px;">--%>
<%--                <input type="text" autocomplete="off" class="layui-input">--%>
<%--              </div>--%>
<%--              <div class="layui-form-mid">性别:</div>--%>
<%--              <div class="layui-input-inline" style="width: 100px;">--%>
<%--                <select name="sex">--%>
<%--                  <option value="1">男</option>--%>
<%--                  <option value="2">女</option>--%>
<%--                </select>--%>
<%--              </div>--%>
<%--              <button class="layui-btn layui-btn-blue">查询</button>--%>
<%--              <button class="layui-btn layui-btn-primary" type="reset">重置</button>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <button class="layui-btn layui-btn-blue"><i class="layui-icon">&#xe654;</i>新增</button>--%>
          <table id="userstables"></table>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="../assets/layui.all.js"></script>
<script>
  var element = layui.element;
  var table = layui.table;
  var form = layui.form;

  //展示已知数据
  table.render({
    elem: '#userstables'
    ,cols: [[ //标题栏
      {field: 'uid', title: 'ID', width: 80, sort: true}
      ,{field: 'username', title: '用户名', width: 120}
      ,{field: 'password', title: '密码', width: 150}
      ,{field: 'email', title: '邮箱', width: 200}
      ,{field: 'avatarurl', title: '头像', width: 300}
      ,{field: 'sex', title: '性别', width: 80}
      ,{field: 'signupdate', title: '注册时间', width: 200}
      ,{field: 'latestlogindate', title: '最近登录', width: 200, sort: true}
    ]]
    ,data: [<jsp:include page="users_json.jsp"></jsp:include>]
    ,skin: 'line' //表格风格
    ,even: true
    ,page: true //是否显示分页
    ,limits: [5, 10, 20]
    ,limit: 10 //每页默认显示的数量
  });
</script>
</body>
</html>