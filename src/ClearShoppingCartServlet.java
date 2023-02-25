import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ClearShoppingCartServlet", urlPatterns = "/ClearShoppingCartServlet")
public class ClearShoppingCartServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    public void doPost (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // clear cartList
        req.getSession().setAttribute("cartList", null);
        // refresh to shoppingcart.jsp
        resp.setHeader("refresh", "0;url=shoppingcart.jsp");
        return;
    }
}
