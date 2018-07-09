package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.BrowserDao;
import dao.CommentDao;
import model.Browser;
import model.Comment;
import model.News;
import model.User;

import java.util.Date;

public class AddComment extends ActionSupport {

    private Comment comment;

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    private News news = new News();

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public String execute(){

        CommentDao dao = new CommentDao();
        dao.add(comment);
        news.setId(this.comment.getNews());
        User user = (User) ActionContext.getContext().getSession().get("user");
        Browser browser = new Browser();
        browser.setBrowser(user.getId());
        BrowserDao dao1 = new BrowserDao();
        browser.setInfo("您在" + new Date().toString() + "评论了 <a target='_blank' href='/show_single_news?news.id=" +
                comment.getNews() + "'>" + news.getTitle() + "</a>");
        dao1.add(browser);
        return SUCCESS;
    }

}
