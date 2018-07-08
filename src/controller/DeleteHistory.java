package controller;

import com.opensymphony.xwork2.ActionSupport;
import dao.BrowserDao;
import org.omg.PortableInterceptor.SUCCESSFUL;

public class DeleteHistory extends ActionSupport {
    private int id = -1;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String execute(){
        BrowserDao dao = new BrowserDao();
        dao.delete("id", String.format("=%d", id));
        return SUCCESS;
    }
}
