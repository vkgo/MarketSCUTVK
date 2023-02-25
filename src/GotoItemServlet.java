import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ImageBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(name = "GotoItemServlet",
        value = "/GotoItemServlet"
        )
public class GotoItemServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // params: imgid
        int imgid = (int) req.getSession().getAttribute("imgid");
        // clear Attribute
        req.getSession().removeAttribute("imgid");
        // check if imgid is 0
        if (imgid == 0) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        // get imageBean
        ImageBean imageBean = new ImageBean();
        imageBean.setImgid(imgid);
        imageBean = DBUtils.images_getshowbean_byid(imageBean);
        // set imageBean
        req.getSession().setAttribute("imageBean", imageBean);
        // forward
        req.getRequestDispatcher("/item.jsp").forward(req, resp);
    }
}
