import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ExploreFilterServlet", urlPatterns = {"/ExploreFilterServlet"})
public class ExploreFilterServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get parameters
        String keyword = req.getParameter("keyword");
        String sort = req.getParameter("sort");
        // check parameters
        // check if keyword is null
        if (keyword.trim().length() == 0) {
            keyword = null;
        }
        // check if sort is Integer or sort is not in [0, 1]
        if (sort == null) {
            sort = "0";
        } else {
            try {
                int sortInt = Integer.parseInt(sort);
                if (sortInt < 0 || sortInt > 1) {
                    sort = "0";
                }
            } catch (NumberFormatException e) {
                sort = "0";
            }
        }
        // get attribute
        Object page_index_obj = req.getAttribute("page_index");
        int page_index = 1;

        // check attribute
        if (page_index_obj != null && page_index_obj instanceof Integer) {
            page_index = (int) page_index_obj;
        }
        // jump to explore.jsp
        if (keyword == null) {
            req.getRequestDispatcher("/explore.jsp?page=" + page_index + "&sort=" + sort).forward(req, resp);
            return;
        } else {
            // set keyword to Attribute
            req.getSession().setAttribute("keyword", keyword);
            req.getRequestDispatcher("/explore.jsp?page=" + page_index + "&sort=" + sort + "&keyword=" + keyword).forward(req, resp);
            return;
        }
    }
}
