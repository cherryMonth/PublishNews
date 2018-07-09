package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.BrowserDao;
import dao.CommentDao;
import model.*;

import java.util.Date;

public class DeleteComment extends ActionSupport {

    private News news;
    private int commentator;

    public int getCommentator() {
        return commentator;
    }

    public void setCommentator(int commentator) {
        this.commentator = commentator;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String execute() {
        CommentDao dao = new CommentDao();
        User user = (User) ActionContext.getContext().getSession().get("user");
        Comment c = (Comment) (dao.filter("news", String.format("=%d", news.getId())).filter("commentator", String.format("=%d", commentator)).first());
        dao.delete(c);
        Browser browser = new Browser();
        browser.setBrowser(user.getId());
        BrowserDao dao1 = new BrowserDao();
        browser.setInfo("您的" + new Date().toString() + "评论被删除了 <a target='_blank' href='/show_single_news?news.id=" +
                c.getNews() + "'>" + c.getNews() + "</a>");
        dao1.add(browser);
        return SUCCESS;
    }

}
