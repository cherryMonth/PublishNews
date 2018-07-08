package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import model.User;

public class LogoutAction extends ActionSupport {

    public String execute(){
        User user = (User)ActionContext.getContext().getSession().get("user");
        if(user != null){
            ActionContext.getContext().getSession().remove("user");
            return SUCCESS;
        }
        else{
            addActionError("您没有登录无法注销!");
            return ERROR;
        }
    }

}
