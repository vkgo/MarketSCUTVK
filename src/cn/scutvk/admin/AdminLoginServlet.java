package cn.scutvk.admin;

import cn.scutvk.admin.Utils.AdminDBUtils;
import cn.scutvk.admin.bean.AdminUserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        // check password
        AdminUserBean adminUserBean = new AdminUserBean();
        adminUserBean.setUsername(username);
        adminUserBean.setPassword(password);
        if (AdminDBUtils.adminset_checkpassword(adminUserBean)) {
            // login success
            request.getSession().setAttribute("adminUserBean", adminUserBean);
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
        } else {
            // login fail
            request.getSession().setAttribute("errormsg", "姓名或者密码错误！");
            // redirect to login page
            response.setHeader("refresh", "0;url=" + request.getContextPath() + "/admin/login.jsp");
        }
    }
}
