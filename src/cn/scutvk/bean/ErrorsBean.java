package cn.scutvk.bean;
import java.util.HashMap;
import java.util.Map;

public class ErrorsBean {
    private Map<String, String> errors = new HashMap<String, String>();
    public Map<String, String> getErrors() {
        return errors;
    }
    public void setErrors(String errorname, String errorvalue) {
        this.errors.put(errorname, errorvalue);
    }
}
