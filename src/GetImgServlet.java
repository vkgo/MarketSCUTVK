import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

@WebServlet(name = "GetImgServlet",
        value = "/img/*")
@MultipartConfig
public class GetImgServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // substring(1) to remove the first '/'
        String filename = URLDecoder.decode(req.getPathInfo().substring(1), "UTF-8");
        File file = new File(req.getServletContext().getInitParameter("datapath") + "/img", filename);
        resp.setHeader("Content-Type", getServletContext().getMimeType(filename)); // get the MIME type of the file， and set to the context.
        resp.setHeader("Content-Length", String.valueOf(file.length()));
        resp.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
        Files.copy(file.toPath(), resp.getOutputStream());
    }
}
