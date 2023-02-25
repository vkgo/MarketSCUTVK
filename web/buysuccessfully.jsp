<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/18
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
<!-- header -->
<jsp:include page="headerbar.jsp"></jsp:include>
<!-- end header -->

<!-- main content -->
<main class="main">
  <div class="container">
    <div class="row row--grid">
      <!-- breadcrumb -->
      <div class="col-12">
        <ul class="breadcrumb">
          <li class="breadcrumb__item"><a href="index.jsp">前往主页</a></li>
          <li class="breadcrumb__item breadcrumb__item--active">购买成功</li>
        </ul>
      </div>
      <!-- end breadcrumb -->

      <!-- error -->
      <div class="col-12">
        <div class="page-404">
          <div class="page-404__wrap">
            <div class="page-404__content">
              <h1 class="page-404__title">恭喜</h1>
              <p class="page-404__text">购买成功！您可以在您的主页中查看编辑新购入的作品~~</p>
              <a href="myzone.jsp" class="page-404__btn">前往主页</a>
            </div>
          </div>
        </div>
      </div>
      <!-- end error -->
    </div>
  </div>
</main>
<!-- end main content -->

<!-- footer -->
<jsp:include page="footerbar.jsp"></jsp:include>
<!-- end footer -->

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
