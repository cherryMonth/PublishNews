package controller;

import com.opensymphony.xwork2.ActionContext;
import model.Collect;
import dao.CollectDao;
import dao.NewsDao;
import model.News;
import model.Type;
import dao.TypeDao;
import com.opensymphony.xwork2.ActionSupport;
import model.User;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class ShowNewsByType extends ActionSupport {

    private Type type;

    private int total_num;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    private int number = 1;

    public Type getType() {
        return type;
    }

    public Iterator getType_list() {
        return type_list;
    }

    public void setType_list(Iterator type_list) {
        this.type_list = type_list;
    }

    public Iterator type_list;

    public List<Object> getNews_list() {
        return news_list;
    }

    public void setNews_list(List<Object> news_list) {
        this.news_list = news_list;
    }

    public int getTotal_num() {

        return total_num;
    }

    public void setTotal_num(int total_num) {
        this.total_num = total_num;
    }

    private List <Object> news_list;

    private List <Boolean> collect_list = new ArrayList<>();

    public List<Boolean> getCollect_list() {
        return collect_list;
    }

    public void setCollect_list(List<Boolean> collect_list) {
        this.collect_list = collect_list;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String execute() {
        TypeDao dao = new TypeDao();
        NewsDao dao1 = new NewsDao();
        if (getType() == null) {
            this.type = (Type) dao.filter("id", ">-1").first();
        }

        type_list = dao.filter("id", ">-1").all();
        news_list = dao1.paginate(number, 10, "type", String.format("=%d", type.getId()));
        CollectDao dao2 = new CollectDao();
        User user = (User)ActionContext.getContext().getSession().get("user");
        List <Object > temp_list = dao2.filter("user_id", String.format("=%d", user.getId())).getResult();
        for(Object o:news_list){
            News news = (News)o;
            boolean is_collect = false;
            for(Object o1:temp_list){
                Collect c = (Collect)o1;
                if(news.getId() == c.getNews_id()) {
                    is_collect = true;
                    break;
                }
            }
            collect_list.add(is_collect);
        }
        int total = dao1.filter("type", String.format("=%d", type.getId())).getResult().size();
        if (total % 10 == 0)
            total_num = total / 10;
        else
            total_num = total / 10 + 1;
         return SUCCESS;
    }
}
