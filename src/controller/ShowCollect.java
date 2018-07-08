package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.CollectDao;
import model.Collect;
import model.User;

import java.util.List;

public class ShowCollect extends ActionSupport {

    public List<Object> getCollect_list() {
        return collect_list;
    }

    public void setCollect_list(List<Object> collect_list) {
        this.collect_list = collect_list;
    }

    List<Object> collect_list;


    public String execute() {
        User user = (User) ActionContext.getContext().getSession().get("user");
        collect_list = new CollectDao().filter("user_id", String.format("=%d", user.getId())).getResult();
        return SUCCESS;
    }

}
