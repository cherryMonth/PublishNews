package controller;
import com.opensymphony.xwork2.ActionSupport;
import model.User;
import dao.UserDao;

public class EditUserInfo extends ActionSupport {

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String execute(){

        return SUCCESS;
    }

}
