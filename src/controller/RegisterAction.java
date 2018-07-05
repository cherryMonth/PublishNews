package controller;

import com.opensymphony.xwork2.ActionContext;
import dao.UserDao;
import model.User;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {

    private User user;

    private String repass;

    public String getRepass() {
        return repass;
    }

    public void setRepass(String repass) {
        this.repass = repass;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String execute() {

        UserDao dao = new UserDao();

        if (dao.filter("username", "='" + user.getUsername() + "'").first() != null) {
            addActionError(getText("user_already_existed"));
            return INPUT;
        }

        int rs = dao.add(this.getUser());
        if (rs == 0) {
            addActionError(getText("add_user_failed"));
            return INPUT;
        }

        this.user = (User) dao.filter("username", "='" + user.getUsername() + "'").first();
        ActionContext.getContext().getSession().put("user", this.user);
        return SUCCESS;
    }

}
