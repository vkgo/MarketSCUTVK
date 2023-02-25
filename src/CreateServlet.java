import cn.scutvk.Utils.DBUtils;
import cn.scutvk.bean.ErrorsBean;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.UserBean;
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
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "CreateServlet",
        value = "/CreateServlet"
        )
@MultipartConfig
public class CreateServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // parameters: imgname, story, price, file
        Boolean flag = true;
        // get parameters
        String imgname = req.getParameter("imgname");
        String story = req.getParameter("story");
        String price_str = req.getParameter("price");
        double price = 0;
        // get file
        Part filepart = req.getPart("file");
        // check if any parameter is null
        ErrorsBean errorbean = new ErrorsBean();
        if (imgname == null || imgname.equals("")) {
            errorbean.setErrors("imgname", "图片名不能为空");
            flag = false;
        }
        if (story == null || story.equals("")) {
            errorbean.setErrors("story", "故事不能为空");
            flag = false;
        }
        if (price_str == null || price_str.equals("")) {
            errorbean.setErrors("price", "价格不能为空");
            flag = false;
        } else {
            price = Double.parseDouble(price_str);
        }
        if (filepart == null) {
            errorbean.setErrors("file", "文件不能为空");
            flag = false;
        }
        if (!flag) {
            req.setAttribute("errorsBean", errorbean);
            req.getRequestDispatcher("/create.jsp").forward(req, resp);
            return;
        }
        // if all parameters are not null
        // create a random name with time and random characters
        String filename = Paths.get(filepart.getSubmittedFileName()).getFileName().toString();
        String filetype = filename.substring(filename.lastIndexOf("."));
        String newname = System.currentTimeMillis() + "_" + (int) (Math.random() * 10000) + filetype;
        // save the file
        File file = new File(req.getServletContext().getInitParameter("datapath") + "/images", newname);
        try (InputStream input = filepart.getInputStream()) {
            Files.copy(input, file.toPath());
            String url = "/data/images/" + newname;
            // save the data to database
            // create a new bean
            ImageBean imagebean = new ImageBean();
            UserBean userbean = (UserBean) req.getSession().getAttribute("userBean");
            imagebean.setUid(userbean.getUid());
            imagebean.setImgname(imgname);
            imagebean.setStory(story);
            imagebean.setPrice(price);
            imagebean.setStoneurl(url);
            Date date = new Date();//获得当前时间
            Timestamp t = new Timestamp(date.getTime());//将时间转换成Timestamp类型，这样便可以存入到Mysql数据库中
            imagebean.setUploaddate(t);
            // save to database
            DBUtils.images_insert(imagebean);
            // get imgid
            int imgid = DBUtils.images_getid_byothers(imagebean);
            // jump to GotoItemServlet with Parameter: imgid
            // set parameter
            req.getSession().setAttribute("imgid", imgid);
            req.getRequestDispatcher("/GotoItemServlet").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.getRequestDispatcher("/create.jsp").forward(req, resp);
        }
    }
}
