package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.Result;
import dao.UserDao;
import model.EditorType;
import model.User;
import model.Type;
import dao.EditorTypeDao;
import dao.TypeDao;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShowEditorType extends ActionSupport{

    private Result user_list;

    private List<List<String>> editor_type;

    private Result type_list;

    public Result getUser_list() {
        return user_list;
    }

    public void setUser_list(Result user_list) {
        this.user_list = user_list;
    }

    public List<List<String>> getEditor_type() {
        return editor_type;
    }

    public void setEditor_type(List<List<String>> editor_type) {
        this.editor_type = editor_type;
    }

    public Result getType_list() {
        return type_list;
    }

    public void setType_list(Result type_list) {
        this.type_list = type_list;
    }

    public String execute (){
        this.user_list = new UserDao().filter("id", ">-1").filter("USER_IDENTITY", "='editor'");
        Iterator iter_user = this.user_list.all();
        List<List<String>> temp = new ArrayList<>();
        EditorTypeDao editorTypeDao = new EditorTypeDao();
        while(iter_user.hasNext()){
            User uer = (User)iter_user.next();
            List <String> t = new ArrayList<>();
            Iterator iter = editorTypeDao.filter("publisher", "=" + uer.getId()).all();
            while(iter.hasNext()){
                EditorType t2 = (EditorType)iter.next();
                Type t3  = (Type)new TypeDao().filter("id", String.format("=%d", t2.getType())).first();
                t.add(t3.getType());
            }
            temp.add(t);
        }
        setEditor_type(temp);
        setType_list(new TypeDao().filter("id", ">-1"));
        return SUCCESS;
    }
}
