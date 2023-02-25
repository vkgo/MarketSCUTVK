<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/11/20
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.scutvk.bean.UserBean"%>
<!-- header -->
<header class="header">
    <div class="header__content">
        <div class="header__logo">
            <a href="index.jsp">
                <img src="data/systemimages/logo2.png" alt="">
            </a>
        </div>

        <div>
            <form action="#" class="header__search">
                <input type="text" placeholder="搜索作品、作者、文章">
                <button type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"/></svg></button>
                <button type="button" class="close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/></svg></button>
            </form>
        </div>

        <div class="header__menu">
            <ul class="header__nav">
                <li class="header__nav-item">
                    <a href="index.jsp" class="header__nav-link">主页</a>
                </li>
                <li class="header__nav-item">
                    <a href="explore.jsp" class="header__nav-link">图片市场</a>
                </li>
                <li class="header__nav-item">
                    <a href="shoppingcart.jsp" class="header__nav-link">购物车</a>
                </li>
                <li class="header__nav-item">
                    <a class="header__nav-link" href="#" role="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">创作者<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z"/></svg></a>

                    <ul class="dropdown-menu header__nav-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="myzone.jsp">个人主页</a></li>
                        <li><a href="create.jsp">创造</a></li>
                    </ul>
                </li>
                <li class="header__nav-item">
                    <a class="header__nav-link header__nav-link--menu" href="#" role="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,10a2,2,0,1,0,2,2A2,2,0,0,0,12,10ZM5,10a2,2,0,1,0,2,2A2,2,0,0,0,5,10Zm14,0a2,2,0,1,0,2,2A2,2,0,0,0,19,10Z"/></svg></a>

                    <ul class="dropdown-menu header__nav-menu" aria-labelledby="dropdownMenu2">
                        <li><a href="404.jsp">404 Page</a></li>
                        <li><a href="privacy.jsp">隐私政策</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="header__actions">
            <div class="header__action header__action--search">
                <button class="header__action-btn" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"/></svg></button>
            </div>

            <div class="header__action header__action--signin">
                <%
                    // get Attribute userBean from session,
                    // if userBean is null, show login and register buttons,
                    // else show username and logout button
                    UserBean userBean = (UserBean) session.getAttribute("userBean");
                    if (userBean == null) {
                %>
                <a class="header__action-btn header__action-btn--signin" href="login.jsp" style="margin: 10px">
                    <span>登录</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/></svg>
                </a>
                <a class="header__action-btn header__action-btn--signin" href="register.jsp" style="margin: 10px">
                    <span>注册</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/></svg>
                </a>
                <%
                    } else {
                %>
                <%--  print username and logout  --%>
                <a class="header__action-btn header__action-btn--signin" href="myzone.jsp" style="background-color: #eb5757; margin: 10px">
                    <img src=<%=request.getContextPath() + "/data/systemimages/zone.png"%> style="width:25px;height:25px;margin-right:10px">
                    <span><%= userBean.getUsername() %></span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/></svg>
                </a>
                <a class="header__action-btn header__action-btn--signin" href="LogoutServlet" style="margin: 10px">
                    <img src=<%=request.getContextPath() + "/data/systemimages/quit.png"%> style="width:25px;height:25px;margin-right:10px">
                    <span>退出</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/></svg>
                </a>
                <a class="header__action-btn header__action-btn--signin" href="shoppingcart.jsp" style="margin: 10px; background-color: lightblue">
                    <%--   let img fix the size   --%>
                    <img src=<%=request.getContextPath() + "/data/systemimages/shoppingcart.png"%> style="width:25px;height:25px;margin-right:10px">
                    <span>购物车</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/></svg>
                </a>
                <%
                    }
                %>
            </div>
        </div>

        <button class="header__btn" type="button">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </div>
</header>
<!-- end header -->
