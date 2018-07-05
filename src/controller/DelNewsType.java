package controller;


import com.opensymphony.xwork2.ActionSupport;
import model.Type;
import dao.TypeDao;

public class DelNewsType extends ActionSupport {

    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String execute() {

        TypeDao dao = new TypeDao();
        if (this.type == null) {
            addActionError("类型找不到!");
            return INPUT;
        }
        int rs = dao.delete(this.type);
        if (rs == 0) {
            addActionError("删除失败!");
            return INPUT;
        }
        return SUCCESS;
    }
}
