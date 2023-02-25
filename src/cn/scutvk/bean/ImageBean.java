package cn.scutvk.bean;

import cn.scutvk.Utils.DBUtils;

import java.sql.Timestamp;
import java.util.Date;

public class ImageBean {
    private int imgid;
    private int uid;
    private int orderid;
    private String imgname;
    private String story;
    private String stoneurl;
    private double price;
    private Timestamp uploaddate;
    private int likesnumber;
    private Boolean visible;
    private Boolean havesold;

    public int getImgid() {
        return imgid;
    }

    public void setImgid(int imgid) {
        this.imgid = imgid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getImgname() {
        return imgname;
    }

    public void setImgname(String imgname) {
        this.imgname = imgname;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public String getStoneurl() {
        return stoneurl;
    }

    public void setStoneurl(String stoneurl) {
        this.stoneurl = stoneurl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Timestamp getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(Timestamp uploaddate) {
        this.uploaddate = uploaddate;
    }

    public int getLikesnumber() {
        return likesnumber;
    }

    public void setLikesnumber(int likesnumber) {
        this.likesnumber = likesnumber;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    public Boolean getHavesold() {
        return havesold;
    }

    public void setHavesold(Boolean havesold) {
        this.havesold = havesold;
    }



    // functions
    public String getUsername () {
        UserBean userBean = new UserBean();
        userBean.setUid(this.uid);
        userBean = DBUtils.users_getshowbean_byid(userBean);
        return userBean.getUsername();
    }

    public String getAvatarurl () {
        UserBean userBean = new UserBean();
        userBean.setUid(this.uid);
        userBean = DBUtils.users_getshowbean_byid(userBean);
        return userBean.getAvatarurl();
    }
}
