<%@ page import="cn.scutvk.bean.ZoneBean" %>
<%@ page import="cn.scutvk.Utils.DBUtils" %>
<%@ page import="cn.scutvk.bean.UserBean" %>
<%--
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
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    if (userBean == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    // check if zoneBean is null
    ZoneBean zoneBean = (ZoneBean) session.getAttribute("zoneBean");
    if (zoneBean == null) {
        zoneBean = DBUtils.zones_getbean(userBean);
        // set zonebean to request attribute
        request.getSession().setAttribute("zoneBean", zoneBean);
    }
%>
<%
    int uid = userBean.getUid();
    request.getSession().setAttribute("uid", uid);
%>
<!-- main content -->
<main class="main">
    <div class="main__author" data-bg="img/bg/bg.png"></div>
    <div class="container">
        <div class="row row--grid">
            <div class="col-12 col-xl-3">
                <jsp:include page="myzoneitemshow/usercard.jsp"></jsp:include>
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

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">设置</a>
                        </li>
                    </ul>
                    <!-- end tabs nav -->
                </div>

                <!-- content tabs -->
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-1" role="tabpanel">
                        <div class="row row--grid">
                            <%--    展示本uid的image     --%>
                            <jsp:include page="myzoneitemshow/uidonsolditems.jsp"></jsp:include>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-2" role="tabpanel">
                        <div class="row row--grid">
                            <jsp:include page="myzoneitemshow/uiditems.jsp"></jsp:include>
                        </div>
                    </div>


                    <%--      设置页面   --%>
                    <div class="tab-pane fade" id="tab-3" role="tabpanel">
                        <div class="row row--grid">
                            <!-- details form -->
                            <div class="col-12 col-lg-6">
                                <form action="ChangePersonalInfoServlet" class="sign__form sign__form--profile" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4 class="sign__title">个人信息</h4>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="username">用户名</label>
                                                <input id="username" type="text" name="username" class="sign__input" value="${userBean.username}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="email">Email</label>
                                                <input id="email" type="text" name="email" class="sign__input" value="${userBean.email}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="blogurl">blogurl</label>
                                                <input id="blogurl" type="text" name="blogurl" class="sign__input" value="${zoneBean.blogurl}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="select">性別</label>
                                                <select name="sex" id="select" class="sign__select">
                                                    <%
                                                        if (userBean.getSex() == 0) {
                                                    %>
                                                    <option value="0" selected="selected">不选择</option>
                                                    <%
                                                    } else {
                                                    %>
                                                    <option value="0">不选择</option>
                                                    <%
                                                        }
                                                        if (userBean.getSex() == 1) {
                                                    %>
                                                    <option value="1" selected="selected">男</option>
                                                    <%
                                                    } else {
                                                    %>
                                                    <option value="1">男</option>
                                                    <%
                                                        }
                                                        if (userBean.getSex() == 2) {
                                                    %>
                                                    <option value="2" selected="selected">女</option>
                                                    <%
                                                    } else {
                                                    %>
                                                    <option value="2">女</option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="sign__file">
                                                <label id="file1" for="sign__file-upload">头像更改</label>
                                                <input data-username="#file1" id="sign__file-upload" name="file" class="sign__file-upload" type="file" accept=".png,.jpg,.jpeg">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="sign__group">
                                                <label class="sign__label" for="signature">签名</label>
                                                <input id="signature" type="text" name="signature" class="sign__input" value="${zoneBean.signature}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <button class="sign__btn" type="submit">更改</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- end details form -->

                            <!-- password form -->
                            <div class="col-12 col-lg-6">
                                <form action="ChangePasswordServlet" class="sign__form sign__form--profile" method="post">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4 class="sign__title">更改密码</h4>
                                        </div>

                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="sign__group">
                                                <label class="sign__label" for="oldpass">旧密码</label>
                                                <input id="oldpass" type="password" name="oldpassword" class="sign__input">
                                                <span style="color: #ffffff">${errorsBean.errors.oldpassword}</span>
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="sign__group">
                                                <label class="sign__label" for="newpass">新密码</label>
                                                <input id="newpass" type="password" name="newpassword" class="sign__input">
                                                <span style="color: #ffffff">${errorsBean.errors.newpassword}</span>
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                            <div class="sign__group">
                                                <label class="sign__label" for="confirmpass">再次输入新密码</label>
                                                <input id="confirmpass" type="password" name="confirmpassword" class="sign__input">
                                                <span style="color: #ffffff">${errorsBean.errors.confirmpassword}</span>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <button class="sign__btn" type="submit">更改</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- end password form -->
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
