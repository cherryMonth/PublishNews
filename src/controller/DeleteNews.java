package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.EditorTypeDao;
import dao.NewsDao;
import model.EditorType;
import model.News;
import model.User;

public class DeleteNews extends ActionSupport {

    public int news_id = -1;

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String execute(){

        News news = (News)(new NewsDao().filter("id", String.format("=%d", getNews_id())).first());
        User user = (User)ActionContext.getContext().getSession().get("user");
        EditorTypeDao dao = new EditorTypeDao();
        EditorType editorType = (EditorType)dao.filter("publisher", String.format("=%d", user.getId())).
                filter("type", String.format("=%d", news.getType())).first();
        if(user.getUser_identity().equals("administrator") || (editorType != null && news.getPublisher() == user.getId())){
            new NewsDao().delete(news);
            return SUCCESS;
        }
        return ERROR;
    }
}
