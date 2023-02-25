<%@ page import="cn.scutvk.admin.Utils.AdminDBUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.scutvk.bean.ImageBean" %>
<%@ page import="cn.scutvk.bean.OrderBean" %>
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
    List<OrderBean> orderBeanList = AdminDBUtils.orders_getallordersbean();
    for (OrderBean orderBean: orderBeanList) {
%>
    {
    "orderid": "<%=orderBean.getOrderid()%>"
    ,"sellerid": "<%=orderBean.getSellerid()%>"
    ,"buyerid": "<%=orderBean.getBuyerid()%>"
    ,"imgid": "<%=orderBean.getImgid()%>"
    ,"ordername": "<%=orderBean.getOrdername()%>"
    ,"orderemail": "<%=orderBean.getOrderemail()%>"
    ,"price": "<%=orderBean.getPrice()%>"
    ,"orderdate": "<%=orderBean.getOrderdate()%>"
    }
<%
        // judge if it is the last one
        if (orderBeanList.indexOf(orderBean) != orderBeanList.size() - 1) {
%>
    ,
<%
        }
    }
%>