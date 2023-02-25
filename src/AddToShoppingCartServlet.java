import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToShoppingCartServlet", urlPatterns = "/AddToShoppingCartServlet")
public class AddToShoppingCartServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    public void doPost (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // get imageBean
        ImageBean imageBean = (ImageBean) req.getSession().getAttribute("imageBean");
        // get userBean
        UserBean userBean = (UserBean) req.getSession().getAttribute("userBean");
        // check if user is logged in
        if (userBean == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        // get CartList
        List<ImageBean> cartList = (List<ImageBean>) req.getSession().getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<ImageBean>();
        }
        // check if the image is already in the cart
        boolean flag = true;
        for (ImageBean image : cartList) {
            if (image.getImgid() == imageBean.getImgid()) {
                flag = false;
                break;
            }
        }
        // check flag
        if (!flag) {
            resp.getWriter().write("图片已在购物车中");
            resp.setHeader("refresh", "1;url=item.jsp");
            return;
        }
        // add imageBean to cartList
        cartList.add(imageBean);
        // set cartList to session
        req.getSession().setAttribute("cartList", cartList);
        // refresh to item.jsp
        resp.setHeader("refresh", "0;url=item.jsp");
        return;
    }
}
