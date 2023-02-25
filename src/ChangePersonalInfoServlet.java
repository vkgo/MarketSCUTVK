import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ErrorsBean;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
import cn.scutvk.bean.ZoneBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet(name = "ChangePersonalInfoServlet",
        value = "/ChangePersonalInfoServlet"
)
@MultipartConfig
public class ChangePersonalInfoServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // change the personal information in userBean and zoneBean
        // parameters: username, email, signature, blogurl, file
        String username = null;
        String email = null;
        String signature = null;
        String blogurl = null;
        String sexstr = null;
        Part filepart = null;
        try {
            username = req.getParameter("username");
            email = req.getParameter("email");
            signature = req.getParameter("signature");
            blogurl = req.getParameter("blogurl");
            sexstr = req.getParameter("sex");
        } catch (Exception e) {
            e.printStackTrace();
            req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
            return;
        }
        // get the original userBean and zoneBean
        UserBean userBean = (UserBean) req.getSession().getAttribute("userBean");
        ZoneBean zoneBean = (ZoneBean) req.getSession().getAttribute("zoneBean");
        // set userBean
        if (username != null && !username.equals("") && !username.equals(userBean.getUsername())) {
            userBean.setUsername(username);
        }
        if (email != null && !email.trim().equals("") && email.matches("\\w+@\\w+(\\.\\w+)+") && !email.equals(userBean.getEmail())) {
            userBean.setEmail(email);
        }
        if (sexstr != null && !sexstr.trim().equals("") && !sexstr.equals(userBean.getSex())) {
            userBean.setSex(Integer.parseInt(sexstr));
        }


        // try to get filepart
        boolean fileflag = true;
        try {
            // get file
            filepart = req.getPart("file");
        } catch (Exception e) {
            e.printStackTrace();
            fileflag = false;
        }
        if (fileflag) {
            // check if the file is null
            if (filepart != null && filepart.getSize() > 0) {
                // create a random name with time and random characters
                String filename = Paths.get(filepart.getSubmittedFileName()).getFileName().toString();
                String filetype = filename.substring(filename.lastIndexOf("."));
                String newname = System.currentTimeMillis() + "_" + (int) (Math.random() * 10000) + filetype;
                // save the file
                File file = new File(req.getServletContext().getInitParameter("datapath") + "/avatars", newname);
                String avatarurl = null;
                try (InputStream input = filepart.getInputStream()) {
                    Files.copy(input, file.toPath());
                    avatarurl = "/data/avatars/" + newname;
                }
                // set the avatarurl in userBean
                userBean.setAvatarurl(avatarurl);
            }
        }
        // set zoneBean
        if (!signature.equals(zoneBean.getSignature())) {
            zoneBean.setSignature(signature);
        }
        if (!blogurl.equals(zoneBean.getBlogurl())) {
            zoneBean.setBlogurl(blogurl);
        }
        // update the database
        DBUtils.users_update_byid(userBean);
        DBUtils.zones_update_byid(zoneBean);
        // update the session
        req.getSession().setAttribute("userBean", userBean);
        req.getSession().setAttribute("zoneBean", zoneBean);
        // forward to myzone.jsp
        req.getRequestDispatcher("/myzone.jsp").forward(req, resp);
    }
}
