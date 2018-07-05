package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.NewsDao;
import model.News;
import model.User;

public class EditNews extends ActionSupport {

    private News news;

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String execute(){
        User user = (User)ActionContext.getContext().getSession().get("user");
        if (user == null) {
            return LOGIN;
        }

        news.setPublisher(user.getId());
        NewsDao dao = new NewsDao();
        dao.add(news);



        return SUCCESS;
    }

}
