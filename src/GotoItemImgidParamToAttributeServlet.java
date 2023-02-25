import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GotoItemImgidParamToAttributeServlet",
        value = "/GotoItemImgidParamToAttributeServlet"
        )
public class GotoItemImgidParamToAttributeServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int imgid = Integer.parseInt(req.getParameter("imgid"));
        req.getSession().setAttribute("imgid", imgid);
        // jump to GotoItemServlet
        req.getRequestDispatcher("/GotoItemServlet").forward(req, resp);
    }
}