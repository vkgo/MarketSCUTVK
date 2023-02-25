<%@ page import="cn.scutvk.bean.UserBean" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.scutvk.bean.ImageBean" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/17
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // get userBean from attribute
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    // check if having logged in
    if (userBean == null) {
        response.setHeader("refresh", "0;url=login.jsp");
        return;
    }
    // get cartList from attribute
    List<ImageBean> cartList = (List<ImageBean>) session.getAttribute("cartList");
%>
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
                    <li class="breadcrumb__item"><a href="index.jsp">主页</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">购物车</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>购物车</h1>
                </div>
            </div>
            <!-- end title -->
        </div>

        <div class="row">

            <div class="col-5 col-xs-12">
                <form action="ShoppingCartBuyServlet" class="sign__form sign__form--contacts" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="main__title main__title--sidebar">
                                <h3>受让人信息</h3>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="sign__group">
                                <input type="text" name="ordername" class="sign__input" placeholder="姓名">${errorsBean.errors.ordername}
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="sign__group">
                                <input type="text" name="orderemail" class="sign__input" placeholder="电子邮件">${errorsBean.errors.orderemail}
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="sign__group">
                                <textarea name="remark" class="sign__textarea" placeholder="备注"></textarea>
                            </div>
                        </div>
                        <%
                            if (cartList == null || cartList.size() == 0) {
                        %>
                            <div class="col-6">
                                <button type="submit" class="sign__btn" style="width: 120px;margin: auto;background-color: gray">提交订单</button>
                            </div>

                            <div class="col-6">
                                <button type="button" class="sign__btn" style="width: 120px;margin: auto;background-color: gray" onclick='location.href=("ClearShoppingCartServlet")'>清空列表</button>
                            </div>
                        <%
                            } else {
                        %>
                            <div class="col-6">
                                <button type="submit" class="sign__btn" style="width: 120px;margin: auto">提交订单</button>
                            </div>

                            <div class="col-6">
                                <button type="button" class="sign__btn" style="width: 120px;margin: auto;background-color: #eb5757" onclick='location.href=("ClearShoppingCartServlet")'>清空列表</button>
                            </div>
                        <%
                            }
                        %>
                    </div>
                </form>
            </div>


            <!-- content -->
            <div class="col-7 col-xs-12">
                <div class="row row--grid">
                    <%
                        if (cartList == null) {
                    %>
                            <div class="col-12">
                                <div class="page-404">
                                    <div class="page-404__wrap">
                                        <div class="page-404__content">
                                            <h1 class="page-404__title">空</h1>
                                            <p class="page-404__text">快逃离！您还没有添加任何作品到购物车~~</p>
                                            <a href="index.jsp" class="page-404__btn" style="width: 120px">返回</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <%
                        } else {
                            for (ImageBean imageBean: cartList) {
                    %>
                                <div class="col-12">
                                    <div class="activity">
                                        <a href=<%="GotoItemImgidParamToAttributeServlet?imgid=" + imageBean.getImgid()%> class="activity__cover">
                                            <img src=<%=request.getContextPath() + imageBean.getStoneurl()%> alt="">
                                        </a>
                                        <div class="activity__content">
                                            <h3 class="activity__title"><a href=<%="GotoItemImgidParamToAttributeServlet?imgid=" + imageBean.getImgid()%>><%=imageBean.getImgname()%></a></h3>
                                            <p class="activity__text">作者： <a href=<%="GotoAuthorUidParamToAttributeServlet?uid=" + imageBean.getUid()%>>@<%=imageBean.getUsername()%></a> <br>售价 <b><%=imageBean.getPrice()%>ETH</b></p>
                                            <span class="activity__time"><%=imageBean.getUploaddate()%></span>
                                        </div>
                                    </div>
                                </div>
                    <%
                            }
                        }
                    %>

                </div>
                <!-- end collapse -->
            </div>
            <!-- end content -->
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
