package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Browser {
    private int id = -1;
    private String info;

    public int getId() {
        return id;
    }

    public void setId(String id) {
        this.id = Integer.parseInt(id);
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date  getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.datetime = dateFormat.parse(datetime);
    }

    private Date datetime;
}
