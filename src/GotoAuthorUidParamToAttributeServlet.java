import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GotoAuthorUidParamToAttributeServlet",
        value = "/GotoAuthorUidParamToAttributeServlet"
        )
public class GotoAuthorUidParamToAttributeServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        req.getSession().setAttribute("uid", uid);
        // jump to GotoAuthorServlet
        req.getRequestDispatcher("/GotoAuthorServlet").forward(req, resp);
    }
}
