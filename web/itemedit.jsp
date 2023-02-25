<%@ page import="cn.scutvk.bean.ImageBean" %>
<%@ page import="cn.scutvk.bean.UserBean" %>
<%@ page import="cn.scutvk.Utils.DBUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/11
  Time: 10:47
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
    <title>Market - SCUTVK</title>
</head>
<body>
<!-- header -->
<jsp:include page="headerbar.jsp"></jsp:include>
<!-- end header -->
<%
    // check if has imageBean in attribute
    ImageBean imageBean = (ImageBean) request.getSession().getAttribute("imageBean");
    if (imageBean == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    // get showbean
    UserBean usershowBean = new UserBean();
    usershowBean.setUid(imageBean.getUid());
    usershowBean = DBUtils.users_getshowbean_byid(usershowBean);
    // get userebean
    UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
    // check if is the owner
    if (userBean == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (userBean.getUid() != imageBean.getUid()) {
        response.sendRedirect("item.jsp");
        return;
    }
    // get imageBean
    imageBean = DBUtils.images_getfullbean_byid(imageBean);
%>
<!-- main content -->
<main class="main">
    <div class="container">
        <div class="row row--grid">
            <!-- breadcrumb -->
            <div class="col-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb__item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb__item"><a href="author.jsp">Author</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">Item</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>${imageBean.imgname}</h1>
                </div>
            </div>
            <!-- end title -->
        </div>

        <div class="row">
            <!-- content -->
            <div class="col-12 col-xl-8">
                <div class="asset__item">
                    <a class="asset__img" href=<%=request.getContextPath() + imageBean.getStoneurl()%>><img src=<%=request.getContextPath() + imageBean.getStoneurl()%> alt=""></a>

                    <!-- share -->
                    <div class="share share--asset">
                        <a href="#" class="share__link share__link--fb"><svg width="9" height="17" viewBox="0 0 9 17" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M5.56341 16.8197V8.65888H7.81615L8.11468 5.84663H5.56341L5.56724 4.43907C5.56724 3.70559 5.63693 3.31257 6.69042 3.31257H8.09873V0.5H5.84568C3.1394 0.5 2.18686 1.86425 2.18686 4.15848V5.84695H0.499939V8.6592H2.18686V16.8197H5.56341Z"/></svg> <span>share</span></a>
                        <a href="#" class="share__link share__link--tw"><svg width="16" height="12" viewBox="0 0 16 12" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7.55075 3.19219L7.58223 3.71122L7.05762 3.64767C5.14804 3.40404 3.47978 2.57782 2.06334 1.1902L1.37085 0.501686L1.19248 1.01013C0.814766 2.14353 1.05609 3.34048 1.843 4.14552C2.26269 4.5904 2.16826 4.65396 1.4443 4.38914C1.19248 4.3044 0.972149 4.24085 0.951164 4.27263C0.877719 4.34677 1.12953 5.31069 1.32888 5.69202C1.60168 6.22165 2.15777 6.74068 2.76631 7.04787L3.28043 7.2915L2.67188 7.30209C2.08432 7.30209 2.06334 7.31268 2.12629 7.53512C2.33613 8.22364 3.16502 8.95452 4.08833 9.2723L4.73884 9.49474L4.17227 9.8337C3.33289 10.321 2.34663 10.5964 1.36036 10.6175C0.888211 10.6281 0.5 10.6705 0.5 10.7023C0.5 10.8082 1.78005 11.4014 2.52499 11.6344C4.75983 12.3229 7.41435 12.0264 9.40787 10.8506C10.8243 10.0138 12.2408 8.35075 12.9018 6.74068C13.2585 5.88269 13.6152 4.315 13.6152 3.56293C13.6152 3.07567 13.6467 3.01212 14.2343 2.42953C14.5805 2.09056 14.9058 1.71983 14.9687 1.6139C15.0737 1.41264 15.0632 1.41264 14.5281 1.59272C13.6362 1.91049 13.5103 1.86812 13.951 1.39146C14.2762 1.0525 14.6645 0.438131 14.6645 0.258058C14.6645 0.22628 14.5071 0.279243 14.3287 0.374576C14.1398 0.480501 13.7202 0.639389 13.4054 0.734722L12.8388 0.914795L12.3247 0.565241C12.0414 0.374576 11.6427 0.162725 11.4329 0.0991699C10.8978 -0.0491255 10.0794 -0.0279404 9.59673 0.14154C8.2852 0.618204 7.45632 1.84694 7.55075 3.19219Z"/></svg> <span>tweet</span></a>
                        <a href="#" class="share__link share__link--link"><svg width="18" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M8,12a1,1,0,0,0,1,1h6a1,1,0,0,0,0-2H9A1,1,0,0,0,8,12Zm2,3H7A3,3,0,0,1,7,9h3a1,1,0,0,0,0-2H7A5,5,0,0,0,7,17h3a1,1,0,0,0,0-2Zm7-8H14a1,1,0,0,0,0,2h3a3,3,0,0,1,0,6H14a1,1,0,0,0,0,2h3A5,5,0,0,0,17,7Z"/></svg> <span>copy link</span></a>
                    </div>
                    <!-- end share -->

                    <!-- likes -->
                    <button class="asset__likes" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.16,5A6.29,6.29,0,0,0,12,4.36a6.27,6.27,0,0,0-8.16,9.48l6.21,6.22a2.78,2.78,0,0,0,3.9,0l6.21-6.22A6.27,6.27,0,0,0,20.16,5Zm-1.41,7.46-6.21,6.21a.76.76,0,0,1-1.08,0L5.25,12.43a4.29,4.29,0,0,1,0-6,4.27,4.27,0,0,1,6,0,1,1,0,0,0,1.42,0,4.27,4.27,0,0,1,6,0A4.29,4.29,0,0,1,18.75,12.43Z"></path></svg>
                        <span><%=imageBean.getLikesnumber()%></span>
                    </button>
                    <!-- end likes -->
                </div>
            </div>
            <!-- end content -->

            <!-- sidebar -->
            <div class="col-12 col-xl-4">
                <div class="asset__info">
                    <div class="asset__desc">
                        <h2>描述</h2>
                        <p><%=imageBean.getStory()%></p>
                    </div>

                    <ul class="asset__authors">
                        <li>
                            <span>Creator</span>
                            <div class="asset__author asset__author--verified">
                                <img src=<%=request.getContextPath() + usershowBean.getAvatarurl()%> alt="">
                                <a href="author.jsp">@<%=usershowBean.getUsername()%></a>
                            </div>
                        </li>
                        <li>
                            <span>联系作者</span>
                            <div class="asset__author ">
                                <img src=<%=request.getContextPath() + "/data/systemimages/email.png"%> alt="">
                                <a href="author.jsp"><%=usershowBean.getEmail()%></a>
                            </div>
                        </li>
                    </ul>

                    <div class="asset__wrap">
                        <div class="asset__timer">
                            <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.3,8.59l.91-.9a1,1,0,0,0-1.42-1.42l-.9.91a8,8,0,0,0-9.79,0l-.91-.92A1,1,0,0,0,4.77,7.69l.92.91A7.92,7.92,0,0,0,4,13.5,8,8,0,1,0,18.3,8.59ZM12,19.5a6,6,0,1,1,6-6A6,6,0,0,1,12,19.5Zm-2-15h4a1,1,0,0,0,0-2H10a1,1,0,0,0,0,2Zm3,6a1,1,0,0,0-2,0v1.89a1.5,1.5,0,1,0,2,0Z"/></svg>上传日期</span>
                            <%--              <div class="asset__clock"></div>--%>
                            <span><%=imageBean.getUploaddate()%></span>
                        </div>

                        <div class="asset__price">
                            <span>价格</span>
                            <span><%=imageBean.getPrice()%>ETH</span>
                        </div>
                    </div>

                    <!-- actions -->
                    <form action="ItemEditServlet" class="sign__form sign__form--profile" method="post">
                        <div class="row">
                            <div class="col-12">
                                <h4 class="sign__title">修改作品信息</h4>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                <div class="sign__group">
                                    <label class="sign__label" for="itemname">作品名</label>
                                    <input id="itemname" type="text" name="imgname" class="sign__input" required="required" value=<%=imageBean.getImgname()%>>
                                    <span style="color: floralwhite">${errorsBean.errors.imgname}</span>
                                </div>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                                <div class="sign__group">
                                    <label class="sign__label" for="description">图片故事/描述</label>
                                    <textarea id="description" name="story" class="sign__textarea" required="required"><%=imageBean.getStory()%></textarea>
                                    <span style="color: floralwhite">${errorsBean.errors.story}</span>
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="sign__group">
                                    <label class="sign__label" for="price">价格/ETH</label>
                                    <input id="price" type="number" min="0.001" max="9999999999" step="0.001" name="price" class="sign__input" required="required" value=<%=imageBean.getPrice()%>>
                                    <span style="color: floralwhite">${errorsBean.errors.price}</span>
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <div class="sign__group">
                                    <label class="sign__label" for="visible" required="required">可见性</label>
                                    <select id="visible" name="visible" class="sign__select">
                                        <%
                                            if(imageBean.getVisible() == true){
                                        %>
                                            <option value="1" selected="selected">公开</option>
                                            <option value="0">私密</option>
                                        <%
                                            }else{
                                        %>
                                            <option value="1">公开</option>
                                            <option value="0" selected="selected">私密</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <span style="color: floralwhite">${errorsBean.errors.visible}</span>
                                </div>
                            </div>

                            <div class="col-12">
                                <button class="sign__btn" type="submit">更改</button>
                            </div>
                        </div>
                    </form>
                    <!-- end actions -->
                </div>
            </div>
            <!-- end sidebar -->
        </div>

        <!-- explore -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--border-top">
                    <h2><a href="explore.jsp">热门作品</a></h2>
                </div>
            </div>
            <!-- end title -->

            <!-- carousel -->
            <div class="col-12">
                <div class="main__carousel-wrap">
                    <div class="main__carousel main__carousel--explore owl-carousel" id="explore">
                        <jsp:include page="publicitemshow/hotestitems.jsp"></jsp:include>
                    </div>

                    <button class="main__nav main__nav--prev" data-nav="#explore" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/></svg></button>
                    <button class="main__nav main__nav--next" data-nav="#explore" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/></svg></button>
                </div>
            </div>
            <!-- end carousel -->
        </section>
        <!-- end explore -->
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

