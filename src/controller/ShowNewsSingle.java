package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.CommentDao;
import model.News;
import dao.NewsDao;
import model.Browser;
import dao.BrowserDao;
import model.User;

import java.util.Date;
import java.util.List;

public class ShowNewsSingle extends ActionSupport {

    private News news;

    public List<Object> getComment_list() {
        return comment_list;
    }

    public void setComment_list(List<Object> comment_list) {
        this.comment_list = comment_list;
    }

    private List<Object> comment_list;

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
            comment_list = new CommentDao().filter("news", String.format("=%d", news.getId())).getResult();
        return SUCCESS;
    }
}
