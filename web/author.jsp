<%@ page import="cn.scutvk.bean.ZoneBean" %>
<%@ page import="cn.scutvk.Utils.DBUtils" %>
<%@ page import="cn.scutvk.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/11/20
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta username="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- CSS -->
  <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">
  <link rel="stylesheet" href="css/select2.min.css">
  <link rel="stylesheet" href="css/main.css">

  <!-- Favicons -->
  <link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
  <link rel="apple-touch-icon" href="icon/favicon-32x32.png">

  <meta username="description" content="">
  <meta username="keywords" content="">
  <meta username="author" content="Dmitry Volkov">
  <title>Market - SCUTVK</title>

</head>
<body>
<jsp:include page="headerbar.jsp"></jsp:include>

<%
  // check if user is logged in
  if (session.getAttribute("usershowBean") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  UserBean usershowBean = (UserBean) session.getAttribute("usershowBean");
%>
<%
  // check if zoneBean is null
  if (session.getAttribute("zoneBean") == null) {
    // check if zoneBean is null
    ZoneBean zoneBean = (ZoneBean) session.getAttribute("zoneBean");
    if (zoneBean == null) {
      zoneBean = DBUtils.zones_getbean(usershowBean);
      // set zonebean to request attribute
      request.getSession().setAttribute("zoneBean", zoneBean);
    }
  }
%>
<%
  int uid = usershowBean.getUid();
  request.getSession().setAttribute("uid", uid);
%>
<!-- main content -->
<main class="main">
  <div class="main__author" data-bg="img/bg/bg.png"></div>
  <div class="container">
    <div class="row row--grid">
      <div class="col-12 col-xl-3">
        <jsp:include page="publicitemshow/usercard.jsp"></jsp:include>
      </div>

      <div class="col-12 col-xl-9">
        <div class="profile">
          <!-- tabs nav -->
          <ul class="nav nav-tabs profile__tabs" id="profile__tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">售卖中</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">所有作品</a>
            </li>

          </ul>
          <!-- end tabs nav -->
        </div>

        <!-- content tabs -->
        <div class="tab-content">
          <div class="tab-pane fade show active" id="tab-1" role="tabpanel">
            <div class="row row--grid">
              <%--    展示本uid的image     --%>
              <jsp:include page="publicitemshow/uidonsolditems.jsp"></jsp:include>
            </div>
          </div>

          <div class="tab-pane fade" id="tab-2" role="tabpanel">
            <div class="row row--grid">
              <jsp:include page="publicitemshow/uiditems.jsp"></jsp:include>
            </div>
          </div>

        </div>
        <!-- end content tabs -->
      </div>
    </div>
  </div>
</main>
<!-- end main content -->

<%@include file="footerbar.jsp"%>

<!-- JS -->
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/smooth-scrollbar.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
