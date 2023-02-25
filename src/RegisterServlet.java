import cn.scutvk.Utils.DBUtils;
import cn.scutvk.Utils.SESUtils;
import cn.scutvk.bean.CheckRegisterBean;
import cn.scutvk.bean.UserBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

public class RegisterServlet extends HttpServlet {
    private static String getRandomString(int length) { //length表示生成字符串的长度
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";   //生成字符串从此序列中取
        java.util.Random random = new java.util.Random();   //生成随机类
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // set utf-8
        resp.setHeader("Content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        // confirm verifycode
        String verifycode = req.getParameter("verifycode");
        if (!verifycode.equals(req.getSession().getAttribute("verifycode"))) {
            resp.getWriter().print("验证码错误");
            resp.setHeader("refresh", "1;url=register.jsp");
            return;
        }
        req.getSession().removeAttribute("verifycode");
        // get parameters
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String password2 = req.getParameter("password2");
        String email = req.getParameter("email");
        // set parameters to bean
        CheckRegisterBean crbean = new CheckRegisterBean();
        crbean.setUsername(username);
        crbean.setPassword(password);
        crbean.setPassword2(password2);
        crbean.setEmail(email);
        // check if the form of register is valid
        if (!crbean.validate()) {
            req.setAttribute("crbean", crbean);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }
        // if the form of register is valid, send email to user
        UserBean userBean = new UserBean();
        userBean.setUsername(username);
        userBean.setPassword(password);
        userBean.setEmail(email);
        // set date
        Date date = new Date();//获得当前时间
        Timestamp t = new Timestamp(date.getTime());//将时间转换成Timestamp类型，这样便可以存入到Mysql数据库中
        userBean.setSignupdate(t);
        userBean.setLatestlogindate(t);
        // check if the user has already registered
        boolean res = DBUtils.users_checkexist(userBean);
        if (res) {
            crbean.setErrors("username", "用户名已存在");
            req.setAttribute("crbean", crbean);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }


        // save userBean to application attribute and send confirm email
        String verifyid = getRandomString(64);
        req.getServletContext().setAttribute(verifyid, userBean);
        SESUtils.SendConfirmRegisterEmail(email, username, verifyid);


        resp.setHeader("refresh", "0;url=gocheckemail.jsp");
    }
}
