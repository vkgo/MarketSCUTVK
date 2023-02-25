<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/11/27
  Time: 15:53
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

<%
  // if user is not login, redirect to login page
    if (session.getAttribute("userBean") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- main content -->
<main class="main">
  <div class="main__author" data-bg="img/bg/bg.png"></div>
  <div class="container">
    <div class="row row--grid">
      <!-- author -->
      <div class="col-12 col-xl-3">
        <div class="author author--page">
          <jsp:include page="myzoneitemshow/usercard.jsp"></jsp:include>
        </div>
      </div>
      <!-- end author -->

      <div class="col-12 col-xl-9">
        <!-- title -->
        <div class="main__title main__title--create">
          <h2>Create collectible item</h2>
        </div>
        <!-- end title -->

        <!-- create form -->
        <form action="CreateServlet" class="sign__form sign__form--create" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-12">
              <h4 class="sign__title">上传的图片</h4>
            </div>

            <div class="col-12">
              <div class="sign__file">
                <label id="file1" for="sign__file-upload">Image</label>
                <input data-username="#file1" id="sign__file-upload" name="file" class="sign__file-upload" type="file" accept=".png,.jpg,.jpeg">
                <span style="color: floralwhite">${errorsBean.errors.file}</span>
              </div>
            </div>

            <div class="col-12">
              <h4 class="sign__title">图片信息</h4>
            </div>

            <div class="col-12">
              <div class="sign__group">
                <label class="sign__label" for="itemname">图片命名</label>
                <input id="itemname" type="text" name="imgname" class="sign__input" placeholder="例如'Crypto Heart'">
                <span style="color: floralwhite">${errorsBean.errors.imgname}</span>
              </div>
            </div>

            <div class="col-12">
              <div class="sign__group">
                <label class="sign__label" for="description">图片故事/描述</label>
                <textarea id="description" name="story" class="sign__textarea" placeholder="例如'After purchasing you will able to recived...'"></textarea>
                <span style="color: floralwhite">${errorsBean.errors.story}</span>
              </div>
            </div>

            <div class="col-12 col-md-4">
              <div class="sign__group">
                <label class="sign__label" for="royalties">税率</label>
                <select id="royalties" name="royalties" class="sign__select">
                  <option value="1">5%</option>
                  <option value="2">10%</option>
                  <option value="3">20%</option>
                </select>
              </div>
            </div>

            <div class="col-12 col-md-4">
              <div class="sign__group">
                <label class="sign__label" for="size">价格/ETH</label>
                <input id="size" type="number" min="0.001" max="9999999999" step="0.001" name="price" class="sign__input" placeholder="例如3.99">
                <span style="color: floralwhite">${errorsBean.errors.price}</span>
              </div>
            </div>

            <div class="col-12 col-md-4">
              <div class="sign__group">
                <label class="sign__label" for="propertie">所有权</label>
                <input id="propertie" type="text" name="propertie" class="sign__input" placeholder="Subject">
              </div>
            </div>

            <div class="col-12 col-xl-3">
              <button type="submit" class="sign__btn">确定上传</button>
            </div>
          </div>
        </form>
        <!-- end create form -->
      </div>
    </div>
  </div>
</main>
<!-- end main content -->

<!-- footer -->
<%@include file="footerbar.jsp"%>
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
