package controller;

import com.opensymphony.xwork2.ActionSupport;
import model.Type;
import dao.TypeDao;

public class AddNewsTypeAction extends ActionSupport {

    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String execute(){

        TypeDao dao = new TypeDao();
        if (dao.filter("type", "='" + type.getType() + "'").first() != null) {
            String [] args = {"新闻类型 " + type.getType()};
            addActionError(getText("already_existed", args));
            return INPUT;
        }

        int rs = dao.add(this.type);
        if (rs == 0) {
            String [] args = {type.getType()};
            addActionError(getText("already_existed", args));
            return INPUT;
        }
        return SUCCESS;
    }

}
