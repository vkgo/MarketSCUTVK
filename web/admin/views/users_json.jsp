<%@ page import="cn.scutvk.admin.Utils.AdminDBUtils" %>
<%@ page import="cn.scutvk.bean.UserBean" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/15
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // judge if adminUserBean is null
    if (session.getAttribute("adminUserBean") == null) {
        response.setHeader("refresh", "0;url=/admin/login.jsp");
    }
%>
<%
    // get all userBean
    List<UserBean> userBeanList = AdminDBUtils.users_getalluserbean();
    for (UserBean userBean: userBeanList) {
        String sex_str = "未设定";
        if (userBean.getSex() == 1) {
            sex_str = "男";
        } else if (userBean.getSex() == 2) {
            sex_str = "女";
        }
%>
    {
    "uid": "<%=userBean.getUid()%>"
    ,"username": "<%=userBean.getUsername()%>"
    ,"password": "<%=userBean.getPassword()%>"
    ,"email": "<%=userBean.getEmail()%>"
    ,"avatarurl": "<%=userBean.getAvatarurl()%>"
    ,"sex": "<%=sex_str%>"
    ,"signupdate": "<%=userBean.getSignupdate()%>"
    ,"latestlogindate": "<%=userBean.getLatestlogindate()%>"
    }
<%
        // judge if it is the last one
        if (userBeanList.indexOf(userBean) != userBeanList.size() - 1) {
%>
    ,
<%
        }
    }
%>