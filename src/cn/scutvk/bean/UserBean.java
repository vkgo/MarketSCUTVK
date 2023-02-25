package cn.scutvk.bean;

import java.sql.Timestamp;

public class UserBean {
    private String username;
    private String password;
    private String email;
    private int uid;
    private String avatarurl;
    private int sex;
    private Timestamp signupdate;
    private Timestamp latestlogindate;

    public Timestamp getSignupdate() {
        return signupdate;
    }

    public void setSignupdate(Timestamp signupdate) {
        this.signupdate = signupdate;
    }

    public Timestamp getLatestlogindate() {
        return latestlogindate;
    }

    public void setLatestlogindate(Timestamp latestlogindate) {
        this.latestlogindate = latestlogindate;
    }

    public String getAvatarurl() {
        return avatarurl;
    }

    public void setAvatarurl(String avatarurl) {
        this.avatarurl = avatarurl;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
