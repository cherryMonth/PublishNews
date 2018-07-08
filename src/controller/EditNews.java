package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.NewsDao;
import model.News;
import model.User;
import model.EditorType;
import model.Type;
import dao.TypeDao;
import dao.EditorTypeDao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class EditNews extends ActionSupport {

    public List<Type> getType_list() {
        return type_list;
    }

    public void setType_list(List<Type> type_list) {
        this.type_list = type_list;
    }

    public List<Type> type_list = new ArrayList<>();


    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public News news;

    public String execute(){

        news = (News)(new NewsDao().filter("id", String.format("=%d", news.getId())).first());
        User user = (User)ActionContext.getContext().getSession().get("user");
        EditorTypeDao dao = new EditorTypeDao();
        TypeDao t = new TypeDao();
        Iterator e = t.filter("id", ">-1").all();
        while (e.hasNext()) {
            Type t2 = (Type) e.next();
            this.type_list.add(t2);
        }
        EditorType editorType = (EditorType)dao.filter("publisher", String.format("=%d", user.getId())).
                filter("type", String.format("=%d", news.getType())).first();
        if(user.getUser_identity().equals("administrator") || (editorType != null && news.getPublisher() == user.getId())){
            return SUCCESS;
        }
        return ERROR;
    }

}
