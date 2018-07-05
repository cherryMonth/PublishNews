package controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import model.Type;
import dao.TypeDao;

import java.util.Iterator;

public class ShowNewsTypeAction extends ActionSupport{

    private Iterator list;

    public Iterator getList() {
        return list;
    }

    public void setList(Iterator list) {
        this.list = list;
    }

    public String execute (){
        setList(new TypeDao().filter("id", ">-1").all());

        return SUCCESS;
    }
}
