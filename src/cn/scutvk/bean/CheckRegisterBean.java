package cn.scutvk.bean;
import java.util.HashMap;
import java.util.Map;

public class CheckRegisterBean {
    private String username;
    private String password;
    private String password2;
    private String email;
    private Map<String, String> errors = new HashMap<String, String>();

    public boolean validate() {
        // to validate the data's form
        boolean flag = true;
        if (username == null || username.trim().equals("")) {
            errors.put("username", "请输入姓名");
            flag = false;
        }
        if (password == null || password.trim().equals("")) {
            errors.put("password", "请输入密码");
            flag = false;
        } else if (password.length() > 12 || password.length() < 6) {
            errors.put("password", "字符限制6-12位");
            flag = false;
        }
        if (!password2.equals(password)) {
            errors.put("password2", "两次密码不相同");
            flag = false;
        }
        if (email == null || email.trim().equals("")) {
            errors.put("email", "请输入邮箱");
            flag = false;
        } else if (!email.matches("\\w+@\\w+(\\.\\w+)+")) {
            errors.put("email", "邮箱格式不正确");
            flag = false;
        }
        return flag;
    }

    public void setErrors(String errorsname, String errorsvalue) {
        if (errorsname != null && errorsvalue != null) {
            errors.put(errorsname, errorsvalue);
        }
    }

    public Map<String, String> getErrors() {
        return errors;
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

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
