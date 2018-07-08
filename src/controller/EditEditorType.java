package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.TypeDao;
import model.EditorType;
import dao.EditorTypeDao;
import model.Type;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;

public class EditEditorType extends ActionSupport {

    public String [] typelist;

    private int user_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String[] getTypelist() {
        return typelist;
    }

    public void setTypelist(String[] type_list) {
        this.typelist = type_list;
    }

    public String execute() throws IOException {

        String url = "/show_editor_type.action";
        String info = "ok";
        int status = 200;
        if(this.getTypelist() == null){
            status = 500;
            info = "没有选中类型，无法更新!";
        }

        TypeDao dao = new TypeDao();
        EditorTypeDao editorTypeDao = new EditorTypeDao();
        editorTypeDao.delete("publisher", String.format("=%d", this.user_id));
        if(typelist != null) {
            for (String string : typelist) {
                EditorType editorType = new EditorType();
                int id = ((Type) dao.filter("type", "='" + string + "'").first()).getId();
                editorType.setType(id);
                editorType.setPublisher(user_id);
                editorTypeDao.add(editorType);
            }
        }
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        PrintWriter out = ServletActionContext.getResponse().getWriter();
        String json = String.format("{\"status\": %d, \"info\": \"%s\", \"url\": \"%s\"}", status, info, url);
        out.print(json);
        out.flush();
        out.close();
        return SUCCESS;
    }
}
