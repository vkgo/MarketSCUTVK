import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GotoOrderServlet",
        value = "/GotoOrderServlet"
        )
public class GotoOrderServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get buyerid from session attribute
        UserBean buyeruserBean = (UserBean) req.getSession().getAttribute("userBean");
        if (buyeruserBean == null) {
            resp.getWriter().write("您还没有登录，请先登录！");
            resp.setHeader("refresh", "2;url=login.jsp");
            return;
        }
        // Get imageBean from session attribute
        ImageBean imageBean = (ImageBean) req.getSession().getAttribute("imageBean");
        // Get sellerid from imageBean
        UserBean usershowBean = new UserBean();
        usershowBean.setUid(imageBean.getUid());
        usershowBean = DBUtils.users_getshowbean_byid(usershowBean);
        // check if buyer is the seller
        if (buyeruserBean.getUid() == usershowBean.getUid()) {
            resp.getWriter().write("不能购买自己的作品！");
            resp.setHeader("refresh", "2;url=item.jsp");
            return;
        }
        // jump to order.jsp
        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }
}
