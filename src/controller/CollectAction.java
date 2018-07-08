package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.BrowserDao;
import dao.CollectDao;
import model.Browser;
import model.Collect;
import model.User;

import java.util.Date;

public class CollectAction extends ActionSupport {


    private int id;

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String execute() {
        Collect c = new Collect();
        CollectDao dao = new CollectDao();
        c.setNews_id(id);
        User user = (User) ActionContext.getContext().getSession().get("user");
        c.setUser_id(user.getId());
        dao.add(c);
        Browser browser = new Browser();
        browser.setBrowser(user.getId());
        BrowserDao dao1 = new BrowserDao();
        browser.setInfo("您在" + new Date().toString() + "收藏了 <a target='_blank' href='/show_single_news?news.id=" +
                id + "'>" + title + "</a>");
        dao1.add(browser);
        return SUCCESS;
    }
}
