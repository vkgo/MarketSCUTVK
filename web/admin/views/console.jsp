<%@ page import="cn.scutvk.admin.Utils.AdminDBUtils" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/14
  Time: 13:11
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
  <div class="layui-row layui-col-space20">
    <div class="layui-col-sm12 layui-col-md4">
      <div class="layui-card">
        <div class="layui-card-body chart-card">
          <div class="chart-header">
            <div class="metawrap">
              <div class="meta">
                <span>总用户数</span>
              </div>
              <div class="total"><%=AdminDBUtils.users_getusersnumber()%></div>
            </div>
          </div>
          <div class="chart-body">
            <div class="contentwrap">
              24h新增用户 <%=AdminDBUtils.users_getnewregistedusersnumber()%>
            </div>
          </div>
          <div class="chart-footer">
            <div class="field">
              <span>活跃用户</span>
              <span><%=AdminDBUtils.users_getactiveusersnumber()%></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layui-col-sm12 layui-col-md4">
      <div class="layui-card">
        <div class="layui-card-body chart-card">
          <div class="chart-header">
            <div class="metawrap">
              <div class="meta">
                <span>总作品数</span>
              </div>
              <div class="total"><%=AdminDBUtils.images_getimagesnumber()%></div>
            </div>
          </div>
          <div class="chart-body">
            <div class="contentwrap">
              24h新增作品 <%=AdminDBUtils.images_getnewuploadedimagesnumber()%>
            </div>
          </div>
          <div class="chart-footer">
            <div class="field">
              <span>总点赞量</span>
              <span><%=AdminDBUtils.images_gettotallikesnumber()%></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layui-col-sm12 layui-col-md4">
      <div class="layui-card">
        <div class="layui-card-body chart-card">
          <div class="chart-header">
            <div class="metawrap">
              <div class="meta">
                <span>总订单数</span>
              </div>
              <div class="total"><%=AdminDBUtils.orders_getordersnumber()%></div>
            </div>
          </div>
          <div class="chart-body">
            <div class="contentwrap">
              24h新增订单 <%=AdminDBUtils.orders_getnewordersnumber()%>
            </div>
          </div>
          <div class="chart-footer">
            <div class="field">
              <span>总成交额</span>
              <span><%=AdminDBUtils.orders_gettotalprice()%> ETH</span>
            </div>
          </div>
        </div>
      </div>
    </div>
<%--    <div class="layui-col-sm12 layui-col-md12">--%>
<%--      <div class="layui-card">--%>
<%--        <div class="layui-tab layui-tab-brief">--%>
<%--          <ul class="layui-tab-title">--%>
<%--            <li class="layui-this">新增数</li>--%>
<%--            <li>活跃度</li>--%>
<%--          </ul>--%>
<%--          <div class="layui-tab-content">--%>
<%--            <div class="layui-tab-item layui-show">--%>
<%--              dddd--%>
<%--            </div>--%>
<%--            <div class="layui-tab-item">--%>
<%--              ddd--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
  </div>
</div>
<script src="../assets/layui.all.js"></script>
<script>
  var element = layui.element;
</script>
</body>
</html>
