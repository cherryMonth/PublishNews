package model;
import java.util.Date;

public class Collect {
    private int id = -1;
    private int user_id;
    private int news_id;
    private Date datetime;

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }
}
