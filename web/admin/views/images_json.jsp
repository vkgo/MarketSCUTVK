<%@ page import="cn.scutvk.admin.Utils.AdminDBUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.scutvk.bean.ImageBean" %>
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
    // get all images
    List<ImageBean> imageBeanList = AdminDBUtils.images_getallimagesbean();
    for (ImageBean imageBean: imageBeanList) {
%>
    {
    "imgid": "<%=imageBean.getImgid()%>"
    ,"username": "<%=imageBean.getUsername()%>"
    ,"orderid": "<%=imageBean.getOrderid()%>"
    ,"imgname": "<%=imageBean.getImgname()%>"
    ,"stoneurl": "<%=imageBean.getAvatarurl()%>"
    ,"price": "<%=imageBean.getPrice()%>"
    ,"uploaddate": "<%=imageBean.getUploaddate()%>"
    ,"likesnumber": "<%=imageBean.getLikesnumber()%>"
    ,"visible": "<%=imageBean.getVisible()%>"
    ,"havesold": "<%=imageBean.getHavesold()%>"
    }
<%
        // judge if it is the last one
        if (imageBeanList.indexOf(imageBean) != imageBeanList.size() - 1) {
%>
    ,
<%
        }
    }
%>