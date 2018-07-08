package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.BrowserDao;
import model.Browser;
import model.User;

import java.util.List;

public class ShowHistory extends ActionSupport {

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    private List<Object> list;

    public String execute(){
        User user = (User)ActionContext.getContext().getSession().get("user");
        BrowserDao browserDao = new BrowserDao();
        list = browserDao.filter("browser", String.format("=%d", user.getId())).getResult();
        return SUCCESS;
    }

}
