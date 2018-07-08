package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import model.News;
import dao.NewsDao;
import model.Browser;
import dao.BrowserDao;
import model.User;

import java.util.Date;

public class ShowNewsSingle extends ActionSupport {

    private News news;

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String execute(){

        NewsDao dao = new NewsDao();
        if(news == null) {
            return ERROR;
        }
        else
            news = (News)dao.filter("id", String.format("=%d", news.getId())).first();
            news.setViews(news.getViews() + 1);
            dao.add(news);
            Browser browser = new Browser();
            User user = (User)ActionContext.getContext().getSession().get("user");
            browser.setBrowser(user.getId());
            BrowserDao dao1 = new BrowserDao();
            browser.setInfo("您在" + new Date().toString() + "访问了 <a target='_blank' href='/show_single_news?news.id=" +
                            news.getId() + "'>" + news.getTitle() + "</a>");
            dao1.add(browser);
        return SUCCESS;
    }
}
