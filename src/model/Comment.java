package model;

import java.util.Date;

public class Comment {
    private int id = -1;
    private  int commentator;
    private int news;
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

    public int getCommentator() {
        return commentator;
    }

    public void setCommentator(int commentator) {
        this.commentator = commentator;
    }

    public int getNews() {
        return news;
    }

    public void setNews(int news) {
        this.news = news;
    }
}
