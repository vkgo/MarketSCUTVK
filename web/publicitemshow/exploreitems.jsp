<%@ page import="java.util.List" %>
<%@ page import="cn.scutvk.bean.ImageBean" %>
<%@ page import="cn.scutvk.Utils.ItemUtils" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/11
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // get attributes
    Object page_index_obj = request.getSession().getAttribute("page_index");
    Object keyword_obj = request.getSession().getAttribute("keyword");
    Object sort_obj = request.getSession().getAttribute("sort");

    int page_index = 1;
    if (page_index_obj != null) {
      page_index = Integer.parseInt(page_index_obj.toString());
    }
    String keyword = null;
    if (keyword_obj != null) {
      keyword = keyword_obj.toString();
    }
    String sort = "0";
    if (sort_obj != null) {
        sort = sort_obj.toString();
    }
    try {
        int sort_int = Integer.parseInt(sort);
        if (sort_int < 0 || sort_int > 1) {
            sort = "0";
        }
    } catch (Exception e) {
        sort = "0";
    }

    long total_items_number = 0;
    long page_items_number = 0;
    // get imageBeanList
    List<ImageBean> imageBeanList = null;
    if ("0".equals(sort)) {
      if (keyword == null) {
        imageBeanList = ItemUtils.get_imagebean_byuploaddate(12, 12 * (page_index - 1), true);
        total_items_number = ItemUtils.get_images_length(true);
      } else {
        imageBeanList = ItemUtils.get_imagebean_bykeyword(keyword, 12, 12 * (page_index - 1), true, false);
        total_items_number = ItemUtils.get_images_length_bykeyword(keyword, true);
      }
    } else if ("1".equals(sort)) {
      if (keyword == null) {
        imageBeanList = ItemUtils.get_imagebean_bylikesnumber(12, 12 * (page_index - 1), true);
        total_items_number = ItemUtils.get_images_length(true);
      } else {
        imageBeanList = ItemUtils.get_imagebean_bykeyword(keyword, 12, 12 * (page_index - 1), true, true);
        total_items_number = ItemUtils.get_images_length_bykeyword(keyword, true);
      }
    }
    page_items_number = imageBeanList.size();
%>
<%
    // set total items number and page items number to attributes
    request.getSession().setAttribute("total_items_number", total_items_number);
    request.getSession().setAttribute("page_items_number", page_items_number);
%>
<%
  for (ImageBean imageBean:imageBeanList) {
%>
  <div class="col-12 col-sm-6 col-lg-4">
    <!-- card -->
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
    <!-- end card -->
  </div>
<%
  }
%>