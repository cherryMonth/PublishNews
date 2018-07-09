package model;

import java.util.Date;

public class Browser {
    private int id = -1;
    private String info;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    private int browser;

    public int getBrowser() {
        return browser;
    }

    public void setBrowser(int browser) {
        this.browser = browser;
    }

    public Date  getDatetime() {
        return datetime;
    }

    private Date datetime;

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}
