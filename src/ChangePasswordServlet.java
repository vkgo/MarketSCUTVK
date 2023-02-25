import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ErrorsBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "ChangePasswordServlet",
        value = "/ChangePasswordServlet"
        )
public class ChangePasswordServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // params: oldpassword, newpassword, confirmpassword
        String oldpassword = null;
        String newpassword = null;
        String confirmpassword = null;
        // get parameters
        oldpassword = req.getParameter("oldpassword");
        newpassword = req.getParameter("newpassword");
        confirmpassword = req.getParameter("confirmpassword");
        // check if any parameter is null
        ErrorsBean errorbean = new ErrorsBean();
        boolean flag = true;
        if (oldpassword == null || oldpassword.equals("")) {
            errorbean.setErrors("oldpassword", "旧密码不能为空");
            flag = false;
        }
        if (newpassword == null || newpassword.equals("")) {
            errorbean.setErrors("newpassword", "新密码不能为空");
            flag = false;
        }
        if (confirmpassword == null || confirmpassword.equals("")) {
            errorbean.setErrors("confirmpassword", "确认密码不能为空");
            flag = false;
        }
        if (!flag) {
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
        // check if newpassword equals confirmpassword
        if (!newpassword.equals(confirmpassword)) {
            errorbean.setErrors("confirmpassword", "两次密码不一致");
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
        // check if oldpassword is correct
        UserBean userbean = (UserBean) req.getSession().getAttribute("userBean");
        if (!userbean.getPassword().equals(oldpassword)) {
            errorbean.setErrors("oldpassword", "旧密码错误" + userbean.getPassword());
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
        // check if the newpassword complies with the rules
        if (newpassword.length() > 12 || newpassword.length() < 6) {
            errorbean.setErrors("newpassword", "字符限制6-12位");
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
        // change password
        userbean.setPassword(newpassword);
        flag = DBUtils.users_changepassword(userbean);
        if (!flag) {
            errorbean.setErrors("confirmpassword", "修改密码失败");
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        } else {
            req.getSession().setAttribute("userBean", userbean);
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
    }
}
