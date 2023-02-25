import cn.scutvk.Utils.VerifyCodeUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "GetVerifyCodeServlet", urlPatterns = "/GetVerifyCodeServlet/img.vc")
public class GetVerifyCodeServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //outputVerifyImage此方法可以获得一个图片验证码，并返回验证码中的验证数值，可以用前台传过来的验证码与之进行比对
        //宽度 高度       输出流   几个位数的验证码
        String code = VerifyCodeUtils.outputVerifyImage(100, 40, resp.getOutputStream(), 4);
        req.getSession().setAttribute("verifycode",code);
    }
}
