package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.NewsDao;

import java.util.List;

public class SearchNews extends ActionSupport {

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public String getSql() {

        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    private String sql;

    private List<Object> list;

    public String execute(){

        NewsDao dao = new NewsDao();
        list = dao.filter("title", "like '%" + sql + "%'").getResult();
        list.addAll(dao.filter("content", "like '%" + sql + "%'").getResult());
        return SUCCESS;
    }
}
