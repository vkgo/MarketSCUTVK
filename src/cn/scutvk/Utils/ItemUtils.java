package cn.scutvk.Utils;

import cn.scutvk.bean.ImageBean;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ItemUtils {
    // this Utils is used to get the imageBean of a specific number and specific rules
    // has methods: get_imagebean_bylikesnumber, get_imagebean_byuploaddate, get_imagebean_byuid
    // get_imagebean_bykeyword

    public static List<ImageBean> get_imagebean_bylikesnumber() throws SQLException {
        // this function is used to get the imageBean of a specific number by likesnumber
        // return: List<ImageBean>
        String sql = "select * from images order by likesnumber desc";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
        return res;
    }

    public static List<ImageBean> get_imagebean_bylikesnumber(boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by likesnumber
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by likesnumber desc";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
            return res;
        } else {
            return get_imagebean_bylikesnumber();
        }
    }

    public static List<ImageBean> get_imagebean_bylikesnumber(int num) throws SQLException {
        // this function is used to get the imageBean of a specific number by likesnumber
        // params: num
        // return: List<ImageBean>
        String sql = "select * from images order by likesnumber desc limit ?";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
        return res;
    }

    public static List<ImageBean> get_imagebean_bylikesnumber(int num, int start_index) throws SQLException {
        // get imageBeans from start_index to start_index+num
        // params: num, start_index
        // return: List<ImageBean>
        String sql = "select * from images order by likesnumber desc limit ?, ?";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
        return res;
    }

    public static List<ImageBean> get_imagebean_bylikesnumber(int num, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by likesnumber
        // params: num, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by likesnumber desc limit ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
            return res;
        } else {
            return get_imagebean_bylikesnumber(num);
        }
    }

    public static List<ImageBean> get_imagebean_bylikesnumber(int num, int start_index, boolean usevisible) throws SQLException {
        // get imageBeans from start_index to start_index+num
        // params: num, start_index, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by likesnumber desc limit ?, ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
            return res;
        } else {
            return get_imagebean_bylikesnumber(num, start_index);
        }
    }






    public static List<ImageBean> get_imagebean_byuploaddate() throws SQLException {
        // this function is used to get the imageBean of a specific number by time
        // return: List<ImageBean>
        String sql = "select * from images order by uploaddate desc";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
        return res;
    }

    public static List<ImageBean> get_imagebean_byuploaddate(boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by time
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by uploaddate desc";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
            return res;
        } else {
            return get_imagebean_byuploaddate();
        }
    }

    public static List<ImageBean> get_imagebean_byuploaddate(int num) throws SQLException {
        // this function is used to get the imageBean of a specific number by time
        // params: num
        // return: List<ImageBean>
        String sql = "select * from images order by uploaddate desc limit ?";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
        return res;
    }

    public static List<ImageBean> get_imagebean_byuploaddate(int num, int start_index) throws SQLException {
        // get imagesBean from start_index to start_index+num
        // params: num, start_index
        // return: List<ImageBean>
        String sql = "select * from images order by uploaddate desc limit ?, ?";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
        return res;
    }

    public static List<ImageBean> get_imagebean_byuploaddate(int num, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by time
        // params: num, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by uploaddate desc limit ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
            return res;
        } else {
            return get_imagebean_byuploaddate(num);
        }
    }

    public static List<ImageBean> get_imagebean_byuploaddate(int num, int start_index, boolean usevisible) throws SQLException {
        // get imagesBean from start_index to start_index+num
        // params: num, start_index, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where visible=1 order by uploaddate desc limit ?, ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
            return res;
        } else {
            return get_imagebean_byuploaddate(num, start_index);
        }
    }






    public static List<ImageBean> get_imagebean_byuid(int uid) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid
        // return: List<ImageBean>
        String sql = "select * from images where uid=? order by uploaddate desc";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid);
        return res;
    }

    public static List<ImageBean> get_imagebean_byuid(int uid, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where uid=? and visible=1 order by uploaddate desc";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid);
            return res;
        } else {
            return get_imagebean_byuid(uid);
        }
    }

    public static List<ImageBean> get_imagebean_byuid(int uid, boolean usevisible, boolean usehavesold) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid, usevisible, usehavesold
        // return: List<ImageBean>
        if (usevisible) {
            if (usehavesold) {
                String sql = "select * from images where uid=? and visible=1 and havesold=0 order by uploaddate desc";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid);
                return res;
            } else {
                String sql = "select * from images where uid=? and visible=1 order by uploaddate desc";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid);
                return res;
            }
        } else {
            if (usehavesold) {
                String sql = "select * from images where uid=? and havesold=0 order by uploaddate desc";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid);
                return res;
            } else {
                return get_imagebean_byuid(uid);
            }
        }
    }

    public static List<ImageBean> get_imagebean_byuid(int uid, int num) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid, num
        // return: List<ImageBean>
        String sql = "select * from images where uid=? order by uploaddate desc limit ?";
        List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid, num);
        return res;
    }

    public static List<ImageBean> get_imagebean_byuid(int uid, int num, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid, num, usevisible
        // return: List<ImageBean>
        if (usevisible) {
            String sql = "select * from images where uid=? and visible=1 order by uploaddate desc limit ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid, num);
            return res;
        } else {
            return get_imagebean_byuid(uid, num);
        }
    }

    public static List<ImageBean> get_imagebean_byuid(int uid, int num, boolean usevisible, boolean usehavesold) throws SQLException {
        // this function is used to get the imageBean of a specific number by uid
        // params: uid, num, usevisible, usehavesold
        // return: List<ImageBean>
        if (usevisible) {
            if (usehavesold) {
                String sql = "select * from images where uid=? and visible=1 and havesold=0 order by uploaddate desc limit ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid, num);
                return res;
            } else {
                String sql = "select * from images where uid=? and visible=1 order by uploaddate desc limit ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), uid, num);
                return res;
            }
        } else {
            return get_imagebean_byuid(uid, num);
        }
    }




    public static List<ImageBean> get_imagebean_bykeyword (String keyword) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword
        // params: keyword
        // return: List<ImageBean>
        // check if keyword has space
        if (keyword.contains(" ")) {
            String[] keywords = keyword.split(" ");
            String sql = "select * from images where (";
            for (int i = 0; i < keywords.length; i++) {
                sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                if (i != keywords.length - 1) {
                    sql += " or ";
                }
            }
            sql += ") order by uploaddate desc";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
            return res;
        } else {
            String sql = "select * from images where (imgname like ? or story like ?) order by uploaddate desc";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%");
            return res;
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, int num) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword limit num
        // params: keyword, num
        // return: List<ImageBean>
        // check if keyword has space
        if (keyword.contains(" ")) {
            String[] keywords = keyword.split(" ");
            String sql = "select * from images where (";
            for (int i = 0; i < keywords.length; i++) {
                sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                if (i != keywords.length - 1) {
                    sql += " or ";
                }
            }
            sql += ") order by uploaddate desc limit ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
            return res;
        } else {
            String sql = "select * from images where (imgname like ? or story like ?) order by uploaddate desc limit ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", num);
            return res;
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, int num, int start_index) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword from start_index to start_index+num
        // params: keyword, num
        // return: List<ImageBean>
        // check if keyword has space
        if (keyword.contains(" ")) {
            String[] keywords = keyword.split(" ");
            String sql = "select * from images where (";
            for (int i = 0; i < keywords.length; i++) {
                sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                if (i != keywords.length - 1) {
                    sql += " or ";
                }
            }
            sql += ") order by uploaddate desc limit ?, ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
            return res;
        } else {
            String sql = "select * from images where (imgname like ? or story like ?) order by uploaddate desc limit ?, ?";
            List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", start_index, num);
            return res;
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword
        // params: keyword, usevisible
        // return: List<ImageBean>
        // check if keyword has space
        if (usevisible) {
            if (keyword.contains(" ")) {
                String[] keywords = keyword.split(" ");
                String sql = "select * from images where (";
                for (int i = 0; i < keywords.length; i++) {
                    sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                    if (i != keywords.length - 1) {
                        sql += " or ";
                    }
                }
                sql += ") and visible=1 order by uploaddate desc";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class));
                return res;
            } else {
                String sql = "select * from images where (imgname like ? or story like ?) and visible=1 order by uploaddate desc";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%");
                return res;
            }
        } else {
            return get_imagebean_bykeyword(keyword);
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, int num, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword limit num
        // params: keyword, num, usevisible
        // return: List<ImageBean>
        // check if keyword has space
        if (usevisible) {
            if (keyword.contains(" ")) {
                String[] keywords = keyword.split(" ");
                String sql = "select * from images where (";
                for (int i = 0; i < keywords.length; i++) {
                    sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                    if (i != keywords.length - 1) {
                        sql += " or ";
                    }
                }
                sql += ") and visible=1 order by uploaddate desc limit ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), num);
                return res;
            } else {
                String sql = "select * from images where (imgname like ? or story like ?) and visible=1 order by uploaddate desc limit ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", num);
                return res;
            }
        } else {
            return get_imagebean_bykeyword(keyword, num);
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, int num, int start_index, boolean usevisible) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword from start_index to start_index+num
        // params: keyword, num, usevisible
        // return: List<ImageBean>
        // check if keyword has space
        if (usevisible) {
            if (keyword.contains(" ")) {
                String[] keywords = keyword.split(" ");
                String sql = "select * from images where (";
                for (int i = 0; i < keywords.length; i++) {
                    sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                    if (i != keywords.length - 1) {
                        sql += " or ";
                    }
                }
                sql += ") and visible=1 order by uploaddate desc limit ?, ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
                return res;
            } else {
                String sql = "select * from images where (imgname like ? or story like ?) and visible=1 order by uploaddate desc limit ?, ?";
                List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", start_index, num);
                return res;
            }
        } else {
            return get_imagebean_bykeyword(keyword, num, start_index);
        }
    }

    public static List<ImageBean> get_imagebean_bykeyword (String keyword, int num, int start_index, boolean usevisible, boolean sort_by_likesnumber) throws SQLException {
        // this function is used to get the imageBean of a specific number by keyword from start_index to start_index+num and sort by likesnumber
        // params: keyword, num, start_index, usevisible, sort_by_likesnumber
        // return: List<ImageBean>
        // check if keyword has space
        if (sort_by_likesnumber){
            if (usevisible) {
                if (keyword.contains(" ")) {
                    String[] keywords = keyword.split(" ");
                    String sql = "select * from images where (";
                    for (int i = 0; i < keywords.length; i++) {
                        sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                        if (i != keywords.length - 1) {
                            sql += " or ";
                        }
                    }
                    sql += ") and visible=1 order by likesnumber desc limit ?, ?";
                    List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
                    return res;
                } else {
                    String sql = "select * from images where (imgname like ? or story like ?) and visible=1 order by likesnumber desc limit ?, ?";
                    List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", start_index, num);
                    return res;
                }
            } else {
                if (keyword.contains(" ")) {
                    String[] keywords = keyword.split(" ");
                    String sql = "select * from images where (";
                    for (int i = 0; i < keywords.length; i++) {
                        sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                        if (i != keywords.length - 1) {
                            sql += " or ";
                        }
                    }
                    sql += ") order by likesnumber desc limit ?, ?";
                    List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), start_index, num);
                    return res;
                } else {
                    String sql = "select * from images where (imgname like ? or story like ?) order by likesnumber desc limit ?, ?";
                    List<ImageBean> res = (List<ImageBean>) DBUtils.query(sql, new BeanListHandler(ImageBean.class), "%" + keyword + "%", "%" + keyword + "%", start_index, num);
                    return res;
                }
            }
        } else {
            return get_imagebean_bykeyword(keyword, num, start_index, usevisible);
        }
    }








    public static long get_images_length () throws SQLException {
        // return the number of images
        // params: none
        // return: int
        String sql = "select count(*) from images";
        long res = (long) DBUtils.query(sql, new ScalarHandler());
        return res;
    }

    public static long get_images_length (boolean visible) throws SQLException {
        // return the number of images
        // params: visible
        // return: int
        if (visible) {
            String sql = "select count(*) from images where visible=1";
            long res = (long) DBUtils.query(sql, new ScalarHandler());
            return res;
        } else {
            return get_images_length();
        }
    }

    public static long get_images_length_bykeyword (String keyword) throws SQLException {
        // return the number of images by keyword
        // params: keyword
        // return: int
        // check if keyword has space
        if (keyword.contains(" ")) {
            String[] keywords = keyword.split(" ");
            String sql = "select count(*) from images where (";
            for (int i = 0; i < keywords.length; i++) {
                sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                if (i != keywords.length - 1) {
                    sql += " or ";
                }
            }
            sql += ")";
            long res = (long) DBUtils.query(sql, new ScalarHandler());
            return res;
        } else {
            String sql = "select count(*) from images where imgname like ? or story like ?";
            long res = (long) DBUtils.query(sql, new ScalarHandler(), "%" + keyword + "%", "%" + keyword + "%");
            return res;
        }
    }

    public static long get_images_length_bykeyword (String keyword, boolean usevisible) throws SQLException {
        // return the number of images by keyword
        // params: keyword, usevisible
        // return: int
        // check if keyword has space
        if (usevisible) {
            if (keyword.contains(" ")) {
                String[] keywords = keyword.split(" ");
                String sql = "select count(*) from images where (";
                for (int i = 0; i < keywords.length; i++) {
                    sql += "imgname like '%" + keywords[i] + "%' or story like '%" + keywords[i] + "%'";
                    if (i != keywords.length - 1) {
                        sql += " or ";
                    }
                }
                sql += ") and visible=1";
                long res = (long) DBUtils.query(sql, new ScalarHandler());
                return res;
            } else {
                String sql = "select count(*) from images where (imgname like ? or story like ?) and visible=1";
                long res = (long) DBUtils.query(sql, new ScalarHandler(), "%" + keyword + "%", "%" + keyword + "%");
                return res;
            }
        } else {
            return get_images_length_bykeyword(keyword);
        }
    }
}
