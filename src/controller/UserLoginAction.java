package controller;

import com.opensymphony.xwork2.ActionContext;
import dao.UserDao;
import model.User;

import com.opensymphony.xwork2.ActionSupport;

public class UserLoginAction extends ActionSupport {

    private String username;

    private String password;

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;

    }

    public String execute(){
        UserDao dao = new UserDao();
        User temp = (User)dao.filter("username", "='"+this.getUsername() +"'").first();

        if(temp == null){
            addActionError(getText("user_not_find"));
            return LOGIN;
        }
        else if(!temp.getPassword().equals(getPassword())){
            addActionError(getText("password_error"));
            return LOGIN;
        }
        else
        {
            ActionContext.getContext().getSession().put("user", temp);
            switch (temp.getUser_identity()) {
                case "editor":
                    return "editor";
                case "administrator":
                    return "admin";
                default:
                    return "user";
            }
        }

    }

}