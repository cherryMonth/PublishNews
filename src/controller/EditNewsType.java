package controller;


import com.opensymphony.xwork2.ActionSupport;
import model.Type;
import dao.TypeDao;
import org.apache.struts2.ServletActionContext;
import java.io.IOException;
import java.io.PrintWriter;

public class EditNewsType extends ActionSupport {

    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String execute() throws IOException {

        String url = "/showNewsType.action";
        String info = "";
        int status = 200;
        int rs = 0;
        TypeDao dao = new TypeDao();
        if (this.type == null) {
            status = 500;
            info = "类型找不到!";
        }
        rs = dao.add(this.type);
        if (rs == 0) {
            status = 500;
            info = "该类型已经存在!";
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
