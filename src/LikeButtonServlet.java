import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LikeButtonServlet", urlPatterns = "/LikeButtonServlet")
public class LikeButtonServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // get imgid from request parameter
        String imgid = req.getParameter("imgid");
        // check UserBean
        if (req.getSession().getAttribute("userBean") == null) {
            resp.getWriter().write("请先登录后进行点赞");
            resp.setHeader("refresh", "1;url=login.jsp");
            return;
        }
        // update likesnumber
        ImageBean imageBean = (ImageBean) req.getSession().getAttribute("imageBean");
        if (imageBean == null) {
            resp.getWriter().write("未知图片");
            resp.setHeader("refresh", "1;url=index.jsp");
            return;
        }
        imageBean = DBUtils.images_addlikesnumber(imageBean);
        // update session
        req.getSession().setAttribute("imageBean", imageBean);
        // redirect to item.jsp
        resp.sendRedirect("item.jsp");
    }
}
