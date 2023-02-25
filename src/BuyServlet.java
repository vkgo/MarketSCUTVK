import cn.scutvk.Utils.DBUtils;
import cn.scutvk.Utils.SESUtils;
import cn.scutvk.bean.ErrorsBean;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.OrderBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "BuyServlet", value = "/BuyServlet")
public class BuyServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get buyerid from session attribute
        UserBean buyeruserBean = (UserBean) req.getSession().getAttribute("userBean");
        if (buyeruserBean == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        // Get imageBean from session attribute
        ImageBean imageBean = (ImageBean) req.getSession().getAttribute("imageBean");
        // Get sellerid from imageBean
        UserBean selleruserBean = new UserBean();
        selleruserBean.setUid(imageBean.getUid());
        selleruserBean = DBUtils.users_getshowbean_byid(selleruserBean);
        // Get parameters from request
        String ordername = req.getParameter("ordername");
        String orderemail = req.getParameter("orderemail");
        String remark = req.getParameter("remark");
        // check if ordername and orderemail are empty
        boolean flag = true;
        ErrorsBean errorsBean = new ErrorsBean();
        if (ordername == null || ordername.equals("")) {
            errorsBean.setErrors("ordername", "请输入受让人姓名");
            flag = false;
        }
        if (orderemail == null || orderemail.equals("")) {
            errorsBean.setErrors("orderemail", "请输入受让人邮箱");
            flag = false;
        }
        if (!flag) {
            req.setAttribute("errorsBean", errorsBean);
            req.getRequestDispatcher("order.jsp").forward(req, resp);
            return;
        }
        // Create orderBean
        OrderBean orderBean = new OrderBean();
        orderBean.setBuyerid(buyeruserBean.getUid());
        orderBean.setSellerid(selleruserBean.getUid());
        orderBean.setImgid(imageBean.getImgid());
        orderBean.setOrdername(ordername);
        orderBean.setOrderemail(orderemail);
        orderBean.setRemark(remark);
        orderBean.setPrice(imageBean.getPrice());
        // set timestamp
        Date date = new Date();//获得当前时间
        Timestamp t = new Timestamp(date.getTime());//将时间转换成Timestamp类型，这样便可以存入到Mysql数据库中
        orderBean.setOrderdate(t);
        // Insert orderBean into database
        flag = DBUtils.orders_insert(orderBean);
        orderBean = DBUtils.orders_getfullbean(orderBean);
        // check flag
        if (flag) {
            // Update imageBean's status
            imageBean.setHavesold(true);
            imageBean.setOrderid(orderBean.getOrderid());
            imageBean.setUid(buyeruserBean.getUid());
            imageBean.setVisible(false);
            DBUtils.images_update_order(imageBean);
            // send email to buyer
            SESUtils.SendBuySuccessfullyEmail(orderemail, ordername, orderBean.getOrderdate().toString(), imageBean.getImgname());
            req.getSession().setAttribute("imageBean", imageBean);
            // show suceessfully buying, and jump to myzone.jsp after 3 seconds
            resp.setHeader("refresh", "0;url=buysuccessfully.jsp");
        } else {
            // Forward to error.jsp
            resp.getWriter().print("购买失败，3秒后跳转到商品");
            resp.setHeader("refresh", "3;url=item.jsp");
        }
    }
}
