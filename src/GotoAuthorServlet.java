import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GotoAuthorServlet",
        value = "/GotoAuthorServlet"
        )
public class GotoAuthorServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // attributes: uid
        int uid = (int) req.getSession().getAttribute("uid");
        // clear Attribute
        req.getSession().removeAttribute("uid");
        // check if uid is 0
        if (uid == 0) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        // get usershowBean
        UserBean usershowBean = new UserBean();
        usershowBean.setUid(uid);
        usershowBean = DBUtils.users_getshowbean_byid(usershowBean);
        // set usershowBean
        req.getSession().setAttribute("usershowBean", usershowBean);
        // forward
        req.getRequestDispatcher("/author.jsp").forward(req, resp);
    }
}
