package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import model.EditorType;
import dao.EditorTypeDao;
import model.Type;
import dao.TypeDao;
import model.User;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CreateNews extends ActionSupport {

    public List<Type> type_list = new ArrayList<>();

    public List<Type> getType_list() {
        return type_list;
    }

    public void setType_list(List<Type> type_list) {
        this.type_list = type_list;
    }

    public String execute() {
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user == null) {
            return LOGIN;
        }
        EditorTypeDao dao = new EditorTypeDao();
        Iterator e = null;
        if (user.getUser_identity().equals("editor")) {
            e = dao.filter("publisher", String.format("=%d", user.getId())).all();
            while (e.hasNext()) {
                TypeDao t = new TypeDao();
                Type t2 = (Type) (t.filter("id", String.format("=%d", ((EditorType) e.next()).getType())).first());
                this.type_list.add(t2);
            }
        } else if (user.getUser_identity().equals("administrator")) {
            TypeDao t = new TypeDao();
            e = t.filter("id", ">-1").all();
            while (e.hasNext()) {
                Type t2 = (Type)e.next();
                this.type_list.add(t2);
            }
        }

        if (this.type_list.size() == 0) {
            addActionError("没有找到您所属的新闻分类，无法创建新闻!");
            return ERROR;
        }
        return SUCCESS;
    }
}
