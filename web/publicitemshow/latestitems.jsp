<%@ page import="cn.scutvk.bean.ImageBean" %>
<%@ page import="cn.scutvk.Utils.ItemUtils" %>
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/07
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<ImageBean> imageBeanList = ItemUtils.get_imagebean_byuploaddate(10, true);
  for (ImageBean imageBean:imageBeanList){
%>
<div class="card">
  <a href=<%="GotoItemImgidParamToAttributeServlet?imgid=" + imageBean.getImgid()%> class="card__cover">
    <img src=<%=request.getContextPath() + imageBean.getStoneurl()%> alt="">
    <span class="card__time"><%=imageBean.getUploaddate()%></span>
  </a>
  <h3 class="card__title"><a href=<%="GotoItemImgidParamToAttributeServlet?imgid=" + imageBean.getImgid()%>><%=imageBean.getImgname()%></a></h3>
  <div class="card__author card__author--verified">
    <img src=<%=request.getContextPath() + imageBean.getAvatarurl()%> alt="">
    <a href=<%="GotoAuthorUidParamToAttributeServlet?uid=" + imageBean.getUid()%>>@<%=imageBean.getUsername()%></a>
  </div>
  <div class="card__info">
    <div class="card__price">
      <span>价格</span>
      <span><%=imageBean.getPrice()%></span>
    </div>

    <button class="card__likes" type="button">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.16,5A6.29,6.29,0,0,0,12,4.36a6.27,6.27,0,0,0-8.16,9.48l6.21,6.22a2.78,2.78,0,0,0,3.9,0l6.21-6.22A6.27,6.27,0,0,0,20.16,5Zm-1.41,7.46-6.21,6.21a.76.76,0,0,1-1.08,0L5.25,12.43a4.29,4.29,0,0,1,0-6,4.27,4.27,0,0,1,6,0,1,1,0,0,0,1.42,0,4.27,4.27,0,0,1,6,0A4.29,4.29,0,0,1,18.75,12.43Z"/></svg>
      <span><%=imageBean.getLikesnumber()%></span>
    </button>
  </div>
</div>
<%
  }
%>