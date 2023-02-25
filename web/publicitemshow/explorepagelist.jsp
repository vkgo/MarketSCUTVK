<%@ page import="cn.scutvk.Utils.ItemUtils" %><%--
  Created by IntelliJ IDEA.
  User: Viking
  Date: 2022/12/12
  Time: 13:57
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
  long total_items_number = (long) request.getSession().getAttribute("total_items_number");
  int page_number = (int) Math.ceil(total_items_number / 12.0);
%>
<ul class="paginator__list">
  <%
    if (page_index != 1) {
  %>
    <li>
      <%
        if (keyword == null)
        {
      %>
        <a href=<%=request.getContextPath() + "/explore.jsp?page=" + (page_index - 1) + "&sort=" + sort%>><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/></svg></a>
      <%
          }
          else
          {
      %>
        <a href=<%=request.getContextPath() + "/explore.jsp?page=" + (page_index - 1) + "&sort=" + sort + "&keyword=" + keyword%>><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/></svg></a>
      <%
          }
      %>
    </li>
  <%
    }
  %>


  <%
      for (int i = 1; i <= page_number; i++) {
        String url = request.getContextPath() + "/explore.jsp?page=" + (i) + "&sort=" + sort;
        if (keyword != null) {
          url = url + "&keyword=" + keyword;
        }
        if (i == page_index) {
  %>
        <li class="active"><a href=<%=url%>><%=i%></a></li>
  <%
        } else {
  %>
        <li><a href=<%=url%>><%=i%></a></li>
  <%
        }
      }
  %>


  <%
    if (page_index != page_number) {
  %>
    <li>
      <%
        if (keyword == null)
        {
      %>
      <a href=<%=request.getContextPath() + "/explore.jsp?page=" + (page_index + 1) + "&sort=" + sort%>>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
          <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
        </svg>
      </a>
      <%
      }
      else
      {
      %>
      <a href=<%=request.getContextPath() + "/explore.jsp?page=" + (page_index + 1) + "&sort=" + sort + "&keyword=" + keyword%>>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
          <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
        </svg>
      </a>
      <%
        }
      %>
    </li>
  <%
    }
  %>
</ul>
