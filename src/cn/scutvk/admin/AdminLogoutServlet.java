package cn.scutvk.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminLogoutServlet", urlPatterns = "/admin/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // remove adminUserBean in attribute
        request.getSession().removeAttribute("adminUserBean");
        response.setHeader("refresh", "0;url=" + request.getContextPath() + "/admin/login.jsp");
    }
}
