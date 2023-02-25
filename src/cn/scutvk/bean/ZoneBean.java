package cn.scutvk.bean;

public class ZoneBean {
    private int uid;
    private String signature;
    private int fansnumber;
    private boolean visible;
    private String blogurl;

    public String getBlogurl() {
        return blogurl;
    }

    public void setBlogurl(String blogurl) {
        this.blogurl = blogurl;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getFansnumber() {
        return fansnumber;
    }

    public void setFansnumber(int fansnumber) {
        this.fansnumber = fansnumber;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }
}
