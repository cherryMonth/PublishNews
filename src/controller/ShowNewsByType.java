package controller;

import dao.NewsDao;
import model.Type;
import dao.TypeDao;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Iterator;

public class ShowNewsByType extends ActionSupport {

    private Type type;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    private int number = 1;

    public Type getType() {
        return type;
    }

    public Iterator getType_list() {
        return type_list;
    }

    public void setType_list(Iterator type_list) {
        this.type_list = type_list;
    }

    public Iterator type_list;

    public Iterator getNews_list() {
        return news_list;
    }

    public void setNews_list(Iterator news_list) {
        this.news_list = news_list;
    }

    private Iterator news_list;

    public void setType(Type type) {
        this.type = type;
    }

    public String execute() {
        TypeDao dao = new TypeDao();
        NewsDao dao1 = new NewsDao();
        if (getType() == null) {
            this.type = (Type) dao.filter("id", ">-1").first();
        }
        type_list = dao.filter("id", ">-1").all();
        news_list = dao1.filter("NEWS_TYPE", String.format("=%d", type.getId())).all();
        return SUCCESS;
    }
}
