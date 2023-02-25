import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ErrorsBean;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "ItemEditServlet", urlPatterns = "/ItemEditServlet")
public class ItemEditServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    public void doPost (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // get parameters
        String imgname = req.getParameter("imgname");
        String story = req.getParameter("story");
        String price_str = req.getParameter("price");
        String visible_str = req.getParameter("visible");
        // check parameters
        ErrorsBean errorsBean = new ErrorsBean();
        boolean flag = true;
        if (imgname == null || "".equals(imgname)) {
            errorsBean.setErrors("imgname", "作品名不能为空");
            flag = false;
        }
        if (story == null || "".equals(story)) {
            errorsBean.setErrors("story", "故事不能为空");
            flag = false;
        }
        if (price_str == null || "".equals(price_str)) {
            errorsBean.setErrors("price", "价格不能为空");
            flag = false;
        } else {
            try {
                double price = Double.parseDouble(price_str);
                if (price < 0) {
                    errorsBean.setErrors("price", "价格不能为负数");
                    flag = false;
                }
            } catch (NumberFormatException e) {
                errorsBean.setErrors("price", "价格必须为数字");
                flag = false;
            }
        }
        if (visible_str == null || "".equals(visible_str)) {
            errorsBean.setErrors("visible", "是否可见不能为空");
            flag = false;
        } else {
            try {
                int visible = Integer.parseInt(visible_str);
                if (visible != 0 && visible != 1) {
                    errorsBean.setErrors("visible", "是否可见只能为0或1");
                    flag = false;
                }
            } catch (NumberFormatException e) {
                errorsBean.setErrors("visible", "是否可见只能为0或1");
                flag = false;
            }
        }
        // check flag
        if (!flag)  {
            // set errorsBean to request
            req.setAttribute("errorsBean", errorsBean);
            // forward to itemedit.jsp
            try {
                req.getRequestDispatcher("itemedit.jsp").forward(req, resp);
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        // get Attribute
        UserBean userBean = (UserBean) req.getSession().getAttribute("userBean");
        ImageBean imageBean = (ImageBean) req.getSession().getAttribute("imageBean");
        // check Bean
        if (userBean == null) {
            try {
                resp.sendRedirect("login.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (imageBean == null) {
            try {
                resp.sendRedirect("index.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // check if the user is the owner of the image
        if (userBean.getUid() != imageBean.getUid()) {
            try {
                resp.sendRedirect("index.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // change data type
        double price = Double.parseDouble(price_str);
        boolean visible = (Integer.parseInt(visible_str) == 1);
        // update imageBean
        imageBean.setImgname(imgname);
        imageBean.setStory(story);
        imageBean.setPrice(price);
        imageBean.setVisible(visible);
        // update database
        try {
            flag = DBUtils.images_update_byid(imageBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!flag) {
            try {
                resp.sendRedirect("itemedit.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // update session
        req.getSession().setAttribute("imageBean", imageBean);
        // forward to item.jsp
        resp.getWriter().write("修改成功！");
        resp.setHeader("refresh", "1;url=item.jsp");
    }
}
