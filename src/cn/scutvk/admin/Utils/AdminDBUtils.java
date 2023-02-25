package cn.scutvk.admin.Utils;

import cn.scutvk.Utils.DBUtils;
import cn.scutvk.admin.bean.AdminUserBean;
import cn.scutvk.admin.bean.AdminsetBean;
import cn.scutvk.bean.ImageBean;
import cn.scutvk.bean.OrderBean;
import cn.scutvk.bean.UserBean;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class AdminDBUtils {
    // this Utils is used to do the DB command for admin page.
    // functions:
    // adminset_checkpassword, adminset_changeadminuser
    // users_getusersnumber, users_getactiveusersnumber, users_getnewregistedusersnumber, users_getalluserbean
    // images_getimagesnumber, images_getnewuploadedimagesnumber, images_gettotallikesnumber, images_getallimagesbean
    // orders_getordersnumber, orders_getnewordersnumber, orders_gettotalprice, orders_getallordersbean
    public static boolean adminset_checkpassword (AdminUserBean adminUserBean) {
        // check if adminset's adminusername = adminUserBean's username and adminpassword = adminUserBean's password
        // if yes, return true
        // if no, return false
        String sql = "select * from adminset where name = ? and value = ?";
        AdminsetBean adminsetBean = null;
        boolean username_flag = false;
        boolean password_flag = false;
        try {
            adminsetBean = (AdminsetBean) DBUtils.query(sql, new BeanHandler(AdminsetBean.class), "adminusername", adminUserBean.getUsername());
            if (adminsetBean != null) {
                username_flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            adminsetBean = (AdminsetBean) DBUtils.query(sql, new BeanHandler(AdminsetBean.class), "adminpassword", adminUserBean.getPassword());
            if (adminsetBean != null) {
                password_flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (username_flag && password_flag) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean adminset_changeadminuser (AdminUserBean adminUserBean) {
        // change the adminusername and adminpassword
        // if success, return true
        // if fail, return false
        String sql = "update adminset set value = ? where name = ?";
        boolean username_flag = true;
        boolean password_flag = true;
        try {
            DBUtils.update(sql, adminUserBean.getUsername(), "adminusername");
        } catch (SQLException e) {
            e.printStackTrace();
            username_flag = false;
        }
        try {
            DBUtils.update(sql, adminUserBean.getPassword(), "adminpassword");
        } catch (SQLException e) {
            e.printStackTrace();
            password_flag = false;
        }
        if (username_flag && password_flag) {
            return true;
        } else {
            return false;
        }
    }

    public static long users_getusersnumber () {
        // get the number of users
        String sql = "select count(*) from users";
        long users_number = 0;
        try {
            users_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users_number;
    }

    public static long users_getactiveusersnumber () {
        // get the number of active users
        // according to the latestlogindate which is not far than 7 days
        String sql = "select count(*) from users where latestlogindate > date_sub(now(), interval 7 day)";
        long activeusers_number = 0;
        try {
            activeusers_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activeusers_number;
    }

    public static long users_getnewregistedusersnumber () {
        // get the number of new registed users
        // according to the signupdate which is not far than 7 days
        String sql = "select count(*) from users where signupdate > date_sub(now(), interval 1 day)";
        long newregistedusers_number = 0;
        try {
            newregistedusers_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newregistedusers_number;
    }

    public static List<UserBean> users_getalluserbean () {
        // get all user in users
        String sql = "select * from users";
        List<UserBean> userBeanList = null;
        try {
            userBeanList = (List<UserBean>) DBUtils.query(sql, new BeanListHandler(UserBean.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBeanList;
    }

    public static long images_getimagesnumber () {
        // get the number of images
        String sql = "select count(*) from images";
        long images_number = 0;
        try {
            images_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images_number;
    }

    public static long images_getnewuploadedimagesnumber () {
        // get the number of new uploaded images
        // according to the uploaddate which is not far than 7 days
        String sql = "select count(*) from images where uploaddate > date_sub(now(), interval 1 day)";
        long newuploadedimages_number = 0;
        try {
            newuploadedimages_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newuploadedimages_number;
    }

    public static long images_gettotallikesnumber () {
        // get the number of total likes
        String sql = "select sum(likesnumber) from images";
        long totallikes_number = 0;
        try {
            BigDecimal bigDecimal = (BigDecimal) DBUtils.query(sql, new ScalarHandler());
            totallikes_number = Long.parseLong(bigDecimal.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totallikes_number;
    }

    public static List<ImageBean> images_getallimagesbean () {
        // get all images in images
        String sql = "select * from images";
        List<ImageBean> imageBeanList = null;
        try {
            imageBeanList = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageBeanList;
    }

    public static long orders_getordersnumber () {
        // get the number of orders
        String sql = "select count(*) from orders";
        long orders_number = 0;
        try {
            orders_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders_number;
    }

    public static long orders_getnewordersnumber () {
        // get the number of new orders
        // according to the orderdate which is not far than 7 days
        String sql = "select count(*) from orders where orderdate > date_sub(now(), interval 1 day)";
        long neworders_number = 0;
        try {
            neworders_number = (long) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return neworders_number;
    }

    public static double orders_gettotalprice () {
        // get the total price of orders
        String sql = "select sum(price) from orders";
        double totalprice = 0;
        try {
            totalprice = (double) DBUtils.query(sql, new ScalarHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalprice;
    }

    public static List<OrderBean> orders_getallordersbean () {
        // get all orders in orders
        String sql = "select * from orders";
        List<OrderBean> orderBeanList = null;
        try {
            orderBeanList = (List<OrderBean>) DBUtils.query(sql, new BeanListHandler(OrderBean.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderBeanList;
    }
}
