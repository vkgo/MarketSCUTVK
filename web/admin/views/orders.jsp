<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/20
  Time: 16:01
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
                  <a href="">作品&订单</a>
                  <a><cite>订单</cite></a>
                </span>
      <h2 class="title">订单</h2>
    </div>
  </div>
  <div class="layui-row">
    <div class="layui-card">
      <div class="layui-card-body">
        <div class="form-box">
          <table id="orderstable"></table>
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
    elem: '#orderstable'
    ,cols: [[ //标题栏
      {field: 'orderid', title: '订单号', width: 100}
      ,{field: 'sellerid', title: '售出者id', width: 120}
      ,{field: 'buyerid', title: '购买者id', width: 120}
      ,{field: 'imgid', title: 'ID', width: 100, sort: true}
      ,{field: 'ordername', title: '给予人', width: 150}
      ,{field: 'orderemail', title: '给予人邮件', width: 250}
      ,{field: 'price', title: '价格', width: 100, sort: true}
      ,{field: 'orderdate', title: '交易时间', width: 200, sort: true}
    ]]
    ,data: [<jsp:include page="orders_json.jsp"></jsp:include>]
    ,skin: 'line' //表格风格
    ,even: true
    ,page: true //是否显示分页
    ,limits: [5, 10, 20]
    ,limit: 10 //每页默认显示的数量
  });
</script>
</body>
</html>
