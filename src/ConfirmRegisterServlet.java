import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConfirmRegisterServlet", urlPatterns = "/confirmregister/*")
public class ConfirmRegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // get confirmid from url
        String confirmid = req.getPathInfo().substring(1);
        // get user from confirmid
        UserBean userBean = (UserBean) req.getServletContext().getAttribute(confirmid);
        // if user is null, redirect to 404 page
        if (userBean == null) {
            resp.setHeader("refresh", "0;url=" + req.getContextPath() + "/404.jsp");
            return;
        }
        // clear confirmid
        req.getServletContext().removeAttribute(confirmid);
        // if the user has not registered
        DBUtils.users_insert(userBean);
        // create a zone for the user
        DBUtils.zones_create(userBean);
        // get fullbean
        userBean = DBUtils.users_getfullbean(userBean);
        // finish register, jump to login page
        resp.getWriter().print("注册成功，3秒后跳转");
        req.getSession().setAttribute("userBean", userBean);
        resp.setHeader("refresh", "3;url=" + req.getContextPath() + "/index.jsp");
    }
}
