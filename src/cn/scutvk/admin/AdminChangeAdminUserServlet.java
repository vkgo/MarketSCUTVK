package cn.scutvk.admin;

import cn.scutvk.admin.Utils.AdminDBUtils;
import cn.scutvk.admin.bean.AdminUserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminChangeAdminUserServlet", urlPatterns = "/admin/AdminChangeAdminUserServlet")
public class AdminChangeAdminUserServlet extends HttpServlet {
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the new adminusername and adminpassword
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        // check if the new password is the same as the confirm password
        if (!password.equals(confirmpassword)) {
            // if not, return to the adminset.jsp
            response.getWriter().write("新旧密码不一致");
            response.setHeader("refresh", "2;url=" + request.getContextPath() + "/admin/views/operaterule.jsp");
            return;
        }
        // update the adminusername and adminpassword
        AdminUserBean adminUserBean = new AdminUserBean();
        adminUserBean.setUsername(username);
        adminUserBean.setPassword(password);
        boolean flag = AdminDBUtils.adminset_changeadminuser(adminUserBean);
        if (flag) {
            // update attribute
            request.getSession().setAttribute("adminUserBean", adminUserBean);
            // if success, return to the adminset.jsp
            response.getWriter().write("修改成功");
            response.setHeader("refresh", "2;url=" + request.getContextPath() + "/admin/views/operaterule.jsp");
        } else {
            // if fail, return to the adminset.jsp
            response.getWriter().write("修改失败");
            response.setHeader("refresh", "2;url=" + request.getContextPath() + "/admin/views/operaterule.jsp");
        }
    }
}
